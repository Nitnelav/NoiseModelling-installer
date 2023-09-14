#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=icon.ico
#AutoIt3Wrapper_Outfile_x64=NoiseModelling.exe
#AutoIt3Wrapper_UseX64=y
#AutoIt3Wrapper_Change2CUI=y
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****

#include <AutoItConstants.au3>

EnvSet("JAVA_HOME", @WorkingDir & "\java-min-11")
FileChangeDir(".\NoiseModelling_4.0.5\bin")

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