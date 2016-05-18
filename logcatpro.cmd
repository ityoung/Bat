@echo off

:ISCONN
adb devices | findstr "\<device\>"
IF ERRORLEVEL==1 (
goto NOCONNECTED
)ELSE (
goto CONNECTED
)

:NOCONNECTED
echo  * 请先连接设备......
echo  连接手机后按任意键继续...
pause>nul
goto  ISCONN

:CONNECTED
cls
echo  * 设备已连接......
echo  ___________________________________________________
echo  请在手机上打开想抓取log的应用获取packageName
echo  完成后按任意键继续...
pause>nul
adb shell "dumpsys window windows | grep -E 'mFocusedApp'"
set /p package=  输入要抓取log的程序包名:
echo    _______________________________________________________________________
echo  * 正在抓取log 不要关闭此窗口.........
set t= %time:~0,5%
set T= %t::=-%
set TT=%T: =%
set D=%date:~0,10%
set DD=%D:/=-%
echo.
if '%package%'=='' (
echo  文件路径E:\log\logcat-all-%DD%-%TT%.log
echo.
echo  * 要停止抓取log请按car+c输入Y 回车 或者 直接关闭此窗口。
echo.
echo  * 如果在停止抓取logcat后，无法删除或者上传，可到任务管理器中删除adb.exe进程
echo   ----------------------------------------------
adb shell logcat -v time > E:\log\logcat-all-%DD%-%TT%.log
)else (
echo  文件路径E:\log\logcat-%DD%-%TT%.log
echo.
echo  * 要停止抓取log请按car+c输入Y 回车 或者 直接关闭此窗口。
echo.
echo  * 如果在停止抓取logcat后，无法删除或者上传，可到任务管理器中删除adb.exe进程
echo   ----------------------------------------------
adb shell "logcat -v time|grep %package%" > E:\log\logcat-%DD%-%TT%.log
)