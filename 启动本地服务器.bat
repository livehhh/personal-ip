@echo off
chcp 65001 >nul
cd /d "%~dp0"
echo ============================================
echo   本地服务器启动中...
echo   请保持此窗口不要关闭！
echo ============================================
echo.
echo   启动成功后，请在浏览器中打开：
echo   http://localhost:8080/personal-ip.html
echo.
echo   关闭此窗口 = 停止服务器
echo ============================================
echo.
python -m http.server 8080
pause
