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
echo  �����ֻ������������...
pause>nul
goto  ISCONN

:CONNECTED
cls
echo  * �豸������......
echo  ___________________________________________________
echo  �����ֻ��ϴ���ץȡlog��Ӧ�û�ȡpackageName
echo  ��ɺ����������...
pause>nul
adb shell "dumpsys window windows | grep -E 'mFocusedApp'"
set /p package=  ����Ҫץȡlog�ĳ������:
echo    _______________________________________________________________________
echo  * ����ץȡlog ��Ҫ�رմ˴���.........
set t= %time:~0,5%
set T= %t::=-%
set TT=%T: =%
set D=%date:~0,10%
set DD=%D:/=-%
echo.
if '%package%'=='' (
echo  �ļ�·��E:\log\logcat-all-%DD%-%TT%.log
echo.
echo  * Ҫֹͣץȡlog�밴car+c����Y �س� ���� ֱ�ӹرմ˴��ڡ�
echo.
echo  * �����ֹͣץȡlogcat���޷�ɾ�������ϴ����ɵ������������ɾ��adb.exe����
echo   ----------------------------------------------
adb shell logcat -v time > E:\log\logcat-all-%DD%-%TT%.log
)else (
echo  �ļ�·��E:\log\logcat-%DD%-%TT%.log
echo.
echo  * Ҫֹͣץȡlog�밴car+c����Y �س� ���� ֱ�ӹرմ˴��ڡ�
echo.
echo  * �����ֹͣץȡlogcat���޷�ɾ�������ϴ����ɵ������������ɾ��adb.exe����
echo   ----------------------------------------------
adb shell "logcat -v time|grep %package%" > E:\log\logcat-%DD%-%TT%.log
)