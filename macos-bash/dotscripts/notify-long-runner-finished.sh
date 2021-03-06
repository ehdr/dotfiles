#!/usr/bin/env osascript
# Display a MacOS notification when a long-running command has finished,
# if Iterm2 is no longer the frontmost application.
#
# From: http://frantic.im/notify-on-completion

on run argv
  tell application "System Events"
    set frontApp to name of first application process whose frontmost is true
    if frontApp is not in { "Terminal", "iTerm2" } then
      set notifTitle to item 1 of argv
      set notifBody to "succeded"
      set errorCode to item 2 of argv
      if errorCode is not "0"
        set notifBody to "failed with error code " & errorCode
      end if
      display notification notifBody with title notifTitle
    end if
  end tell
end run
