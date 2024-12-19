#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=icon.ico
#AutoIt3Wrapper_Outfile_x64=NoiseModelling.exe
#AutoIt3Wrapper_UseX64=y
#AutoIt3Wrapper_Change2CUI=y
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****

#include <AutoItConstants.au3>

FileChangeDir(@ScriptDir)

EnvSet("JAVA_HOME", @WorkingDir & "\java-min-11")
EnvSet("GEOSERVER_HOME", @WorkingDir & "\NoiseModelling_4.0.5")
EnvSet("GEOSERVER_DATA_DIR", @WorkingDir & "\NoiseModelling_4.0.5\data_dir")

ConsoleWrite(@CRLF)
ConsoleWrite("TEMPORARY SET JAVA_HOME: " & EnvGet("JAVA_HOME") & @CRLF)
ConsoleWrite("TEMPORARY SET GEOSERVER_HOME: " & EnvGet("GEOSERVER_HOME") & @CRLF)
ConsoleWrite("TEMPORARY SET GEOSERVER_DATA_DIR: " & EnvGet("GEOSERVER_DATA_DIR") & @CRLF)
ConsoleWrite(@CRLF)

FileChangeDir(".\NoiseModelling_4.0.5\bin")

;~ probably not worth it but make the startup_windows.bat script properly detect the GEOSERVER_HOME
Local $sFilePath = @WorkingDir & "\startup.bat"
Local $hFile = FileOpen($sFilePath, 2)
If $hFile <> -1 Then
    FileWrite($hFile, "EMPTY ON PURPOSE. ONLY HERE TO AVOID A WARNING. YOU CAN DELETE THIS FILE IF NEEDED IT WON'T BREAK ANYTHING.")
    FileClose($hFile)
EndIf

_getCmdStd(".\startup_windows.bat")

Func _getCmdStd(Const $sCMD, Const $sDir = '', Const $iType = $STDERR_MERGED, Const $bShow = True, Const $iDelay = 100)
    Local       $sTMP = ''
    Local       $sSTD = ''
    Local       $sCOM = @ComSpec & ' /c ' & $sCMD
    Local Const $iWin = $bShow ? @SW_SHOW : @SW_HIDE
    Local Const $iPID = Run($sCOM, $sDir, $iWin, $iType)

	Local 		$bListenStart = True

    While True

        $sTMP = StdoutRead($iPID, False, False)

        If @error Then

            ExitLoop 1

        ElseIf $sTMP Then

            $sTMP  = StringReplace($sTMP, @CR & @CR, '')
            $sSTD &= $sTMP

            ConsoleWrite($sTMP)

			If $bListenStart Then
				$res = StringRegExp($sTMP, "INFO:oejs.Server:main: Started")

				If $res Then
					ShellExecute("http://127.0.0.1:9580")
					$bListenStart = False
				EndIf
			EndIf
        EndIf

        Sleep($iDelay)

    WEnd

    Return SetError(@error, @extended, $sSTD)
EndFunc