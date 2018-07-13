::其实我也不知道为什么要注释，大概因为心情不好！--by lovefc
::兼容win10 2018-07-14 增加一个命令行界面
@echo off  
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" /v "c:\windows\system32\cmd.exe" /d "RUNASADMIN" /f
echo 启动redis,点击继续。。。。 
pause
set My_PATH=%~dp0Redis3.2.100
start "" "%My_PATH%\redis-server.exe" %My_PATH%\redis.windows.conf
start %My_PATH%\redis-cli.exe

