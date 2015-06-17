;#include "VariabelGlobal.au3"
;#include "GUI-Control.au3"
;#include "GUI-Design.au3"
;#include "FungsiUmum.au3"

Func SetLog($String, $Color = 0x000000) ;Sets the text for the log
	_GUICtrlRichEdit_AppendTextColor($txtLog, Time(), 0x000000)
	_GUICtrlRichEdit_AppendTextColor($txtLog, $String & @CRLF, _ColorConvert($Color))
	_GUICtrlStatusBar_SetText($statLog, "Status : " & $String)
	_FileWriteLog($hLogFileHandle, $String)
EndFunc   ;==>SetLog

Func _GUICtrlRichEdit_AppendTextColor($hWnd, $sText, $iColor)
	Local $iLength = _GUICtrlRichEdit_GetTextLength($hWnd, True, True)
	Local $iCp = _GUICtrlRichEdit_GetCharPosOfNextWord($hWnd, $iLength)
	_GUICtrlRichEdit_SetFont($hWnd, $FontSize)
	_GUICtrlRichEdit_AppendText($hWnd, $sText)
	_GUICtrlRichEdit_SetSel($hWnd, $iCp - 1, $iLength + StringLen($sText))
	_GUICtrlRichEdit_SetCharColor($hWnd, $iColor)
	_GUICtrlRichEdit_Deselect($hWnd)
EndFunc   ;==>_GUICtrlRichEdit_AppendTextColor

Func _ColorConvert($nColor);RGB to BGR or BGR to RGB
	Return _
			BitOR(BitShift(BitAND($nColor, 0x000000FF), -16), _
			BitAND($nColor, 0x0000FF00), _
			BitShift(BitAND($nColor, 0x00FF0000), 16))

			Func Initiate()
	If IsArray(ControlGetPos($Title, "_ctl.Window", "[CLASS:BlueStacksApp; INSTANCE:1]")) Then
		Local $BSsize = [ControlGetPos($Title, "_ctl.Window", "[CLASS:BlueStacksApp; INSTANCE:1]")[2], ControlGetPos($Title, "_ctl.Window", "[CLASS:BlueStacksApp; INSTANCE:1]")[3]]
		Local $fullScreenRegistryData = RegRead($REGISTRY_KEY_DIRECTORY, "FullScreen")
		Local $guestHeightRegistryData = RegRead($REGISTRY_KEY_DIRECTORY, "GuestHeight")
		Local $guestWidthRegistryData = RegRead($REGISTRY_KEY_DIRECTORY, "GuestWidth")
		Local $windowHeightRegistryData = RegRead($REGISTRY_KEY_DIRECTORY, "WindowHeight")
		Local $windowWidthRegistryData = RegRead($REGISTRY_KEY_DIRECTORY, "WindowWidth")

		Local $BSx = ($BSsize[0] > $BSsize[1]) ? $BSsize[0] : $BSsize[1]
		Local $BSy = ($BSsize[0] > $BSsize[1]) ? $BSsize[1] : $BSsize[0]

		$Running = True

		If $BSx <> 860 Or $BSy <> 720 Then
			RegWrite($REGISTRY_KEY_DIRECTORY, "FullScreen", "REG_DWORD", "0")
			RegWrite($REGISTRY_KEY_DIRECTORY, "GuestHeight", "REG_DWORD", $DEFAULT_HEIGHT)
			RegWrite($REGISTRY_KEY_DIRECTORY, "GuestWidth", "REG_DWORD", $DEFAULT_WIDTH)
			RegWrite($REGISTRY_KEY_DIRECTORY, "WindowHeight", "REG_DWORD", $DEFAULT_HEIGHT)
			RegWrite($REGISTRY_KEY_DIRECTORY, "WindowWidth", "REG_DWORD", $DEFAULT_WIDTH)
			SetLog(GetLangText("msgPleaseRestart"), $COLOR_ORANGE)
			_Sleep(3000)
			$MsgRet = MsgBox(BitOR($MB_OKCANCEL, $MB_SYSTEMMODAL), GetLangText("boxRestart"), GetLangText("boxRestart2") & @CRLF & GetLangText("boxRestart3"), 10)
			If $MsgRet <> $IDOK Then
				btnStop()
				Return
			EndIf
		EndIf

		WinActivate($Title)

		SetLog(GetLangText("msgWelcome") & $sBotTitle & "!~~~~", $COLOR_PURPLE)
		SetLog($Compiled & GetLangText("msgRunningOn") & @OSArch & " OS", $COLOR_GREEN)
		SetLog(GetLangText("msgStarting"), $COLOR_ORANGE)

		If IsChecked($lblpushbulletenabled) And IsChecked($lblpushbulletdelete) Then
			_DeletePush()
		EndIf

		$AttackNow = False
		$FirstStart = True
		$Checkrearm = True
		GUICtrlSetState($cmbBoostBarracks, $GUI_DISABLE)
		GUICtrlSetState($btnLocateDarkBarracks, $GUI_DISABLE)
		GUICtrlSetState($btnLocateBarracks, $GUI_DISABLE)
		GUICtrlSetState($btnLocateCamp, $GUI_DISABLE)
		GUICtrlSetState($btnFindWall, $GUI_DISABLE)
		GUICtrlSetState($chkBackground, $GUI_DISABLE)
		GUICtrlSetState($chkNoAttack, $GUI_DISABLE)
		GUICtrlSetState($chkDonateOnly, $GUI_DISABLE)
		GUICtrlSetState($chkForceBS, $GUI_DISABLE)
		GUICtrlSetState($btnLocateTownHall, $GUI_DISABLE)
		GUICtrlSetState($btnLocateKingAltar, $GUI_DISABLE)
		GUICtrlSetState($btnLocateQueenAltar, $GUI_DISABLE)
		GUICtrlSetState($btnLoad, $GUI_DISABLE)
		GUICtrlSetState($btnSave, $GUI_DISABLE)
		GUICtrlSetState($btnLocateClanCastle, $GUI_DISABLE)
		GUICtrlSetState($btnLocateSFactory, $GUI_DISABLE)
		$sTimer = TimerInit()
		AdlibRegister("SetTime", 1000)
		runBot()
		GUICtrlSetState($btnStart, $GUI_ENABLE)
		GUICtrlSetData($btnStart, "Start Bot")
	Else
		SetLog(GetLangText("msgNotInGame"), $COLOR_RED)
		btnStop()
	EndIf
EndFunc   ;==>Initiate

Func Open()
	If $64Bit Then ;If 64-Bit
		ShellExecute("C:\Program Files (x86)\BlueStacks\HD-StartLauncher.exe")
		SetLog(GetLangText("msgStartingBS"), $COLOR_GREEN)
		Sleep(290)
		SetLog(GetLangText("msgWaitingBS"), $COLOR_GREEN)
		Check()
	Else ;If 32-Bit
		ShellExecute("C:\Program Files\BlueStacks\HD-StartLauncher.exe")
		SetLog(GetLangText("msgStartingBS"), $COLOR_GREEN)
		Sleep(290)
		SetLog(GetLangText("msgWaitingBS"), $COLOR_GREEN)
		Check()
	EndIf
EndFunc   ;==>Open

Func Check()
	If IsArray(ControlGetPos($Title, "_ctl.Window", "[CLASS:BlueStacksApp; INSTANCE:1]")) Then
		SetLog(GetLangText("msgBSLoaded") & ($Initiate) & GetLangText("msgBSLoadSecs"), $COLOR_GREEN)
		Initiate()
	Else
		Sleep(1000)
		$Initiate = $Initiate + 1
		Check()
	EndIf
EndFunc   ;==>Check

Func getfilename($psFilename)
	Local $szDrive, $szDir, $szFName, $szExt
	_PathSplit($psFilename, $szDrive, $szDir, $szFName, $szExt)
	Return $szFName & $szExt
EndFunc   ;==>getfilename
