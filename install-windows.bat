@echo off

set DIR=%cd%

cd "C:\Windows"

if exist "C:\Program Files\Steam\steamapps\common\Counter-Strike Global Offensive\game\csgo" (
cd "C:\Program Files\Steam\steamapps\common\Counter-Strike Global Offensive\game\csgo"
)

if exist "C:\Program Files (x86)\Steam\steamapps\common\Counter-Strike Global Offensive\game\csgo" (
cd "C:\Program Files (x86)\Steam\steamapps\common\Counter-Strike Global Offensive\game\csgo"
) else (
echo "Cannot find CS:2 installation!"
)

if exist cfg\custom (
rmdir cfg\custom
)

if exist cfg\autoexec.cfg (
del cfg\autoexec.cfg
)

xcopy /e /v /Y %DIR%\simpleradar resource\overviews

xcopy /e /v /Y %DIR%\blank-panorama panorama\videos89

mklink cfg\autoexec.cfg %DIR%\01-autoexec.cfg

if not exist custom (
mklink /D cfg\custom %DIR%
)

echo[
echo "Installation complete!"
echo[
echo "Please set up your launch options:"
echo "	-fullscreen -nojoy -vulkan"
echo[
