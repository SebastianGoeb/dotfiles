on run argv
  tell application "System Events"
    set pictures folder of every desktop to item 1 of argv
    set picture rotation of every desktop to item 2 of argv
    set random order of every desktop to item 3 of argv
    set change interval of every desktop to item 4 of argv
  end tell
end run
