@echo off
color 37
mode con cols=36 lines=20
title Vortex中文汉化安装脚本
echo Vortex中文汉化安装脚本
echo.
echo 脚本作者：liuyanxi
echo.
echo ==============================
echo.
if exist zh (
goto B
) else (
goto ERROR2
)
:B
if "%APPDATA%" == "" (
		goto ERROR
	)
set path=%APPDATA%\Vortex
:A
echo 点击任意键开始安装汉化...
pause >nul
cls
md "%path%\locales\zh" >nul 2>nul
copy /y zh %path%\locales\zh
if %errorlevel% geq 1 (
goto ERROR3
) else (
goto E
)
:E
echo.
echo ==============================
echo.
echo 命令执行成功！
echo.
echo 安装完成后，您需要打开Vortex，进入：SETTINGS-INTERFACE-LANGUAGE选择中文。
echo.
echo 如果您的脚本运行存在问题，或对翻译有更好的建议，可向github项目：liuyanxi975/Chinese-Translation-for-Vortex提交issues或pr，非常感谢！
echo.
echo 按任意键退出脚本....
pause >nul
exit
:ERROR
echo 自动获取目录失败，您需要手动输入一些参数。每一项参数均有设定默认值，如使用默认值请直接回车即可。
echo.
echo 按任意键表示我了解并继续...
pause >nul
:D
cls
set name=Administrator
set /p name=请输入您的计算机用户名（默认Administrator）：
set drive=C
echo.
set /p drive=请输入您的系统盘（输入字母。默认C盘）：
set path=%drive%:\Users\%name%\AppData\Roaming\vortex
echo.
if exist %path% (
echo 设定完成！
echo.
goto A
) else (
echo 参数错误，无法找到目录！按任意键重新输入参数。如果依旧失败请手动安装。
pause >nul
goto D
)
:ERROR2
echo 请将汉化文件夹“zh”和本脚本放置在同一目录后再试！
echo.
echo 按任意键退出脚本....
pause >nul
exit
:ERROR3
echo.
echo ==============================
echo.
echo 命令执行错误！具体错误请查看上述显示。
echo.
echo 如问题无法得到解决请尝试手动安装,手动安装教程在压缩包和网站都有!
echo.
echo 如果您愿意可向github项目：liuyanxi975/Chinese-Translation-for-Vortex提交issues与我取得联系，非常感谢！
echo.
echo 按任意键退出脚本....
pause >nul
exit
