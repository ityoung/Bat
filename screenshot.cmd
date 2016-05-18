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
pause
goto  ISCONN

:CONNECTED
cls
echo  * 设备已连接......
pause>nul
echo  按任意键开始截图

:SCREENSHOT
cls
set t= %time:~0,8%
set T= %t::=%
set TT=%T: =%
set D=%date:~0,10%
set DD=%D:/=%
echo  截图中...
adb shell /system/bin/screencap -p /sdcard/screenshot%DD%%TT%.png
adb pull /sdcard/screenshot%DD%%TT%.png F://
echo.
echo  文件路径F:\screenshot%DD%%TT%.png
echo.
echo  * 要停止截图请按car+c输入Y 回车 或者 直接关闭此窗口。
echo.
echo  按任意键继续截图
pause>nul
goto SCREENSHOT
