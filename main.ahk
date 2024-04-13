isLangModeEnabledByShiftSpace := true
updateIsLangModeEnabledByShiftSpace(bool) {
    global isLangModeEnabledByShiftSpace
    isLangModeEnabledByShiftSpace := bool
}
isWinKeyDisabled := false
updateIsWinKeyDisabled(bool) {
    global isWinKeyDisabled
    isWinKeyDisabled := bool
}

; Win + F1
#F1::
{
    ui := Gui(,"Panel",)
    ui.Opt('+AlwaysOnTop')
    
    langModeToggle := ui.Add('Checkbox', 'w200 h20', 'Shift + Space로 언어 변경')
    langModeToggle.Value := isLangModeEnabledByShiftSpace
    langModeToggle.OnEvent('Click', clickLangModeToggle)
    clickLangModeToggle(el, _) {
        updateIsLangModeEnabledByShiftSpace(el.Value)
        TrayTip('panel', '언어 변경 ' . (isLangModeEnabledByShiftSpace ? '허용' : '잠금'))
    }
    
    winToggle := ui.Add('Checkbox', 'w200 h20', 'Win키 잠금')
    winToggle.Value := isWinKeyDisabled
    winToggle.OnEvent('Click', clickWinToggle)
    clickWinToggle(el, _) {
        updateIsWinKeyDisabled(el.Value)
        TrayTip('panel', 'win키 ' . (isWinKeyDisabled ? '잠금' : '허용'))
    }
    ui.Show("w200 h300")
}

+Space::
{
    if(isLangModeEnabledByShiftSpace == false) {
        Send("+{Space}")
        return
    }
    Send("{SC1F2}")
}

; 전체화면 (F11)
^#MButton::
#MButton::
^#Enter::
#Enter::
{
    SendInput("{F11}")
}

; ctrl + Win + 스크롤 올림 & 내림
; 다른 데스크탑으로 이동 (up & down)
+#WheelUp::
{
    SendInput("+#{Left}")
}
+#WheelDown::
{
    SendInput("+#{Right}")
}
; Win + 스크롤 올림 & 내림
; 프로그램 최대화 최소화
#WheelUp::
{
    SendInput("#{Up}")
}
#WheelDown::
{
    SendInput("#{Down}")
}
; rename current desktop
; ^#r::
;     InputBox, name, rename current desktop title
;     MsgBox, %name%
; return

; Ctrl + Win + 스크롤 올림
; 이전 데스크탑
^#WheelDown::
^#Tab::
{
    SendInput("^#{Right}")
}
; Ctrl + Win + 스크롤 내림
; 다음 데스크탑
^#WheelUp::
^+#Tab::
{
    SendInput("^#{Left}")
}
; Ctrl + Win + W
; 데스크톱 닫기
^#w::
{
    SendInput("^#{F4}")
}
; Win + W
; 프로그램 닫기
#w::
{
    SendInput("!{F4}")
}
; Alt + Win + X
; 볼륨 높이기
!#x::
{
    SendInput("{Volume_Up 2}")
}
; Alt + Win + Z
; 볼륨 낮추기
!#z::
{
    SendInput("{Volume_Down 2}")
}
!#c::
{
    SoundSetMute(-1)
}

; Win + Esc
; Win + `
; 터미널 열기
#Esc::
{
    SendInput("#{``}")
}


; Win + F 피드백 허브, 코타나 무시
!#f:: ; feedback hub
#c:: ; cortana
#h:: ; 개 쓸 데 없는거
{
    return
}
