@echo on

curl -sSLf -o installer.exe "%PYTHON_INSTALLER%" ^
    || ( echo "curl command failed" & exit /b %ERRORLEVEL% )

installer.exe /quiet InstallAllUsers=1 PrependPath=0 Include_test=0 ^
    "TargetDir=%PYTHON%" > installer.log  || exit /b %ERRORLEVEL%
type installer.log

if not exist "%PYTHON%\python" (
    echo "Failed to install python" >2
    exit /b %ERRORLEVEL%
)

"%PYTHON%\python" --version     || exit /b %ERRORLEVEL%
"%PYTHON%\python" -m ensurepip  || exit /b %ERRORLEVEL%

rem )
