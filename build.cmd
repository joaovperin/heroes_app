@echo off
setlocal EnableDelayedExpansion
    set DOTENV_FILE=dotenv.env
    if not exist "%DOTENV_FILE%" (
        echo "DOTENV_FILE '%DOTENV_FILE%' not found!" && exit
    )
    set ADD_PARAMS=
    for /f "tokens=*" %%i in ('type "%DOTENV_FILE%"') do SET ADD_PARAMS=!ADD_PARAMS! --dart-define=%%i
    flutter build web --release !ADD_PARAMS!
    cp build\web\assets\%DOTENV_FILE% build\web
endlocal
