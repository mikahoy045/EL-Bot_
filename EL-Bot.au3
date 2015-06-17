#RequireAdmin
#AutoIt3Wrapper_UseX64=n
;#pragma compile(Icon, "mikah.ico")
#pragma compile(FileDescription, Mikah - East Legend Bot)
#pragma compile(ProductName, East Legend Bot - By Mikah)
#pragma compile(ProductVersion, 0.0.1)
#pragma compile(FileVersion, 0.0.1)

#include <GUIConstants.au3>

$sBotVersion = "0.0.1"
$sBotTitle = "East Legend Bot - Mikah v" & $sBotVersion

;~ If _Singleton($sBotTitle, 1) = 0 Then
;~  	MsgBox(0, 'Bot Sudah Jalan', 'Bot sudah dijalankan sebelumnya, silakan cek sistem tray dan matikan')
;~  	Exit
;~ EndIf

; Event registration
  GUIRegisterMsg($WM_COMMAND, "GUIControl")
  GUIRegisterMsg($WM_SYSCOMMAND, "GUIControl")
;  GUIRegisterMsg(0x0003, "_WinMoved")

#include "VariabelGlobal.au3"
#include "GUI-Design.au3"
;#include "Fungsi.au3"
#include "GUI-Control.au3"
#include-once

