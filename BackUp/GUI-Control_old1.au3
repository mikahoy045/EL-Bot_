Opt("GUIOnEventMode", 1)
Opt("MouseClickDelay", 10)
Opt("MouseClickDownDelay", 10)
Opt("TrayMenuMode", 3)

Global Const $64Bit = StringInStr(@OSArch, "64") > 0
Global Const $DEFAULT_HEIGHT = 720
Global Const $DEFAULT_WIDTH = 860
Global $Initiate = 0
Global Const $REGISTRY_KEY_DIRECTORY = "HKEY_LOCAL_MACHINE\SOFTWARE\BlueStacks\Guests\Android\FrameBuffer\0"


While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit

		Case $keluar
			keluar()

	EndSwitch
WEnd

Func btnStart()
	If BitAND(GUICtrlGetState($btnStart), $GUI_SHOW) Then

		GUICtrlSetState($btnStart, $GUI_HIDE)
		;_GUICtrlEdit_SetText($txtLog, "")

;~ 		If WinExists($Title) Then
;~ 			DisableBS($HWnD, $SC_MINIMIZE)
;~ 			DisableBS($HWnD, $SC_CLOSE)
;~ 			Initiate()
;~ 		Else
;~ 			Open()
;~ 		EndIf
	EndIf
EndFunc   ;==>btnStart

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
	EndFunc