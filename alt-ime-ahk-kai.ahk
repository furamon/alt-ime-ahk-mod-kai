#Requires Autohotkey v2.0

; 左右 Alt キーの空打ちで「変換・無変換」を送る君
;
; 左 Alt キーの空打ちで「無変換」
; 右 Alt キーの空打ちで「変換」
; Alt キーを押している間に他のキーを打つと通常の Alt キーとして動作
;
; Author: Furamon
; Original author:     nekocodeX   https://github.com/nekocodeX/alt-ime-ahk-mod
; Original author:     karakaram   http://www.karakaram.com/alt-ime-on-off

#Include "IME.ahk"

; Razer Synapseなど、キーカスタマイズ系のツールを併用しているときのエラー対策
A_MaxHotkeysPerInterval := 350

; 既存のインスタンスが存在する場合、終了して新たにインスタンスを開始
#SingleInstance Force

; メニュー項目
Tray := A_TrayMenu
Tray.Add(A_ScriptName, AppName)
Tray.Disable(A_ScriptName)
Tray.Default := A_ScriptName
Tray.Add()
Tray.Add("Check for Updates...", CheckForUpdates)
Tray.Add("GitHub Repo / Readme", GitHubRepoReadme)
Tray.Add()
Tray.Delete() ; V1toV2: not 100% replacement of NoStandard, Only if NoStandard is used at the beginning
Tray.AddStandard()
Return

AppName(A_ThisMenuItem, A_ThisMenuItemPos, MyMenu)
{ ; V1toV2: Added bracket
    Return
} ; V1toV2: Added Bracket before label

CheckForUpdates(A_ThisMenuItem, A_ThisMenuItemPos, MyMenu)
{ ; V1toV2: Added bracket
    Run("https://github.com/furamon/alt-ime-ahk-mod-kai/releases/latest")
    Return
} ; V1toV2: Added Bracket before label

GitHubRepoReadme(A_ThisMenuItem, A_ThisMenuItemPos, MyMenu)
{ ; V1toV2: Added bracket
    Run("https://github.com/furamon/alt-ime-ahk-mod-kai")
    Return
} ; V1toV2: Added Bracket before hotkey or Hotstring

; 主要なキーを HotKey に設定し、何もせずパススルーする*~a::
*~b::
*~c::
*~d::
*~e::
*~f::
*~g::
*~h::
*~i::
*~j::
*~k::
*~l::
*~m::
*~n::
*~o::
*~p::
*~q::
*~r::
*~s::
*~t::
*~u::
*~v::
*~w::
*~x::
*~y::
*~z::
*~1::
*~2::
*~3::
*~4::
*~5::
*~6::
*~7::
*~8::
*~9::
*~0::
*~F1::
*~F2::
*~F3::
*~F4::
*~F5::
*~F6::
*~F7::
*~F8::
*~F9::
*~F10::
*~F11::
*~F12::
*~`::
*~~::
*~!::
*~@::
*~#::
*~$::
*~%::
*~^::
*~&::
*~*::
*~(::
*~)::
*~-::
*~_::
*~=::
*~+::
*~[::
*~{::
*~]::
*~}::
*~\::
*~|::
*~;::
*~'::
*~"::
*~,::
*~<::
*~.::
*~>::
*~/::
*~?::
*~Esc::
*~Tab::
*~Space::
*~Left::
*~Right::
*~Up::
*~Down::
*~Enter::
*~PrintScreen::
*~Delete::
*~Home::
*~End::
*~PgUp::
*~PgDn::
{ ; V1toV2: Added bracket
    Return ; 上部メニューがアクティブになるのを抑制 / Xbox Game Bar 起動用仮想キーコードとのバッティング回避 (vk07 -> vkFF)
} ; V1toV2: Added Bracket before hotkey or Hotstring
*~LAlt::
{ ; V1toV2: Added bracket
    SendInput("{Blind}{vk1D}") ; 左 Alt 空打ちで「無変換」
} ; V1toV2: Added Bracket before hotkey or Hotstring
*~RAlt::
{ ; V1toV2: Added bracket
    SendInput("{Blind}{vk1C}") ; 右 Alt 空打ちで「変換」
} ; V1toV2: Added Bracket before hotkey or Hotstring
LAlt up::
{ ; V1toV2: Added bracket
    if (A_PriorHotkey == "*~LAlt") {
        IME_SET(0)
    }
    Return
} ; V1toV2: Added Bracket before hotkey or Hotstring
RAlt up::
{ ; V1toV2: Added bracket
    if (A_PriorHotkey == "*~RAlt") {
        IME_SET(1)
    }
    Return
} ; V1toV2: Added Bracket before hotkey or Hotstring
