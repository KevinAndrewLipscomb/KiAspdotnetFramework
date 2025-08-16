[CmdletBinding()]
Param
  (
  [string]
  [Parameter(Position=0)]
  [ValidateNotNullOrEmpty()]
  [ValidateSet("d","x","p")]
    $TargetEnvironment = $(Read-Host "[-TargetEnvironment] ... Refresh which target environment (d or x)?"),
  [string]
  [Parameter(Position=1)]
  [ValidateNotNullOrEmpty()]
  [ValidateScript({Test-Path $_})]
    $LoadScriptFolder = $(Read-Host "[-LoadScriptFolder] ... Using load script from which folder?")
  )
#
$scriptName = $($(Get-ChildItem $PsCommandPath).BaseName)
$base_db_name = "kiaspdotnetframeworkdb"
#
$targetEnvironmentSuffix = switch ($TargetEnvironment)
  {
  "d" { "_d" }
  "x" { "_x" }
  "p" { "" }
  }
$db_instance = "$base_db_name$targetEnvironmentSuffix"
mysql --user=root --execute="quit" # to test the connection
if ($LASTEXITCODE -eq 1)
  {
  mysql_config_editor set --host=localhost --user=root --password
  }
$be_production = ("$db_instance" -eq "$base_db_name")
$be_insistent = $false
if ($be_production)
  {
  Write-Host ""
  Write-Host "WARNING: You will be DROPPING and RELOADING the PRODUCTION database!"
  Pause
  Write-Host ""
  Write-Host "LAST CHANCE: If the PRODUCTION DATABASE is currently in use, proceeding is probably a CATASTROPHIC MISTAKE!!!"
  New-Variable -Option:Constant CHALLENGE "DROP-PRODUCTION-DB"
  $be_insistent = ($(Read-Host "CONFIRM: If you really want to proceed, enter '$CHALLENGE'") -ceq $CHALLENGE)
  }
if ((-not $be_production) -or $be_insistent)
  {
  Write-Host -NoNewline "Dropping schema $db_instance..."
  mysql --execute="drop schema $db_instance"
  Write-Host "DONE."
  Write-Host -NoNewline "Creating schema $db_instance..."
  mysql --execute="create schema $db_instance"
  Write-Host "DONE."
  Write-Host -NoNewline "Populating instance appropriately..."
  $OutputEncoding = [System.Text.UTF8Encoding]::new()
  Get-Content (Join-Path -Path $LoadScriptFolder -ChildPath "$base_db_name.sql") -Encoding:UTF8 |
    ForEach-Object { $_ -creplace "NO_AUTO_CREATE_USER,","" } |
    mysql --database=$db_instance
  Write-Host "DONE."
  if (-not $be_production)
    {
    Write-Host -NoNewline "Isolating instance from production stakeholders..."
    Get-Content 0-render-safe-for-d-or-x.sql |
      mysql --database=$db_instance
    Write-Host "DONE."
    }
  Write-Host "$scriptName COMPLETE."
  }
else
  {
  Write-Host "$scriptName ABORTED."
  }
Pause
