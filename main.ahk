#Include './classes/ToggleUi.ahk'

; Win + F1
#F1::ToggleUi.init()

^Space::
{
    if(ToggleUi.isLangModeEnabledByShiftSpace == false) {
        Send("+{Space}")
        return
    }
    Send("{SC1F2}")
}

; 한영키 capslockd으로 변경
; link: `https://www.clien.net/service/board/lecture/18685790`
capslock:: {
    While (GetKeyState("CapsLock", "P")) { ;키 눌림을 물리적으로 유지하는 동안
        if (A_TimeSinceThisHotkey >= 300) { ;이 Hotkey 실행 후 300ms(0.3s) 지났다면
            SetCapsLockState !GetKeyState("CapsLock", "T") ;CapsLock 토글
            KeyWait("CapsLock") ;키 릴리즈까지 대기
            Return ;Hotkey  종료
        }
    }

    Send("{vk15sc1F2}") ;한영키 전달
}

; 전체화면 (F11)
^#MButton::
#MButton::
^#Enter::
#Enter::SendInput("{F11}")
; ctrl + Win + 스크롤 올림 & 내림
; 다른 데스크탑으로 이동 (up & down)
+#WheelUp::SendInput("+#{Left}")
+#WheelDown::SendInput("+#{Right}")
; Win + 스크롤 올림 & 내림
; 프로그램 최대화 최소화
#WheelUp::SendInput("#{Up}")
#WheelDown::SendInput("#{Down}")
; Ctrl + Win + 스크롤 올림
; 이전 데스크탑
^#WheelDown::
^#Tab::SendInput("^#{Right}")
; Ctrl + Win + 스크롤 내림
; 다음 데스크탑
^#WheelUp::
^+#Tab::SendInput("^#{Left}")
; Ctrl + Win + W
; 데스크톱 닫기
^#w::SendInput("^#{F4}")
; Win + W
; 프로그램 닫기
#w::SendInput("!{F4}")
; Alt + Win + X
; 볼륨 높이기
!#x::SendInput("{Volume_Up 2}")
; Alt + Win + Z
; 볼륨 낮추기
!#z::SendInput("{Volume_Down 2}")
!#c::SoundSetMute(-1)

; Win + Esc
; Win + `
; 터미널 열기
#Esc::SendInput("#{``}")
; Win + F 피드백 허브, 코타나 무시
!#f:: ; feedback hub
#h:: ; 개 쓸 데 없는거
^#s:: ; speech recognition
{
    return
}
