@echo off
chcp 65001 >nul
echo ==========================================
echo   WANGSIYA Personal IP — GitHub Pages 部署
echo ==========================================
echo.

cd /d "%~dp0"

echo [1/4] 添加所有文件到暂存区...
git add .

echo [2/4] 提交...
git commit -m "deploy: upload all site files"

echo [3/4] 强制推送到 main 分支（覆盖远程旧的空仓库）...
git branch -M main 2>nul
git push -u origin main --force

echo.
echo ==========================================
echo   推送完成！
echo ==========================================
echo.
echo 现在去 GitHub 开启 Pages：
echo   1. 打开 https://github.com/livehhh/personal-ip/settings/pages
echo   2. Source 选 "Deploy from a branch"
echo   3. Branch 选 main / (root)
echo   4. 点 Save
echo.
echo 约 1-2 分钟后访问：
echo   https://livehhh.github.io/personal-ip/
echo.
pause
