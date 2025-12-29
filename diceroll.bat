@echo off 
title DiceRoll
setlocal EnableDelayedExpansion
color 5
mode 120, 30





:loop
cls
echo.



:::                            .S_sSSs     .S    sSSs    sSSs   .S_sSSs      sSSs_sSSs    S.      S.     
:::                           .SS~YS%%b   .SS   d%%SP   d%%SP  .SS~YS%%b    d%%SP~YS%%b   SS.     SS.    
:::                           S%S   `S%b  S%S  d%S'    d%S'    S%S   `S%b  d%S'     `S%b  S%S     S%S    
:::                           S%S    S%S  S%S  S%S     S%S     S%S    S%S  S%S       S%S  S%S     S%S    
:::                           S%S    S&S  S&S  S&S     S&S     S%S    d*S  S&S       S&S  S&S     S&S    
:::                           S&S    S&S  S&S  S&S     S&S_Ss  S&S   .S*S  S&S       S&S  S&S     S&S    
:::                           S&S    S&S  S&S  S&S     S&S~SP  S&S_sdSSS   S&S       S&S  S&S     S&S    
:::                           S&S    S&S  S&S  S&S     S&S     S&S~YSY%b   S&S       S&S  S&S     S&S    
:::                           S*S    d*S  S*S  S*b     S*b     S*S   `S%b  S*b       d*S  S*b     S*b    
:::                           S*S   .S*S  S*S  S*S.    S*S.    S*S    S%S  S*S.     .S*S  S*S.    S*S.   
:::                           S*S_sdSSS   S*S   SSSbs   SSSbs  S*S    S&S   SSSbs_sdSSS    SSSbs   SSSbs 
:::                           SSS~YSSY    S*S    YSSP    YSSP  S*S    SSS    YSSP~YSSY      YSSP    YSSP 
:::                                       SP                   SP                                        
:::                                       Y                    Y         
for /f "delims=: tokens=*" %%A in ('findstr /b ::: "%~f0"') do @echo(%%A

echo.
echo.
echo ------------------------------------------------------------------------------------------------------------------------
echo.
echo.
echo Type 1 to play
echo.
echo Type 5 to read the rules 
echo.
echo Type 9 to exit 
echo.
echo.

set /p glaa=

if /I "%glaa%"=="1" goto igraa
if /I "%glaa%"=="5" goto reea
if /I "%glaa%"=="9" goto endi

goto loop


:reea
cls

echo ------------------------------------------------------------------------------------------------------------------------
echo.
echo You get 4 rolls of a dice to get as close as possible to 22
echo.
echo ------------------------------------------------------------------------------------------------------------------------
echo.
echo But if you go over it you bust and lose
echo.
echo ------------------------------------------------------------------------------------------------------------------------
echo.
echo Opponent also gets 4 rolls but if he gets 17 he cant roll no more
echo.
echo ------------------------------------------------------------------------------------------------------------------------
echo.
echo While you can roll as much as your heart desires
echo.
echo ------------------------------------------------------------------------------------------------------------------------
echo.
echo Without going over 22 that is...
echo.
echo ------------------------------------------------------------------------------------------------------------------------
echo.
echo.
echo Type 9 to go to main menu
echo.
echo.

set /p zuz=

if /I "%zuz%"=="9" goto loop 

goto reea 


:igraa

del pla.txt
del dea.txt

timeout /t 1 >nul 

echo. > pla.txt
echo. > dea.txt

cls

set /a rand1=%RANDOM% * 6 / 32768 + 1

echo Your first roll: %rand1%
echo %rand1% > pla.txt

timeout /t 1 >nul

set /a rand2=%RANDOM% * 6 / 32768 + 1

echo Your second roll: %rand2%
set /p tot=<pla.txt 

set /a sum=tot+rand2

echo Your total is: %sum%
echo %sum% > pla.txt 

if %sum% GTR 22 (
    goto losee
)

echo 1 to roll again
echo.
echo 9 to stop 
echo.

set /p quee=

if /I "%quee%"=="1" goto nee
if /I "%quee%"=="9" goto dealer 

goto igraa

:nee 

set /p tot1=<pla.txt

set /a rand3=%RANDOM% * 6 / 32768 + 1 
set /a sum1=tot1+rand3


echo Your third roll: %rand3%
echo.
echo Your total is: %sum1%
echo.
echo 1 To roll again
echo.
echo 9 to stop 
echo.



echo %sum1% > pla.txt 

if %sum1% GTR 22 (
    goto losee
)

set /p quee1=

if /I "%quee1%"=="1" goto nee1
if /I "%quee1%"=="9" goto dealer

goto nee 


:nee1

set /p tot2=<pla.txt

set /a rand4=%RANDOM% * 6 / 32768 + 1

set /a sum2=tot2+rand4

echo Your fourth roll is: %rand4%
echo.
echo Your total is: %sum2%
echo.

echo %sum2% > pla.txt

if %sum2% GTR 22 (
    goto losee
)

echo Now going to the dealer...

timeout /t 3 > nul

goto dealer

:dealer
cls

set /a dea1=%RANDOM% * 6 / 32768 + 1 
set /a dea2=%RANDOM% * 6 / 32768 + 1
set /a suu=dea1+dea2


echo Dealers first roll: %dea1%
echo.
echo Dealers second roll: %dea2%
echo.
echo Dealers total: %suu%
echo.

echo %suu% > dea.txt

timeout /t 2 >nul

set /p ree=<dea.txt

set /a dea3=%RANDOM% * 6 / 32768 + 1 

set /a suu2=ree+dea3

timeout /t 1 >nul 
cls

echo Dealers third roll: %dea3%
echo.
echo Dealers total: %suu2%
echo.


timeout /t 2 >nul



echo %suu2% > dea.txt

if /I %suu2% GEQ 17 (
    goto calcu
)

cls


set /a dea4=%RANDOM% * 6 / 32768 + 1
set /p ree1=<dea.txt
set /a suu2=dea4+ree1

echo Dealers final roll: %dea4%
echo.
echo Dealers total: %suu2%
echo.

echo %suu2% > dea.txt 

echo Going to results...

timeout /t 2 >nul

goto calcu 


:calcu 
cls 

set /p plaa=<pla.txt
set /p deaa=<dea.txt

if "%plaa%"=="%deaa%" (
    goto tiee
) else goto calcu2



:tiee
cls

set /p det=<dea.txt
set /p plt=<pla.txt

echo You have tied...
echo.
echo Dealers score: %det%
echo.
echo Your score: %plt%
echo.
echo 1 to play again
echo.
echo 9 to go to main menu 
echo.

set /p inii=

if /I "%inii%"=="1" goto igraa
if /I "%inii%"=="9" goto loop

goto tiee

:calcu2

set /p plaa1=<pla.txt
set /p deaa1=<dea.txt

if %plaa1% GTR %deaa1% (
    goto winn
) else goto losee


:losee

set /p del11=<dea.txt 
set /p pll=<pla.txt 

cls
echo You have lost
echo.
echo :/
echo.
echo Dealers score: %del11%
echo.
echo Your score: %pll%
echo.
echo Type 1 to play again
echo.
echo Type 9 to go to main menu
echo.

set /p crr=

if /I "%crr%"=="1" goto igraa
if /I "%crr%"=="9" goto loop 

goto losee


:winn

set /p plw=<pla.txt
set /p dew=<dea.txt

cls

echo CONGRATS YOU HAVE WONN
echo.
echo $$$$$$$$$$$$$$$$$$$$$$
echo.
echo Your score: %plw%
echo.
echo Dealers score: %dew%
echo.
echo Type 1 to play again
echo.
echo Type 9 to go to main menu 
echo.

set /p yyt=

if /I "%yyt%"=="1" goto igraa
if /I "%yyt%"=="9" goto loop 


goto winn 


:endi 
cls

echo GOODBYE...

timeout /t 1 >nul 
exit 
