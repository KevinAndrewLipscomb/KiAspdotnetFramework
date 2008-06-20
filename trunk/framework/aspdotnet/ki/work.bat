REM
REM $Id$
REM
cd "C:\Inetpub\wwwroot\KiAspdotnetFramework"
start /max explorer /e,/select,C:\Inetpub\wwwroot\KiAspdotnetFramework\.svn
start /max explorer ftp://ftp.frompaper2web.com/ssl/KiAspdotnetFramework_x
start /max KiAspdotnetFramework.dproj
start "" /max "C:\Program Files\MySQL\MySQL Tools for 5.0\MySQLQueryBrowser.exe"
