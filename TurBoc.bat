@echo off


setlocal enabledelayedexpansion


echo. 
echo. 
echo.-----------------------------------------------------------------
echo.-----------------------------------------------------------------
echo.-------------------------- [TurBoc] -----------------------------
echo.-----------------------------------------------------------------
echo.-----------------------------------------------------------------
echo.------------ SUPER COMPACTADOR DE SISTEMAS WINDOWS --------------
echo.-----------------------------------------------------------------
echo.------------ LIBERE MUITO ESPACO DE ARMAZENAMENTO ---------------
echo.-----------------------------------------------------------------
echo.---- ARQUIVOS ADICIONADOS SERAO COMPACTADOS AUTOMATICAMENTE -----
echo.-----------------------------------------------------------------
echo.-------- [MENU] COMPLETO, FACIL, SIMPLES E INTERATIVO -----------
echo.-----------------------------------------------------------------
echo.-----------------------------------------------------------------
echo.Versao 1.0.0 ----------------------------------------------------
echo.DeV: oSToN PraTa. -----------------------------------------------
echo.DaTa: BRaSiLia, 28 De MaRCo De 2022. ----------------------------
echo.LiNK Bio: https://linktr.ee/ostonprata --------------------------
echo.Repositorio/Help: https://github.com/ostonprata/TurBoy ----------
echo.-----------------------------------------------------------------
echo.-----------------------------------------------------------------
echo. 
echo. 



echo. 
echo. 
echo.[1] Compactar
echo.[2] Descompactar
echo.[3] SaiR
echo. 
echo. 
set /p "primeiroMenuOpcao=OPCAO : "
if "%primeiroMenuOpcao%"=="1" (
	set "comandosCompactacao=Compact.exe /c /s /a /i /exe:lzx"
	set "comandoSOCompactacao=Compact.exe /CompactOS:always"
)
if "%primeiroMenuOpcao%"=="2" (
	set "comandosDescompactacao=Compact.exe /u /s /a /i"
	set "comandoSODescompactacao=Compact.exe /CompactOS:never"
)
if "%primeiroMenuOpcao%"=="3" (
	goto :saidoPrograma
)


echo. 
echo. 
echo.[1] SiSTeMa
echo.[2] PaSTaS
echo.[3] SaiR
echo. 
echo. 
set /p "segundoMenuOpcao=OPCAO : "
if "%segundoMenuOpcao%"=="1" (

	if exist "PaSTaS.TXT" (
		del "PaSTaS.TXT"
	)

	echo "C:\Windows\*" >> "PaSTaS.TXT"
	echo "C:\ProgramData\*" >> "PaSTaS.TXT"
	echo "C:\Program Files\*" >> "PaSTaS.TXT"
	echo "C:\Program Files (x86)\*" >> "PaSTaS.TXT"
	echo "C:\Users\*" >> "PaSTaS.TXT"
	
	goto :sistema
)
if "%segundoMenuOpcao%"=="2" (
	goto :pastas
)
if "%segundoMenuOpcao%"=="3" (
	goto :saidoPrograma
)


:pastas
if exist "PaSTaS.TXT" (
	goto :arquivoExiste
) else (
	goto :arquivoNaoExiste
)


:arquivoExiste
echo. 
echo.[1] CoNTiNuaR CoM a aNTiGa LiSTa De PaSTaS.
echo.[2] CRiaR uMa NoVa [SoBreSCReVeNDo a aNTiGa LiSTa De PaSTaS].
echo. 
set /p "terceiroMenuOpcao=OPCAO : "
if "%terceiroMenuOpcao%"=="1" (
	goto :querAdicionarMais
) else (
	del "PaSTaS.TXT"
	goto :adicionarMais
)


:arquivoNaoExiste
:adicionarMais
set "psCommand="(new-object -COM 'Shell.Application')^
.BrowseForFolder(0,'[PASTA A SER COMPACTADA...]',0,0x11).self.path""
for /f "usebackq delims=" %%a in (`powershell %psCommand%`) do (
	set "adicionandoPasta=%%a"
)


echo "%adicionandoPasta%\*" >> "PaSTaS.TXT"
:querAdicionarMais
echo. 
set /p "Pergunta=ACReSCeNTaR MaiS PaSTa? [s]im / [n]ao : "
if /i "%Pergunta%"=="s" (
goto :adicionarMais
)


:sistema


echo.
echo.
echo.[INICIANDO...]
echo.
echo.


for /f "tokens=* delims= " %%b in (PaSTaS.TXT) do (

	set "comandoPasta=%%b"

	if "%primeiroMenuOpcao%"=="1" (
		if not "!comandoPasta!"=="!comandoPasta:Windows=!" (
			%comandoSOCompactacao%
			%comandosCompactacao% !comandoPasta!
		) else (
			%comandosCompactacao% !comandoPasta!
		)
	)

	if "%primeiroMenuOpcao%"=="2" (
		if not "!comandoPasta!"=="!comandoPasta:Windows=!" (
			%comandoSODescompactacao%
			%comandosDescompactacao% !comandoPasta!
		) else (
			%comandosDescompactacao% !comandoPasta!
		)
	)
)


if "%segundoMenuOpcao%"=="1" (
	if exist "PaSTaS.TXT" (
		del "PaSTaS.TXT"
	)
)


:saidoPrograma
echo.
echo.
echo.[...FIM]
echo.
echo.


endlocal


pause


exit