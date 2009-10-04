REM
REM $Id$
REM
cd "C:\Inetpub\wwwroot\KiAspdotnetFramework"
start /max explorer /e,/select,C:\Inetpub\wwwroot\KiAspdotnetFramework\.svn
start "" /max "C:\Program Files\FileZilla FTP Client\filezilla.exe" --site=0/ftp.frompaper2web.com\/ssl/KiAspdotnetFramework_x
start /max KiAspdotnetFramework.sln
start "" /max "C:\Program Files\MySQL\MySQL Tools for 5.0\MySQLQueryBrowser.exe"
