@echo off
title DiceRoll
setlocal EnableDelayedExpansion
mode 120, 30

:loop 
cls
color 5

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
echo ------------------------------------------------------------------------------------------------------------------------
echo.


echo Type 1 to play
echo.
echo Type 5 to read the rules
echo.
echo Type 9 to exit
echo.

set /p mii=

if /I "!mii!"=="1" goto igraa
if /I "!mii!"=="9" goto endi
if /I "!mii!"=="5" goto reeop

goto loop 

:reeop
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
echo Opponent also gets 4 rolls but if he gets 17, he can roll no more
echo.
echo ------------------------------------------------------------------------------------------------------------------------
echo.
echo While you can roll as much as your heart desires... as long as it is no more than 4 dices and
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

if /I "!zuz!"=="9" goto loop 

goto reeop 





:igraa
color 5
cls
set pla_tot=0
set pla_rol=0

:igraa1
cls
set /a roll=%RANDOM% %% 6 + 1
set /a pla_tot+=roll
set /a pla_rol+=1
set /a rol_l=4-pla_rol

echo You rolled: !roll!
echo.
echo Rolls left: !rol_l!
echo.
echo Your total is: !pla_tot!
echo.

if !pla_tot! GTR 22 goto losee
if !pla_rol! GEQ 4 goto dealer 

echo ------------------------------------------------------------------------------------------------------------------------
echo.
echo Type 1 to roll again
echo.
echo Type 9 to stop
echo.

set /p inff=

if "!inff!"=="1" goto igraa1
if "!inff!"=="9" goto dealer 

goto dealer 

:: ------------------------------------------------------------------------------------------------------------------------


:dealer
set dea_sum=0
set dea_rol=0

:dealeroll
cls

set /a dear=%RANDOM% %% 6 + 1
set /a dea_sum+=dear
set /a dea_rol+=1
set /a derl=4-dea_rol

echo.
echo Rolls left: !derl!
echo.
echo Dealer rolled: !dear!
echo.
echo ------------------------------------------------------------------------------------------------------------------------
echo.
echo Dealer sum: !dea_sum!
echo.

timeout /t 2 >nul

if !dea_sum! GEQ 17 goto calcu
if !dea_rol! GEQ 4 goto calcu



goto dealeroll

:calcu
cls

echo Your total: !pla_tot!
echo.
echo Dealer total: !dea_sum!

if !pla_tot! GTR 22 goto losee
if !dea_sum! GTR 22 goto winn 
if !pla_tot! EQU !dea_sum! goto tiee
if !pla_tot! GTR !dea_sum! goto winn 
goto losee


:winn 
cls
color a

echo CONGRATS YOU WIN!!
echo.
echo $$$$$$$$$$$$$$$$$$$
echo.
echo Your score: !pla_tot!
echo.
echo Dealers score: !dea_sum!
echo.
echo ------------------------------------------------------------------------------------------------------------------------
echo.
echo Type 1 to play again
echo.
echo Type 9 to go to main menu
echo.

set /p cooo=

if /I "!cooo!"=="1" goto igraa
if /I "!cooo!"=="9" goto loop 

goto winn 


:losee
cls
color 4
echo You losee....
echo.
echo :/
echo.
echo Your total: !pla_tot!
echo. 
echo Dealers total: !dea_sum!
echo.
echo ------------------------------------------------------------------------------------------------------------------------
echo.
echo Type 1 to play again
echo.
echo Type 9 to go to main menu
echo.

set /p taa=

if /I "!taa!"=="1" goto igraa
if /I "!taa!"=="9" goto loop

goto losee


:tiee
cls
color 6
echo Tough luck... You have tied...
echo.
echo Dealers total: !dea_sum!
echo.
echo Your total: !pla_tot!
echo.
echo ------------------------------------------------------------------------------------------------------------------------
echo.
echo Type 1 to play again
echo.
echo Type 9 to go to main menu
echo.

set /p jana=

if /I "!jana!"=="1" goto igraa
if /I "!jana!"=="9" goto loop 

goto tiee 


:endi 
cls
set /a ludi=%RANDOM% %% 5 + 1 
color 0!ludi!
echo Goodbye...
timeout /t 2 >nul
exit



