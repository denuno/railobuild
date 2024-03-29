@echo off
set ANT_HOME=%CD%\build\util\ant\
if "%1" == "" goto MENU
set var1=%1
SHIFT
:Loop
IF "%1"=="" GOTO Continue
SET var1=%var1% -D%1%
SHIFT
SET var1=%var1%=%1%
SHIFT
GOTO Loop
:Continue
call build\util\ant\bin\ant.bat -f build/build.xml %var1%
goto end
:MENU
cls
echo.
echo       railobuild menu
REM echo       usage: railobuild.bat [build|{target}]
echo.
echo       1. Build Railo
echo       2. Build and Test
echo       3. List available targets
echo       4. Update project
echo       5. Run Target
echo       6. Quit
echo.
set choice=
set /p choice=      Enter option 1, 2, 3, 4, 5 or 6 :
echo.
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto buildRailo
if '%choice%'=='2' goto buildAndTest
if '%choice%'=='3' goto listTargets
if '%choice%'=='4' goto updateProject
if '%choice%'=='5' goto runTarget
if '%choice%'=='6' goto end
::
echo.
echo.
echo "%choice%" is not a valid option - try again
echo.
pause
goto MENU
::
:buildRailo
cls
call build\util\ant\bin\ant.bat -f build/build.xml build
goto end
::
:buildAndTest
call build\util\ant\bin\ant.bat -f build/build.xml build.and.test
goto end
::
:listTargets
call build\util\ant\bin\ant.bat -f build/build.xml help
echo       press any key ...
pause > nul
goto MENU
::
:updateProject
call build\util\ant\bin\ant.bat -f build/build.xml project.update
echo       press any key ...
pause > nul
goto MENU
::
:runTarget
set target=
set /p target=      Enter target name:
if not '%target%'=='' call build\util\ant\bin\ant.bat -f build/build.xml %target%
echo       press any key ...
pause > nul
goto MENU
::
:end
set choice=
echo       press any key ...
pause
REM EXIT
	
			
