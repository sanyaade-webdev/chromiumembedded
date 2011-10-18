@echo off
setlocal

if "%1" == "" (
echo ERROR: Please specify a build target: Debug or Release
goto end
)

if "%2" == "" (
set PROJECT_NAME=cefclient
) else (
set PROJECT_NAME=%2
)

echo Configuring Visual Studio environment...
if "%GYP_MSVS_VERSION%" == "2008" (
call "%VS90COMNTOOLS%vsvars32.bat"
set PROJECT_EXT=.vcproj
) else (
call "%VS100COMNTOOLS%vsvars32.bat"
set PROJECT_EXT=.vcxproj
)

echo Building %1 target for %PROJECT_NAME% project...
devenv.com /build %1 ..\cef.sln /project %PROJECT_NAME%%PROJECT_EXT%

:end
endlocal