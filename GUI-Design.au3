#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <TabConstants.au3>
#include <WindowsConstants.au3>

#Region ### START Koda GUI section ### Form=D:\Learning\AutoIT\EL-Bot\EL_Bot_Form_V.1.0.kxf
;GUISetIcon(@ScriptDir & "BrokenBot.org\images\icons\brokenbot.ico")
;TraySetIcon(@ScriptDir & "BrokenBot.org\images\icons\brokenbot.ico")
Global $frmBot = GUICreate($sBotTitle, 611, 437, -1, -1)
Global $MenuItem2 = GUICtrlCreateMenu("&File")
Global $keluar = GUICtrlCreateMenuItem("K&eluar", $MenuItem2)
Global $MenuItem1 = GUICtrlCreateMenu("&Bantuan")
Global $MenuItem3 = GUICtrlCreateMenuItem("&Tentang", $MenuItem1)
Global $MenuItem4 = GUICtrlCreateMenuItem("&Hubungi Kami", $MenuItem1)
Global $TabMain = GUICtrlCreateTab(8, 8, 593, 393, $TCS_MULTILINE)


; ---------------------------------------------------------------------------------------------------------------------
; General Tab ---------------------------------------------------------------------------------------------------------
; ---------------------------------------------------------------------------------------------------------------------
Global $TabSheet1 = GUICtrlCreateTabItem("Umum")
Global $txtLog = _GUICtrlRichEdit_Create($frmBot,"", 24, 48, 561, 209, BitOR($ES_MULTILINE, $ES_READONLY, $WS_VSCROLL, $WS_HSCROLL, 8912))
Global $btnStop = GUICtrlCreateButton("Berhenti", 24, 361, 81, 25)
GUICtrlSetOnEvent(-1, "btnStop")
GUICtrlSetState(-1, $GUI_HIDE)
GUICtrlSetBkColor($btnStop, 0xFF7E00)
Global $btnStart = GUICtrlCreateButton("Mulai", 24, 361, 81, 25)
GUICtrlSetOnEvent(-1, "btnStart")
GUICtrlSetBkColor($btnStart, 0xFF7E00)
GUICtrlSetState($btnStart, $GUI_DISABLE)
Global $TabSheet2 = GUICtrlCreateTabItem("Pilihan")
Global $Group1 = GUICtrlCreateGroup("Jalan (Belum diimplementasikan)", 24, 41, 561, 153)
GUICtrlCreateGroup("", -99, -99, 1, 1)
Global $Group2 = GUICtrlCreateGroup("Diam (Belum diimplementasikan)", 24, 209, 561, 177)
GUICtrlCreateGroup("", -99, -99, 1, 1)
GUICtrlCreateTabItem("")
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###


