; # urls
; # win+c opens Cortana!
; # win+e opens File Explorer
; hotkeys at https://www.autohotkey.com/docs/Hotkeys.htm 
; # is windows 
; ! is Alt 
; ^ is Control 
; + is Shift 
#J::Run https://www.notion.so/philanderson888/2894534c22a44c1c903aa47f75bb4842?v=06febe16330543b7a9f14ed0b8c4697b  ; Win+J ;  Win J opens Daily Journal
#w::Run https://web.whatsapp.com/  ; Win+w
#z::Run https://www.autohotkey.com  ; Win+Z
#F2::Run https://www.notion.so/philanderson888/GTD-dashboard-780542770dc64c9cb50062f3c0885d9c  ; Win+F2
#!E::Run https://outlook.live.com/mail/inbox ; Win+Alt+E
!+E::Run https://outlook.live.com/mail/inbox ; Alt+Shift+E
; run notepad with Control-Alt-N
^!n::  ; Ctrl+Alt+N
if WinExist("Untitled - Notepad")
    WinActivate
else
    Run Notepad
return

; text abbreviations
::btw::by the way
::mdimg::<div style="text-align:center;"><em></em></div><img src="" />
::conlog::console.log(

; date and time
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

:*:]l::  ; This hotstring replaces "]l"
SendInput {Raw} console.log()
return

; stop AutoHotKey from running
^!m::  ; Ctrl+Alt+F5
    ExitApp
return