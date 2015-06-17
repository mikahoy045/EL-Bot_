Opt("GUIOnEventMode", 1)
Opt("MouseClickDelay", 10)
Opt("MouseClickDownDelay", 10)
Opt("TrayMenuMode", 3)

Global Const $64Bit = StringInStr(@OSArch, "64") > 0
Global Const $DEFAULT_HEIGHT = 720
Global Const $DEFAULT_WIDTH = 860
Global $Initiate = 0
Global Const $REGISTRY_KEY_DIRECTORY = "HKEY_LOCAL_MACHINE\SOFTWARE\BlueStacks\Guests\Android\FrameBuffer\0"


;~ While 1
;~ 	$nMsg = GUIGetMsg()
;~ 	Switch $nMsg
;~ 		Case $GUI_EVENT_CLOSE
;~ 			Exit

;~ 		Case $keluar
;~ 			keluar()

;~ 	EndSwitch
;~ WEnd

Func btnStart()
	If BitAND(GUICtrlGetState($btnStart), $GUI_SHOW) Then

		GUICtrlSetState($btnStart, $GUI_HIDE)
		_GUICtrlEdit_SetText($txtLog, "")

;~ 		If WinExists($Title) Then
;~ 			DisableBS($HWnD, $SC_MINIMIZE)
;~ 			DisableBS($HWnD, $SC_CLOSE)
;~ 			Initiate()
;~ 		Else
;~ 			Open()
;~ 		EndIf
	EndIf
EndFunc   ;==>btnStart

Func GUIControl($hWind, $iMsg, $wParam, $lParam)
	Local $nNotifyCode = BitShift($wParam, 16)
	Local $nID = BitAND($wParam, 0x0000FFFF)
	Local $hCtrl = $lParam
	#forceref $hWind, $iMsg, $wParam, $lParam

	If @error Then Return
	;If $hWind <> $frmAttackConfig Then
		Switch $iMsg
			Case 273
				Switch $nID
					Case $GUI_EVENT_CLOSE
						;SetLog(GetLangText("msgExit"), $COLOR_ORANGE)
						_GDIPlus_Shutdown()
						_GUICtrlRichEdit_Destroy($txtLog)
						;SaveConfig()
						Exit
					Case $btnStop
						btnStop()
					;Case $btnAtkNow
						;btnAtkNow()
					;Case $btnHide
					;	btnHide()
					;Case $btnPause
					;	btnPause()
					;Case $chkRequest
					;	chkRequest()
					;Case $tabMain
					;	tabMain()
					;Case $chkNoAttack
					;	If IsChecked($chkNoAttack) Then
					;		If IsChecked($lblpushbulletenabled) Then
					;			SetLog(GetLangText("msgPBDisabled"), $COLOR_RED)
					;		EndIf
					;		GUICtrlSetState($chkDonateOnly, $GUI_UNCHECKED)
					;		GUICtrlSetState($expMode, $GUI_UNCHECKED)
					;		GUICtrlSetState($lblpushbulletenabled, $GUI_UNCHECKED)
					;		GUICtrlSetState($lblpushbulletenabled, $GUI_DISABLE)
					;		lblpushbulletenabled()
					;	Else
					;		GUICtrlSetState($lblpushbulletenabled, $GUI_ENABLE)
					;	EndIf
					;Case $chkDonateOnly
					;	If IsChecked($chkDonateOnly) Then
					;		If IsChecked($lblpushbulletenabled) Then
					;			SetLog(GetLangText("msgPBDisabled"), $COLOR_RED)
					;		EndIf
					;		GUICtrlSetState($chkNoAttack, $GUI_UNCHECKED)
					;		GUICtrlSetState($expMode, $GUI_UNCHECKED)
					;		GUICtrlSetState($lblpushbulletenabled, $GUI_UNCHECKED)
					;		GUICtrlSetState($lblpushbulletenabled, $GUI_DISABLE)
					;		lblpushbulletenabled()
					;	Else
					;		GUICtrlSetState($lblpushbulletenabled, $GUI_ENABLE)
					;	EndIf
					;Case $expMode
					;	If IsChecked($expMode) Then
					;		If IsChecked($lblpushbulletenabled) Then
					;			SetLog(GetLangText("msgPBDisabled"), $COLOR_RED)
					;		EndIf
					;		GUICtrlSetState($chkNoAttack, $GUI_UNCHECKED)
					;		GUICtrlSetState($chkDonateOnly, $GUI_UNCHECKED)
					;		GUICtrlSetState($lblpushbulletenabled, $GUI_UNCHECKED)
					;		GUICtrlSetState($lblpushbulletenabled, $GUI_DISABLE)
					;		lblpushbulletenabled()
					;	Else
					;		GUICtrlSetState($lblpushbulletenabled, $GUI_ENABLE)
					;	EndIf
					;Case $chkUpgrade1
					;	chkUpgrade1()
					;Case $chkUpgrade2
					;	chkUpgrade2()
					;Case $chkUpgrade3
					;	chkUpgrade3()
					;Case $chkUpgrade4
					;	chkUpgrade4()
					;Case $chkUpgrade5
					;	chkUpgrade5()
					;Case $chkUpgrade6
					;	chkUpgrade6()
					;Case $chkUseAllBuilder
					;	chkUseAllBuilder()
					;Case $UseJPG
					;	UseJPG()
					;Case $UseAttackJPG
					;	UseAttackJPG()
					;Case $lblpushbulletenabled
					;	lblpushbulletenabled()
					;Case $btnGitHub
					;	ShellExecute("http://http://forum.brokenbot.org/forum-8.html")
					;Case $btnCloseBR
					;	GUISetState(@SW_ENABLE, $frmBot)
					;	GUISetState(@SW_HIDE, $frmBugReport)
					;	WinActivate($frmBot)
					;Case $imgLogo
					;	openWebsite()
					;Case $btnSaveStrat
					;	_btnSaveStrat()
					;Case $lstStrategies
					;	If $nNotifyCode = 1 Then _lstStrategies()
					;Case $cmbLanguage
					;	If $nNotifyCode = 1 Then cmbLanguage()
					;Case 10000
					;	If _GUICtrlTab_GetCurSel($tabMain) = 0 Then
					;		ControlShow("", "", $txtLog)
					;	Else
					;		ControlHide("", "", $txtLog)
					;	EndIf
					;Case Else
				EndSwitch
;~ 			Case 274
;~ 				Switch $wParam
;~ 					Case 0xf060
;~ 						SetLog(GetLangText("msgExit"), $COLOR_ORANGE)
;~ 						_GDIPlus_Shutdown()
;~ 						_GUICtrlRichEdit_Destroy($txtLog)
;~ 						SaveConfig()
;~ 						Exit
;~ 				EndSwitch
		EndSwitch
;~ 	Else
;~ 		If IsArray($PluginEvents) Then
;~ 			For $i = 1 To $PluginEvents[0][0]
;~ 				If $nID = $PluginEvents[$i][0] And $nNotifyCode = $PluginEvents[$i][1] Then
;~ 					$strPlugInInUse = IniRead($dirStrat & GUICtrlRead($lstStrategies) & ".ini", "plugin", "name", "")
;~ 					Call($strPlugInInUse & $PluginEvents[$i][2])
;~ 				EndIf
;~ 			Next
;~ 		EndIf
;~ 	EndIf
	Return $GUI_RUNDEFMSG
EndFunc   ;==>GUIControl

Func btnStop()
	If BitAND(GUICtrlGetState($btnStop), $GUI_SHOW) Then
		GUICtrlSetData($btnStart, "Stopping...")
		GUICtrlSetState($btnStart, $GUI_SHOW)
		GUICtrlSetState($btnStart, $GUI_DISABLE)
		GUICtrlSetState($btnStop, $GUI_HIDE)
		$Running = False
	EndIf
EndFunc   ;==>btnStop

Func keluar()
	Exit
EndFunc   ;==>keluar
