@echo off

:ISCONN
adb devices | findstr "\<device\>"
IF ERRORLEVEL==1 (
goto NOCONNECTED
)ELSE (
goto CONNECTED
)

:NOCONNECTED
echo  * ���������豸......
pause
goto  ISCONN

:CONNECTED
cls
echo  * �豸������......
pause>nul
echo  ���������ʼ��ͼ

:SCREENSHOT
cls
set t= %time:~0,8%
set T= %t::=%
set TT=%T: =%
set D=%date:~0,10%
set DD=%D:/=%
echo  ��ͼ��...
adb shell /system/bin/screencap -p /sdcard/screenshot%DD%%TT%.png
adb pull /sdcard/screenshot%DD%%TT%.png F://
echo.
echo  �ļ�·��F:\screenshot%DD%%TT%.png
echo.
echo  * Ҫֹͣ��ͼ�밴car+c����Y �س� ���� ֱ�ӹرմ˴��ڡ�
echo.
echo  �������������ͼ
pause>nul
goto SCREENSHOT
