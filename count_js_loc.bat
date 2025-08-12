@echo off
setlocal enabledelayedexpansion

set "total=0"
set "rootdir=%~1"
if "%rootdir%"=="" set "rootdir=%cd%"

echo Tarama dizini: %rootdir%
echo.

for /r "%rootdir%" %%f in (*.js) do (
    for /f "usebackq" %%c in (`findstr /R /N "^" "%%f" ^| find /c ":"`) do (
        set "linecount=%%c"
        echo %%f  -  !linecount!
        set /a total+=!linecount!
    )
)

echo.
echo Toplam satir sayisi: %total%
endlocal
pause
