; I love this and store the file either in Documents folder or in scripts folder
#z::Run https://www.autohotkey.com  ; Win+Z
#F2::Run https://docs.google.com/spreadsheets/d/1vy0A_Gu8u_Ba5tQbCcEbjuly0BTb6QVW7CKOIl47LJQ/edit#gid=449944160  ; Win+F2

^!n::  ; Ctrl+Alt+N
if WinExist("Untitled - Notepad")
    WinActivate
else
    Run Notepad
return

::btw::by the way

:*:]d::  ; This hotstring replaces "]d" with the current date and time via the commands below.
FormatTime, CurrentDateTime,, dddd d MMM yyyy h:mm tt  ; 
SendInput %CurrentDateTime%
return
