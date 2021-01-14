# urls
#z::Run https://www.autohotkey.com  ; Win+Z
#F2::Run https://docs.google.com/spreadsheets/d/1vy0A_Gu8u_Ba5tQbCcEbjuly0BTb6QVW7CKOIl47LJQ/edit#gid=449944160  ; Win+F2



# run notepad with Control-Alt-N
^!n::  ; Ctrl+Alt+N
if WinExist("Untitled - Notepad")
    WinActivate
else
    Run Notepad
return



# text abbreviations
::btw::by the way
::mdimg::<div style="text-align:center;"><em></em></div><img src="" />



# date and time
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

:*:]p::  ; This hotstring replaces "]p"
SendInput {Raw} [philanderson888](https://github.com/philanderson888)
return


# stop this app running
^!m::  ; Ctrl+Alt+F5
    ExitApp
return