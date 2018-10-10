# json-service
An automator workflow that acts as a system-wide text selection service in macOS. This will allow you to save any text selection and save it as a json file. If `jq` is installed (optional), the json will automatically be validated  prior to saving. It appears in the Services menu as **Selection to json file**. 
## Usage
1. Select any text representing a json
2. Choose **Selection to json file** from the **Services** menu
3. Choose a file name and destination in the file save dialog
## Advanced Usage
Assign a hotkey to the service by following these [instructions][].  
(note: the hotkey has to include the command key in order for it to work, for example, ⌘-F19 )
## Installation
1. Grab latest version from [here][]
2. Unzip file
3. Double-click the resulting file and you will be prompted to install
## Optional Installation
For JSON validation install jq `brew install jq`

This quick look plugin is very helpful `brew install quicklook-json` 


[here]: https://github.com/davidspiegelman/json-service/releases/latest
[instructions]: https://www.macworld.com/article/1163996/software-utilities/how-to-use-services-in-mac-os-x.html
