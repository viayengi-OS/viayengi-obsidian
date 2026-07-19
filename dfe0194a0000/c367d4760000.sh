#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Open Dash
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 🤖

# Documentation:
# @raycast.author vang_nguyen
# @raycast.authorURL https://raycast.com/vang_nguyen


osascript -e 'tell application "System Events" to keystroke "y" using {command down,option down}'
osascript -e 'delay 0.15'
path=$(pbpaste)


display=$(/opt/homebrew/bin/yabai -m query --displays --display | /opt/homebrew/bin/jq ".index")
filename="${path##*/}"      # strip directories

if [[ "$filename" == *.* ]]; then
    case "${filename##*.}" in
      js)
        echo "javascript:" | pbcopy
        ;;
      py)
        echo "python3:" | pbcopy
        ;;
      *)
        /opt/homebrew/bin/terminal-notifier -title "Raycast" -message "Extension is not available ( Please set up it )"
        echo "default:" | pbcopy
        ;;
    esac
    
    osascript -e 'tell application "System Events" to keystroke "v" using {command down,option down}'
    osascript -e 'delay 0.15'
    osascript -e 'tell application "System Events" to keystroke "v" using {command down}'
    osascript -e 'delay 0.25'
    
    if [ "$display" -eq 1 ]
    	then /opt/homebrew/bin/yabai -m window --display 2 && osascript -e 'tell application "System Events" to tell process "Dash" to set frontmost to true' && /opt/homebrew/bin/yabai -m display --focus 2 && /opt/homebrew/bin/yabai -m window --grid 1:1:0:0:1:1; /opt/homebrew/bin/cliclick m:=-573,=978
    elif [ "$display" -eq 2 ]
    	then  /opt/homebrew/bin/yabai -m window --display 1 && osascript -e 'tell application "System Events" to tell process "Dash" to set frontmost to true' && /opt/homebrew/bin/yabai -m display --focus 1 && /opt/homebrew/bin/yabai -m window --grid 1:1:0:0:1:1; /opt/homebrew/bin/cliclick m:1200,618
    else 
    	/opt/homebrew/bin/yabai -m window --display 3 && /opt/homebrew/bin/yabai -m display --focus 3 && /opt/homebrew/bin/yabai -m window --grid 1:1:0:0:1:1
    fi
    
    
else
    /opt/homebrew/bin/terminal-notifier -title "Raycast" -message "Open Dash without any file path"
    if [ "$display" -eq 1 ]
    	then osascript -e 'tell application "System Events" to tell process "Dash" to set frontmost to true' && yabai -m window --display 2 && yabai -m display --focus 2 && yabai -m window --grid 1:1:0:0:1:1; cliclick m:=-573,=978
    elif [ "$display" -eq 2 ]
    	then osascript -e 'tell application "System Events" to tell process "Dash" to set frontmost to true' && yabai -m window --display 1 && yabai -m display --focus 1 && yabai -m window --grid 1:1:0:0:1:1; cliclick m:1200,618
    else 
    	osascript -e 'tell application "System Events" to tell process "Dash" to set frontmost to true' && yabai -m window --display 3 && yabai -m display --focus 3 && yabai -m window --grid 1:1:0:0:1:1
    fi
fi






#display=$(/opt/homebrew/bin/yabai -m query --displays --display | /opt/homebrew/bin/jq ".index")