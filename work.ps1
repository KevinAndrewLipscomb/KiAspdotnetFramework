Set-Location "C:\Inetpub\wwwroot\KiAspdotnetFramework"
Start-Process -WindowStyle Maximized "C:\Inetpub\wwwroot\KiAspdotnetFramework"
Start-Process -WindowStyle Maximized KiAspdotnetFramework.sln
IF (Test-Path "C:\Program Files\MySQL\MySQL Workbench\MySQLWorkbench.exe")
  {
  Start-Process -WindowStyle Maximized "C:\Program Files\MySQL\MySQL Workbench\MySQLWorkbench.exe"
  }
ELSE
  {
  Start-Process -WindowStyle Maximized "C:\Program Files (x86)\MySQL\MySQL Workbench\MySQLWorkbench.exe"
  }
