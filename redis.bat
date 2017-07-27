::其实我也不知道为什么要注释，大概因为心情不好！--by lovefc
@echo off  
echo 启动redis,点击继续。。。。 
pause
start "" "%~dp0Redis3.2.100\redis-server.exe" %~dp0Redis3.2.100\redis.windows.conf
::~dp0redis-cli.exe -h 127.0.0.1 -p 6379
