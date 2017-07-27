::其实这个脚本我并不确定能在你们的机器上运行起来  ---by lovefc
@echo off 
echo 检测系统。。。。
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" /v "c:\windows\system32\cmd.exe" /d "RUNASADMIN" /f
call:win_is_64
if "%BITS%"=="true"  (
echo win-64
set memcahe_dir=%~dp0x64
) else (
echo win-32
set memcahe_dir=%~dp0x86
)
echo 是否启动memcache？
pause
start "" "%memcahe_dir%\memcached.exe" -d install
echo memcached安装成功!是否启动？
pause
start "" "%memcahe_dir%\memcached.exe" -d start
echo memcached启动成功！
call:operas %memcahe_dir%

:win_is_64
if "%PROCESSOR_ARCHITECTURE%"=="AMD64" (
  set BITS=true
) else (
  set BITS=false
)
GOTO:EOF 

:operas
echo 接下来可以选择的操作 1:重启 2:关闭 3:卸载
set /p opera= 
if not defined opera (
echo 内容不能为空
)
if "%opera%"=="1"  (
%~1\memcached.exe -d stop
start "" "%~1\memcached.exe" -d start
echo memcached重启成功！
call:operas %~1
)
if "%opera%"=="2"  (
taskkill /im "memcached.exe" /f
echo memcached已经关闭！
call:operas %~1
)
if "%opera%"=="3"  (
%~1\memcached.exe -d stop
%~1\memcached.exe -d uninstall
echo 注意查看本地服务
pause
)
GOTO:EOF 