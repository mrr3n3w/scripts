#!/bin/bash
/osascript 2>/dev/null <<EOF
  tell application "System Events"
      tell process "Terminal" to keystroke "t" using command down
    end tell
EOF

ssh -L 5555:10.1.144.5:9999 jrowe@oksun7.okanagan.bc.ca 
