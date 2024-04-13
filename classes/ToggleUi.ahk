class ToggleUi {
    static isLangModeEnabledByShiftSpace := true
    static isWinKeyDisabled := false
    
    static init() {
        ui := Gui(,"Panel",)
        ui.Opt('+AlwaysOnTop')
        
        langModeToggle := ui.Add('Checkbox', 'w200 h20', 'Shift + Space로 언어 변경')
        langModeToggle.Value := this.isLangModeEnabledByShiftSpace
        langModeToggle.OnEvent('Click', clickLangModeToggle)
        clickLangModeToggle(el, _) {
            this.isLangModeEnabledByShiftSpace := el.Value
            TrayTip('panel', '언어 변경 ' . (this.isLangModeEnabledByShiftSpace ? '허용' : '잠금'))
        }
        
        winToggle := ui.Add('Checkbox', 'w200 h20', 'Win키 잠금')
        winToggle.Value := this.isWinKeyDisabled
        winToggle.OnEvent('Click', clickWinToggle)
        clickWinToggle(el, _) {
            this.isWinKeyDisabled := el.Value
            TrayTip('panel', 'win키 ' . (this.isWinKeyDisabled ? '잠금' : '허용'))
        }
        ui.Show("w200 h300")
    }
}