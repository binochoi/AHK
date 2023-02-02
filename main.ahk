isShiftSpaceLangModeEnabled := true
^#g::
    isShiftSpaceLangModeEnabled := !isShiftSpaceLangModeEnabled
    title := "shift + space lang trans mode"
    TrayTip, %title%, % isShiftSpaceLangModeEnabled ? "enable" : "disable"
return
+Space::
    if(isShiftSpaceLangModeEnabled == false) {
        return
    }
    Send {SC1F2}
return
; 전체화면 (F11)
^#MButton::
#MButton::
^#Enter::
#Enter::
    SendInput {F11}
return

; ctrl + Win + 스크롤 올림 & 내림
; 다른 데스크탑으로 이동 (up & down)
+#WheelUp::
    SendInput +#{Left}
return
+#WheelDown::
    SendInput +#{Right}
return

; Ctrl + Win + 스크롤 올림
; 이전 데스크탑
^#WheelDown::
    SendInput ^#{Right}
return
; Ctrl + Win + 스크롤 내림
; 다음 데스크탑
^#WheelUp::
    SendInput ^#{Left}
return
; Ctrl + Win + W
; 데스크톱 닫기
^#w::
    SendInput ^#{F4}
return

; Win + W
; 프로그램 닫기
#w::
    SendInput !{F4}
return

; Alt + Win + Z
; 볼륨 높이기
!#z::
    SendInput {Volume_Up 4}
return
; Alt + Win + X
; 볼륨 낮추기
!#x::
    SendInput {Volume_Down 4}
return
!#c::Volume_mute
return

; Win + Esc
; Win + `
; 터미널 열기
#Esc::
    SendInput #{``}
return


; Win + F 피드백 허브, 코타나 무시
#f:: ; feedback hub
#c:: ; cortana
#h:: ; 개 쓸 데 없는거
return
