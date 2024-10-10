@echo off
chcp 65001

REM 手动指定 python 解释器位置
set PYTHON_PATH="python"

cd ..

set BASE_DIR=%CD%
set VENV_DIR=%BASE_DIR%\.venv
set ACTIVATE_PATH=%VENV_DIR%\Scripts\activate.bat
set PYPROJECT_PATH=%BASE_DIR%\pyproject.toml

if not exist "%VENV_DIR%" (
    %PYTHON_PATH% -m venv %VENV_DIR%
)

call %ACTIVATE_PATH%

%PYTHON_PATH% -m pip install --upgrade pip

pip install poetry

if exist "%PYPROJECT_PATH%" (
    poetry install
) else (
    poetry init
)

pause