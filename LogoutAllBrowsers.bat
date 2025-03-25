@echo off
setlocal enabledelayedexpansion

title Browser Cleaner Tool

echo ===================================
echo    BROWSER CLEANER TOOL
echo ===================================
echo.
echo WARNING: This will close all browsers and delete ALL browser data including:
echo  - Saved passwords
echo  - Browsing history
echo  - Bookmarks
echo  - Extensions
echo  - Cookies and site preferences
echo.
echo Press CTRL+C now to cancel or...
pause

:: Create a log file
set "logfile=%temp%\browser_cleaner_%date:~-4,4%%date:~-7,2%%date:~-10,2%_%time:~0,2%%time:~3,2%%time:~6,2%.log"
set "logfile=%logfile: =0%"
echo Browser Cleaner Log - %date% %time% > "%logfile%"

echo.
echo Closing browsers...
echo Closing browsers... >> "%logfile%"

:: Function to close browser processes
call :CloseBrowser "Google Chrome" chrome.exe
call :CloseBrowser "Mozilla Firefox" firefox.exe
call :CloseBrowser "Microsoft Edge" msedge.exe
call :CloseBrowser "Opera" opera.exe
call :CloseBrowser "Opera GX" "opera_gx.exe"
call :CloseBrowser "Brave" brave.exe
call :CloseBrowser "Vivaldi" vivaldi.exe

echo.
echo Waiting for processes to terminate completely...
timeout /t 5 /nobreak >nul

echo.
echo Clearing browser data...
echo Clearing browser data... >> "%logfile%"

:: Clear Chrome data
call :ClearBrowserData "Google Chrome" "%LocalAppData%\Google\Chrome\User Data"

:: Clear Chrome Beta data
call :ClearBrowserData "Google Chrome Beta" "%LocalAppData%\Google\Chrome Beta\User Data"

:: Clear Chromium data
call :ClearBrowserData "Chromium" "%LocalAppData%\Chromium\User Data"

:: Clear Firefox data
call :ClearBrowserData "Mozilla Firefox" "%AppData%\Mozilla\Firefox\Profiles"

:: Clear Edge data
call :ClearBrowserData "Microsoft Edge" "%LocalAppData%\Microsoft\Edge\User Data"

:: Clear Opera data
call :ClearBrowserData "Opera" "%AppData%\Opera Software\Opera Stable"

:: Clear Opera GX data
call :ClearBrowserData "Opera GX" "%AppData%\Opera Software\Opera GX Stable"

:: Clear Brave data
call :ClearBrowserData "Brave" "%LocalAppData%\BraveSoftware\Brave-Browser\User Data"

:: Clear Vivaldi data
call :ClearBrowserData "Vivaldi" "%LocalAppData%\Vivaldi\User Data"

:: Clear browser cache from Temp folders
echo Clearing browser cache from Temp folders...
echo Clearing browser cache from Temp folders... >> "%logfile%"
del /s /q "%temp%\*.tmp" >> "%logfile%" 2>&1
del /s /q "%temp%\*.crdownload" >> "%logfile%" 2>&1

echo.
echo ===================================
echo    OPERATION COMPLETE
echo ===================================
echo.
echo All browser data has been cleared. You have been logged out of all accounts.
echo A log file has been created at: %logfile%
echo.
pause
exit /b 0

:CloseBrowser
echo Closing %~1...
taskkill /F /IM %~2 /T >nul 2>&1
if %errorlevel% equ 0 (
    echo - %~1 was closed successfully. >> "%logfile%"
    echo - %~1 closed successfully.
) else (
    echo - %~1 was not running. >> "%logfile%"
    echo - %~1 was not running.
)
exit /b

:ClearBrowserData
set "browserName=%~1"
set "dataPath=%~2"

echo Clearing %browserName% data...
if exist "%dataPath%" (
    echo - %browserName% data found at: %dataPath% >> "%logfile%"
    
    if /i "%browserName%" == "Mozilla Firefox" (
        for /d %%d in ("%dataPath%\*.*") do (
            echo   - Deleting profile: %%~nxd >> "%logfile%"
            rd /s /q "%%d" >nul 2>&1
        )
    ) else (
        echo   - Deleting user data >> "%logfile%"
        rd /s /q "%dataPath%" >nul 2>&1
    )
    
    if exist "%dataPath%" (
        echo   - WARNING: Could not completely remove data >> "%logfile%"
        echo   - WARNING: Could not completely remove data
    ) else (
        echo   - Successfully cleared %browserName% data >> "%logfile%"
        echo   - Successfully cleared %browserName% data
    )
) else (
    echo - %browserName% data directory not found at: %dataPath% >> "%logfile%"
    echo - %browserName% data directory not found.
)
exit /b
