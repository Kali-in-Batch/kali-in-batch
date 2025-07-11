@echo off
setlocal enabledelayedexpansion

rem ls.bat
rem    * ls reimplementation for the Kali in Batch project.
rem    * Lists the contents of a directory.
rem    * Licensed under the Apache-2.0.

rem Initialize flags
set show_all=false
set long_format=false
set show_help=false
set "target_dir="

rem Parse arguments
for %%a in (%*) do (
    if "%%a"=="--help" (
        set show_help=true
    ) else if "%%a"=="-a" (
        set show_all=true
    ) else if "%%a"=="-l" (
        set long_format=true
    ) else if "%%a"=="--long" (
        set long_format=true
    ) else if "%%a"=="--all" (
        set show_all=true
    ) else if "%%a"=="-la" (
        set show_all=true
        set long_format=true
    ) else if "%%a"=="-al" (
        set show_all=true
        set long_format=true
    ) else (
        set "target_dir=%%~a"
    )
)

rem Show help and exit
if "!show_help!"=="true" (
    echo Usage: ls ^[options^] ^[directory ...^]
    echo.
    echo Options:
    echo   --all -a          Show all files including hidden ones
    echo   --long -l         Use long listing format
    echo   --help            Show this help message
    goto :eof
)

rem If no directory given, use current directory
if not defined target_dir (
    set "target_dir=."
)

rem Choose subroutine based on flags
if "!long_format!"=="true" (
    if "!show_all!"=="true" (
        call :long_all_ls "!target_dir!"
    ) else (
        call :long_ls "!target_dir!"
    )
) else (
    if "!show_all!"=="true" (
        call :all_ls "!target_dir!"
    ) else (
        call :regular_ls "!target_dir!"
    )
)

goto :eof

:regular_ls
rem List non-hidden files in short format
for /f "delims=" %%a in ('dir /b "%~1"') do (
    set "filename=%%a"
    if "!filename:~0,1!" NEQ "." (
        echo !filename!
    )
)
goto :eof

:all_ls
rem List all files (including hidden) in short format
echo ^.
echo ..
for /f "delims=" %%a in ('dir /b /a "%~1"') do (
    echo %%a
)
goto :eof

:long_ls
rem List non-hidden files in long format
for /f "tokens=1,2,3,*" %%a in ('dir /a "%~1"') do (
    set "line=%%a %%b %%c %%d"
    set "filename=%%d"
    if "!filename:~0,1!" NEQ "." (
        echo !line!
    )
)
goto :eof

:long_all_ls
rem List all files (including hidden) in long format
for /f "tokens=1,2,3,*" %%a in ('dir /a "%~1"') do (
    set "line=%%a %%b %%c %%d"
    set "filename=%%d"
    echo !line!
)
goto :eof
