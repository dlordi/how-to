; ! = alt
; sc034 = punto

; +-----+-----+-----+-----+-----+-----+-----+-----+-----+-----+-----+-----+-----+-----------+
; |  ~  |  !  |  @  |  #  |  $  |  %  |  ^  |  &  |  *  |  (  |  )  |  _  |  +  |           |
; |  `  |  1  |  2  |  3  |  4  |  5  |  6  |  7  |  8  |  9  |  0  |  -  |  =  | Backspace |
; +-----+-----+-----+-----+-----+-----+-----+-----+-----+-----+-----+--+--+--+--+--+--------+
; |                                                                    |  {  |  }  |   |    |
; |                                                                    |  [  |  ]  |   \    |
; |                                                                +---+-+---+-+---+--------+
; |                                                                |  :  |  "  |            |
; |                                                                |  ;  |  '  |   Enter    |
; |                                                       +-----+--+--+--+--+--+------------+
; |                                                       |  <  |  >  |  ?  |               |
; |                                                       |  ,  |  .  |  /  |    Shift      |
; +-------------------------------------------------------+-----+-----+-----+---------------+

; ^+t::
;     WinGetClass, win_class, A
;     If win_class In #32770,CabinetWClass
;     {
;         MouseClick, Right
;         WinWait, ahk_class #32768
;         Send, u
;         ; Send, {Up}
;         ; Send, {Up}
;         ; Send, {Up}

;         ; ; recuperare il percorso completo dalla barra degli indirizzi
;         ; Send, {F4}
;         ; ControlGetText, currentexpPath, Edit1, ahk_class %win_class%
;         ; ; dare il focus al file panel
;         ; Send, {Escape}
;         ; Send, {Escape}
;         ; Send, {Escape}
;         ; Send, {Escape}
;         ; Send, {Escape}
;         ; Send, {Escape}
;         ; Send, {Tab}
;         ; Send, {Down}
;         ; ControlFocus, DirectUIHWND3, A
;         ; SendInput, {Space}
;         ; ; creare un nuovo file
;         ; ; TODO
;         ; ; predisporsi per la modifica del nome
;         ; ; TODO
;     }
;     return

; genera il carattere ` alla pressione di ALT+\
!\::
    Send, ``
    return

; genera il carattere ~ alla pressione di ALT+| (che è la stessa cosa di ALT+SHIFT+\)
!|::
    Send, ~
    return

; genera il carattere < alla pressione di ALT+, (per tasteria con layout US)
!,::
    Send, <
    return

; genera il carattere > alla pressione di ALT+. (per tasteria con layout US)
!sc034::
    Send, >
    return

; attiva/disattiva "sempre in primo piano" alla pressione di WIN e tasto destro del mouse
LWin & RButton::
    MouseGetPos,,, EWD_MouseWin
    WinSet, AlwaysOnTop, , ahk_id %EWD_MouseWin%
    ; WinSet, AlwaysOnTop, , A  ; A = agisce sulla finestra attiva
    return

; spostamento alla pressione di WIN e tasto sinistro del mouse
LWin & LButton::
    CoordMode, Mouse  ; Switch to screen/absolute coordinates.
    MouseGetPos, EWD_MouseStartX, EWD_MouseStartY, EWD_MouseWin
    WinGetPos, EWD_OriginalPosX, EWD_OriginalPosY,,, ahk_id %EWD_MouseWin%
    WinGet, EWD_WinState, MinMax, ahk_id %EWD_MouseWin% 
    if EWD_WinState = 0  ; Only if the window isn't maximized
        SetTimer, EWD_WatchMouse, 10 ; Track the mouse as the user drags it.
    return

    EWD_WatchMouse:
    GetKeyState, EWD_LButtonState, LButton, P
    if EWD_LButtonState = U  ; LButton has been released, so drag is complete.
    {
        SetTimer, EWD_WatchMouse, Off
        return
    }
    GetKeyState, EWD_LWinState, LWin, P
    if EWD_LWinState = U  ; LWin has been released, so drag is complete.
    {
        SetTimer, EWD_WatchMouse, Off
        return
    }
    GetKeyState, EWD_EscapeState, Escape, P
    if EWD_EscapeState = D  ; Escape has been pressed, so drag is cancelled.
    {
        SetTimer, EWD_WatchMouse, Off
        WinMove, ahk_id %EWD_MouseWin%,, %EWD_OriginalPosX%, %EWD_OriginalPosY%
        return
    }
    ; Otherwise, reposition the window to match the change in mouse coordinates
    ; caused by the user having dragged the mouse:
    CoordMode, Mouse
    MouseGetPos, EWD_MouseX, EWD_MouseY
    WinGetPos, EWD_WinX, EWD_WinY,,, ahk_id %EWD_MouseWin%
    SetWinDelay, -1  ; Makes the below move faster/smoother.
    WinMove, ahk_id %EWD_MouseWin%,, EWD_WinX + EWD_MouseX - EWD_MouseStartX, EWD_WinY + EWD_MouseY - EWD_MouseStartY
    EWD_MouseStartX := EWD_MouseX  ; Update for the next timer-call to this subroutine.
    EWD_MouseStartY := EWD_MouseY
    return
