REM
REM $Id$
REM
cd "C:\Inetpub\wwwroot\KiAspdotnetFramework"
start /max explorer /e,/select,C:\Inetpub\wwwroot\KiAspdotnetFramework\.svn
start /max explorer ftp://kalipso:@sslws038.alentus.com/ssl/KiAspdotnetFramework_x
start /max KiAspdotnetFramework.sln
start "" /max "C:\Program Files\MySQL\MySQL Workbench\MySQLWorkbench.exe"
