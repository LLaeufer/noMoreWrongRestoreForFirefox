#!/usr/bin/bash

for profile in /home/*/.mozilla/firefox/*.default-release/; do
    path=${profile::-1}
    echo "$path"
    if ! grep -q "user_pref(\"browser.startup.page\"," "$path/prefs.js"; then
        # We do not just copy the file over, but overwrite its contents. Since we dont change filepermissions this way!
        printf "$(</usr/share/noMoreWrongRestoreForFirefox/sessionCheckpoints.json)" > "$path/sessionCheckpoints.json"
        
        # Make sessionstore look like it would when exiting normally
        if [ -f "$path/sessionstore-backups/recovery.jsonlz4" ]; then
            rm "$path/sessionstore.jsonlz4"
            # rm "$path/sessionstore-backups/previous.jsonlz4"
            rm "$path/sessionstore-backups/recovery.baklz4" 
            mv "$path/sessionstore-backups/recovery.jsonlz4" "$path/sessionstore.jsonlz4"
        fi
        
        # Patch prefs.js to not resume the next session
        sed -i "s/user_pref(\"browser.sessionstore.resume_session_once\", true);/user_pref(\"browser.sessionstore.resume_session_once\", false);/g" "$path/prefs.js"
    fi
done
