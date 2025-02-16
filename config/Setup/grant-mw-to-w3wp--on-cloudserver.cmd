@echo off
REM
REM $Id$
REM
REM +==
REM |
REM | BODY
REM |
cd C:\inetpub\wwwroot
REM
REM Production
REM
set SUFFIX=
CALL :SUBSEQ
REM
REM X
REM
set SUFFIX=_x
CALL :SUBSEQ
REM |
REM | BODY
REM |
REM +==
REM
GOTO :EOF
REM
REM +==
REM |
REM | SUBSEQ
REM |
REM +==
:SUBSEQ
set APPPOOL=DefaultAppPool%SUFFIX%
CALL :SUBASPNET
EXIT /B
REM
REM +==
REM |
REM | SUBASPNET
REM |
REM +==
:SUBASPNET
icacls KiAspdotnetFramework%SUFFIX%\protected\scratch /grant "IIS APPPOOL\%APPPOOL%":M
EXIT /B
