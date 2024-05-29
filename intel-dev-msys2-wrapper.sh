#!/bin/bash

## USE:
##  - First argument is compiler (must be 'ifx' or 'ifort'

FC="$1"
shift


## How I got ifx to work in a MSYS2 shell
##
## - I did this at a CMD prompt:
##    set > eBefore.txt
##    "C:\Program Files (x86)\Intel\oneAPI\setvars.bat"
##    set > eAfter.txt
## - Used diff and ediff to see what was set, and paste it into this file.
## - Converted some of the PATHS bits to have no spaces
## - Removed all double \\
## - For enviornment variable lines
##   - Replaced every single \ with \\
##   - Added ' after equals and at end of lines
##   - Added '# export ' at the start of each line.
## - Incrementally added PATH components and variables till compiles work.

## Path before adds
# C:\PROGRA~2\Intel\oneAPI\tbb\latest\bin
# C:\PROGRA~2\Intel\oneAPI\ocloc\latest\bin
# C:\PROGRA~2\Intel\oneAPI\mpi\latest\opt\mpi\libfabric\bin
# C:\PROGRA~2\Intel\oneAPI\mpi\latest\bin
# C:\PROGRA~2\Intel\oneAPI\dev-utilities\latest\bin
# C:\PROGRA~2\Intel\oneAPI\debugger\latest\opt\debugger\bin
# C:\PROGRA~2\Intel\oneAPI\compiler\latest\lib\ocloc
export PATH=`cygpath -u 'C:\PROGRA~2\Intel\oneAPI\compiler\latest\bin'`:$PATH
# C:\PROGRA~2\Intel\oneAPI\compiler\latest\opt\oclfpga\host\windows64\bin
# C:\PROGRA~2\Intel\oneAPI\compiler\latest\opt\oclfpga\bin
export PATH=`cygpath -u 'C:\PROGRA~1\MIB055~1\2022\Community\VC\Tools\MSVC\14.33.31629\bin\HostX64\x64'`:$PATH
# C:\PROGRA~1\MIB055~1\2022\Community\Common7\IDE\VC\VCPackages
# C:\PROGRA~1\MIB055~1\2022\Community\Common7\IDE\CommonExtensions\Microsoft\TestWindow
# C:\PROGRA~1\MIB055~1\2022\Community\Common7\IDE\CommonExtensions\Microsoft\TeamFoundation\Team Explorer
# C:\PROGRA~1\MIB055~1\2022\Community\MSBuild\Current\bin\Roslyn
# C:\PROGRA~1\MIB055~1\2022\Community\Team Tools\Performance Tools\x64
# C:\PROGRA~1\MIB055~1\2022\Community\Team Tools\Performance Tools
# C:\PROGRA~2\Microsoft SDKs\Windows\v10.0A\bin\NETFX 4.8 Tools\x64
# C:\PROGRA~2\HTML Help Workshop
# C:\PROGRA~2\Windows Kits\10\bin\10.0.22621.0\x64
# C:\PROGRA~2\Windows Kits\10\bin\x64
# C:\PROGRA~1\MIB055~1\2022\Community\\MSBuild\Current\Bin\amd64
# C:\Windows\Microsoft.NET\Framework64\v4.0.30319
# C:\PROGRA~1\MIB055~1\2022\Community\Common7\IDE
# C:\PROGRA~1\MIB055~1\2022\Community\Common7\Tools

## Path after adds
# C:\PROGRA~1\MIB055~1\2022\Community\Common7\IDE\CommonExtensions\Microsoft\CMake\CMake\bin
# C:\PROGRA~1\MIB055~1\2022\Community\Common7\IDE\CommonExtensions\Microsoft\CMake\Ninja
# C:\PROGRA~1\MIB055~1\2022\Community\Common7\IDE\VC\Linux\bin\ConnectionManagerExe

## Various variables added
# export CMAKE_PREFIX_PATH='C:\\Program Files (x86)\\Intel\\oneAPI\\tbb\\latest\\env\\..;C:\\Program Files (x86)\\Intel\\oneAPI\\dpl\\latest\\lib\\cmake\\oneDPL;C:\\Program Files (x86)\\Intel\\oneAPI\\compiler\\latest;'
# export CMPLR_ROOT='C:\\Program Files (x86)\\Intel\\oneAPI\\compiler\\latest'
# export CommandPromptType='Native'
# export CPATH='C:\\Program Files (x86)\\Intel\\oneAPI\\tbb\\latest\\env\\..\\include;C:\\Program Files (x86)\\Intel\\oneAPI\\ocloc\\latest\\include;C:\\Program Files (x86)\\Intel\\oneAPI\\dpl\\latest\\include;C:\\Program Files (x86)\\Intel\\oneAPI\\dev-utilities\\latest\\include;C:\\Program Files (x86)\\Intel\\oneAPI\\compiler\\latest\\include;C:\\Program Files (x86)\\Intel\\oneAPI\\compiler\\latest\\opt\\oclfpga\\include;'
# export DevEnvDir='C:\\Program Files\\Microsoft Visual Studio\\2022\\Community\\Common7\\IDE\\'
# export DPL_ROOT='C:\\Program Files (x86)\\Intel\\oneAPI\\dpl\\latest'
# export ExtensionSdkDir='C:\\Program Files (x86)\\Microsoft SDKs\\Windows Kits\\10\\ExtensionSDKs'
# export EXTERNAL_INCLUDE='C:\\Program Files\\Microsoft Visual Studio\\2022\\Community\\VC\\Tools\\MSVC\\14.33.31629\\include;C:\\Program Files\\Microsoft Visual Studio\\2022\\Community\\VC\\Tools\\MSVC\\14.33.31629\\ATLMFC\\include;C:\\Program Files\\Microsoft Visual Studio\\2022\\Community\\VC\\Auxiliary\\VS\\include;C:\\Program Files (x86)\\Windows Kits\\10\\include\\10.0.22621.0\\ucrt;C:\\Program Files (x86)\\Windows Kits\\10\\include\\10.0.22621.0\\um;C:\\Program Files (x86)\\Windows Kits\\10\\include\\10.0.22621.0\\shared;C:\\Program Files (x86)\\Windows Kits\\10\\include\\10.0.22621.0\\winrt;C:\\Program Files (x86)\\Windows Kits\\10\\include\\10.0.22621.0\\cppwinrt;C:\\Program Files (x86)\\Windows Kits\\NETFXSDK\\4.8\\include\\um'
# export Framework40Version='v4.0'
# export FrameworkDir='C:\\Windows\\Microsoft.NET\\Framework64\\'
# export FrameworkDir64='C:\\Windows\\Microsoft.NET\\Framework64\\'
# export FrameworkVersion='v4.0.30319'
# export FrameworkVersion64='v4.0.30319'
# export HTMLHelpDir='C:\\Program Files (x86)\\HTML Help Workshop'
# export IFCPATH='C:\\Program Files\\Microsoft Visual Studio\\2022\\Community\\VC\\Tools\\MSVC\\14.33.31629\\ifc\\x64'
# export INCLUDE='C:\\Program Files (x86)\\Intel\\oneAPI\\tbb\\latest\\env\\..\\include;C:\\Program Files (x86)\\Intel\\oneAPI\\ocloc\\latest\\include;C:\\Program Files (x86)\\Intel\\oneAPI\\mpi\\latest\\env\\..\\include;C:\\Program Files (x86)\\Intel\\oneAPI\\dev-utilities\\latest\\include;C:\\Program Files (x86)\\Intel\\oneAPI\\compiler\\latest\\include;C:\\Program Files\\Microsoft Visual Studio\\2022\\Community\\VC\\Tools\\MSVC\\14.33.31629\\include;C:\\Program Files\\Microsoft Visual Studio\\2022\\Community\\VC\\Tools\\MSVC\\14.33.31629\\ATLMFC\\include;C:\\Program Files\\Microsoft Visual Studio\\2022\\Community\\VC\\Auxiliary\\VS\\include;C:\\Program Files (x86)\\Windows Kits\\10\\include\\10.0.22621.0\\ucrt;C:\\Program Files (x86)\\Windows Kits\\10\\include\\10.0.22621.0\\um;C:\\Program Files (x86)\\Windows Kits\\10\\include\\10.0.22621.0\\shared;C:\\Program Files (x86)\\Windows Kits\\10\\include\\10.0.22621.0\\winrt;C:\\Program Files (x86)\\Windows Kits\\10\\include\\10.0.22621.0\\cppwinrt;C:\\Program Files (x86)\\Windows Kits\\NETFXSDK\\4.8\\include\\um'
# export INTELFPGAOCLSDKROOT='C:\\Program Files (x86)\\Intel\\oneAPI\\compiler\\latest\\opt\\oclfpga'
# export INTELGTDEBUGGERROOT='C:\\Program Files (x86)\\Intel\\oneAPI\\debugger\\latest\\env\\..'
# export INTEL_TARGET_ARCH='intel64'
# export I_MPI_OFI_LIBRARY_INTERNAL='1'
# export I_MPI_ROOT='C:\\Program Files (x86)\\Intel\\oneAPI\\mpi\\latest\\env\\..'
export LIB='C:\\Program Files (x86)\\Intel\\oneAPI\\tbb\\latest\\env\\..\\lib\\;C:\\Program Files (x86)\\Intel\\oneAPI\\mpi\\latest\\env\\..\\lib;C:\\Program Files (x86)\\Intel\\oneAPI\\compiler\\latest\\lib\\clang\\18\\lib\\windows;C:\\Program Files (x86)\\Intel\\oneAPI\\compiler\\latest\\opt\\compiler\\lib;C:\\Program Files (x86)\\Intel\\oneAPI\\compiler\\latest\\lib;C:\\Program Files\\Microsoft Visual Studio\\2022\\Community\\VC\\Tools\\MSVC\\14.33.31629\\ATLMFC\\lib\\x64;C:\\Program Files\\Microsoft Visual Studio\\2022\\Community\\VC\\Tools\\MSVC\\14.33.31629\\lib\\x64;C:\\Program Files (x86)\\Windows Kits\\NETFXSDK\\4.8\\lib\\um\\x64;C:\\Program Files (x86)\\Windows Kits\\10\\lib\\10.0.22621.0\\ucrt\\x64;C:\\Program Files (x86)\\Windows Kits\\10\\lib\\10.0.22621.0\\um\\x64'
# export LIBPATH='C:\\Program Files\\Microsoft Visual Studio\\2022\\Community\\VC\\Tools\\MSVC\\14.33.31629\\ATLMFC\\lib\\x64;C:\\Program Files\\Microsoft Visual Studio\\2022\\Community\\VC\\Tools\\MSVC\\14.33.31629\\lib\\x64;C:\\Program Files\\Microsoft Visual Studio\\2022\\Community\\VC\\Tools\\MSVC\\14.33.31629\\lib\\x86\\store\\references;C:\\Program Files (x86)\\Windows Kits\\10\\UnionMetadata\\10.0.22621.0;C:\\Program Files (x86)\\Windows Kits\\10\\References\\10.0.22621.0;C:\\Windows\\Microsoft.NET\\Framework64\\v4.0.30319'
# export NETFXSDKDir='C:\\Program Files (x86)\\Windows Kits\\NETFXSDK\\4.8\\'
# export OCLOC_ROOT='C:\\Program Files (x86)\\Intel\\oneAPI\\ocloc\\latest'
# export OCL_ICD_FILENAMES='C:\\Program Files (x86)\\Intel\\oneAPI\\compiler\\latest\\opt\\oclfpga\\host\\windows64\\bin\\alteracl.dll;C:\\Program Files (x86)\\Intel\\oneAPI\\compiler\\latest\\bin\\intelocl64_emu.dll;C:\\Program Files (x86)\\Intel\\oneAPI\\compiler\\latest\\bin\\intelocl64.dll'
# export ONEAPI_ROOT='C:\\Program Files (x86)\\Intel\\oneAPI'
# export PKG_CONFIG_PATH='C:\\Program Files (x86)\\Intel\\oneAPI\\tbb\\latest\\env\\..\\lib\\pkgconfig;C:\\Program Files (x86)\\Intel\\oneAPI\\mpi\\latest\\env\\..\\lib\\pkgconfig;C:\\Program Files (x86)\\Intel\\oneAPI\\dpl\\latest\\lib\\pkgconfig;C:\\Program Files (x86)\\Intel\\oneAPI\\compiler\\latest\\lib\\pkgconfig;'
# export Platform='x64'
# export SETVARS_COMPLETED='1'
# export TBBROOT='C:\\Program Files (x86)\\Intel\\oneAPI\\tbb\\latest\\env\\..'
# export TBB_BIN_DIR='C:\\Program Files (x86)\\Intel\\oneAPI\\tbb\\latest\\env\\..\\bin'
# export TBB_DLL_PATH='C:\\Program Files (x86)\\Intel\\oneAPI\\tbb\\latest\\env\\..\\bin\\'
# export TBB_SCRIPT_DIR='C:\\Program Files (x86)\\Intel\\oneAPI\\tbb\\latest\\env\\'
# export TBB_TARGET_ARCH='intel64'
# export UCRTVersion='10.0.22621.0'
# export UniversalCRTSdkDir='C:\\Program Files (x86)\\Windows Kits\\10\\'
# export USE_INTEL_LLVM='0'
# export VARSDIR='C:\\Program Files (x86)\\Intel\\oneAPI\\ocloc\\latest\\env\\'
# export VCIDEInstallDir='C:\\Program Files\\Microsoft Visual Studio\\2022\\Community\\Common7\\IDE\\VC\\'
# export VCINSTALLDIR='C:\\Program Files\\Microsoft Visual Studio\\2022\\Community\\VC\\'
# export VCToolsInstallDir='C:\\Program Files\\Microsoft Visual Studio\\2022\\Community\\VC\\Tools\\MSVC\\14.33.31629\\'
# export VCToolsRedistDir='C:\\Program Files\\Microsoft Visual Studio\\2022\\Community\\VC\\Redist\\MSVC\\14.32.31326\\'
# export VCToolsVersion='14.33.31629'
# export VisualStudioVersion='17.0'
# export VS170COMNTOOLS='C:\\Program Files\\Microsoft Visual Studio\\2022\\Community\\Common7\\Tools\\'
# export VSCMD_ARG_app_plat='Desktop'
# export VSCMD_ARG_HOST_ARCH='x64'
# export VSCMD_ARG_TGT_ARCH='x64'
# export VSCMD_VER='17.3.6'
# export VSINSTALLDIR='C:\\Program Files\\Microsoft Visual Studio\\2022\\Community\\'
# export VS_TARGET_ARCH='amd64'
# export WindowsLibPath='C:\\Program Files (x86)\\Windows Kits\\10\\UnionMetadata\\10.0.22621.0;C:\\Program Files (x86)\\Windows Kits\\10\\References\\10.0.22621.0'
# export WindowsSdkBinPath='C:\\Program Files (x86)\\Windows Kits\\10\\bin\\'
# export WindowsSdkDir='C:\\Program Files (x86)\\Windows Kits\\10\\'
# export WindowsSDKLibVersion='10.0.22621.0\\'
# export WindowsSdkVerBinPath='C:\\Program Files (x86)\\Windows Kits\\10\\bin\\10.0.22621.0\\'
# export WindowsSDKVersion='10.0.22621.0\\'
# export WindowsSDK_ExecutablePath_x64='C:\\Program Files (x86)\\Microsoft SDKs\\Windows\\v10.0A\\bin\\NETFX 4.8 Tools\\x64\\'
# export WindowsSDK_ExecutablePath_x86='C:\\Program Files (x86)\\Microsoft SDKs\\Windows\\v10.0A\\bin\\NETFX 4.8 Tools\\'
# export __DOTNET_ADD_64BIT='1'
# export __DOTNET_PREFERRED_BITNESS='64'
# export __MS_VC_INSTALL_PATH='C:\\Program Files\\Microsoft Visual Studio\\2022\\Community\\VC\\Tools\\MSVC\\14.33.31629\\'
# export __VSCMD_PREINIT_PATH='C:\\Program Files\\MATLAB\\R2023b\\bin;C:\\Program Files\\MATLAB\\R2023b\\bin\\win64;C:\\Program Files\\MATLAB\\R2022b\\bin;C:\\Program Files\\MATLAB\\R2022b\\bin\\win64;C:\\Program Files\\Microsoft HPC Pack 2008 R2\\Bin\\;C:\\WINDOWS\\system32;C:\\WINDOWS;C:\\WINDOWS\\System32\\Wbem;C:\\WINDOWS\\System32\\WindowsPowerShell\\v1.0\\;C:\\WINDOWS\\System32\\OpenSSH\\;C:\\Program Files\\Steel Bank Common Lisp\\;C:\\Program Files\\dotnet\\;C:\\Users\\richmit\\AppData\\Local\\Microsoft\\WindowsApps;C:\\Users\\richmit\\AppData\\Local\\Microsoft\\WindowsApps'

$FC -stand:f95 "$@"
