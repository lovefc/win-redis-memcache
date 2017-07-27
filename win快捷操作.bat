::常用集合,随时补充  ---by lovefc
@echo off
:operas
echo 快速操作 1:任务管理器 2:打开记事本 3:打开服务 4:控制面板 5:远程桌面 6:垃圾清理 88:关机 
set /p opera= 
if not defined opera (
echo 内容不能为空
)
if "%opera%"=="1"  (
start "" "C:\Windows\System32\taskmgr.exe"
call:operas
)
if "%opera%"=="2"  (
start "" "C:\Windows\System32\notepad.exe"
call:operas
)
if "%opera%"=="3"  (
start "" "C:\Windows\System32\services.msc"
call:operas
)
if "%opera%"=="4"  (
start "" "C:\Windows\System32\control.exe"
call:operas
)
if "%opera%"=="5"  (
mstsc
call:operas
)
if "%opera%"=="6"  (
Cleanmgr
call:operas
)

if "%opera%"=="88"  (
echo 随意按个键 3秒之后就关机。。。
pause
shutdown -s -t 3
)
GOTO:EOF 