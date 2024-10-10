@echo off
chcp 65001

cd ..

set BASE_DIR=%CD%
set VENV_DIR=%BASE_DIR%\.venv
set ACTIVATE_PATH=%VENV_DIR%\Scripts\activate.bat
set SQLITE_PATH=%BASE_DIR%\db.sqlite3

if exist %SQLITE_PATH% (
    del /F /Q %SQLITE_PATH%
)

call %ACTIVATE_PATH%

python scripts\删除迁移文件.py

pause