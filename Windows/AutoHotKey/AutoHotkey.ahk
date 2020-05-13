; I love this and store the file either in Documents folder or in scripts folder
#z::Run https://www.autohotkey.com  ; Win+Z
#F2::Run https://docs.google.com/spreadsheets/d/1vy0A_Gu8u_Ba5tQbCcEbjuly0BTb6QVW7CKOIl47LJQ/edit#gid=449944160  ; Win+F2

#SingleInstance

^!n::  ; Ctrl+Alt+N
if WinExist("Untitled - Notepad")
    WinActivate
else
    Run Notepad
return

::btw::by the way
::btd::by the ditch
::mdi::<div style="text-align:center;"><em></em></div><img src="" />

:*:]d::  ; This hotstring replaces "]d" with the current date and time via the commands below.
FormatTime, CurrentDateTime,, dddd d MMM yyyy h:mm tt  ; 
SendInput %CurrentDateTime%
return

:*:]e::  ; This hotstring replaces "]e" with the current date and time via the commands below.
FormatTime, CurrentDateTime,, dddd d MMM yyyy h:mm tt  ; 
SendInput {Raw}### %CurrentDateTime%
return


:*:]f::  ; This hotstring replaces "]f" with the current time
FormatTime, CurrentDateTime,, h:mm tt  ; 
SendInput {Raw} %CurrentDateTime%
return




^!m::  ; Ctrl+Alt+F5
    ExitApp
return