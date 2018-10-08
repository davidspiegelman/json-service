on run {input, parameters}
	
	set thePropertyListFilePath to POSIX path of (path to home folder) & "/Library/Preferences/com.github.davidspiegelman.json-service.plist"
	
	tell application "System Events"
		if exists file thePropertyListFilePath then
			tell property list file thePropertyListFilePath
				set defaultPath to value of property list item "default_path"
			end tell
			
		else
			set defaultPath to POSIX path of (path to documents folder)
			set theParentDictionary to make new property list item with properties {kind:record}
			set thePropertyListFile to make new property list file with properties {contents:theParentDictionary, name:thePropertyListFilePath}
			
			tell property list items of thePropertyListFile
				make new property list item at end with properties {kind:string, name:"default_path", value:defaultPath}
			end tell
		end if
	end tell
	
	set newPath to defaultPath
	
	try
		set resultFile to (choose file name with prompt "Save As File" default name ("untitled.json") default location defaultPath) as text
		if resultFile does not end with ".json" then set resultFile to resultFile & ".json"
		
		try
			set the open_target_file to open for access file resultFile with write permission
			set eof of the open_target_file to 0
			write input to the open_target_file as «class utf8» starting at eof
			close access the open_target_file
			
			set jsonFile to resultFile as alias
			tell application "Finder"
				set file type of jsonFile to "JSON"
			end tell
			set newPath to POSIX path of ((resultFile & "::") as alias)
			
		on error error_string
			try
				close access file resultFile
				
			end try
			display dialog (error_string)
			
		end try
	end try
	
	if newPath is not defaultPath then
		tell application "System Events"
			tell property list file thePropertyListFilePath
				set value of property list item "default_path" to newPath
			end tell
		end tell
	end if
end run
