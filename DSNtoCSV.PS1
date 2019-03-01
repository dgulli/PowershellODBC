
$dsn = "DSN PATH HERE"
$ftppath ="LOCAL PATH HERE"

$DBConnectionString = "DSN="+ $dsn;

$DBConn = New-Object System.Data.Odbc.OdbcConnection;
$DBConn.ConnectionString = $DBConnectionString;
$DBConn.Open();
$DBCmd = $DBConn.CreateCommand();
$DBCmd.CommandText = "ENTER QUERY HERE";

$SqlAdapter = New-Object System.Data.Odbc.OdbcDataAdapter($DBCmd);
$DataSet = New-Object System.Data.DataSet;
$SqlAdapter.Fill($DataSet);


$extractFile = $ftppath + @"
\CSV FILE NAME.csv
"@

$extractFileNew = $ftppath + @"
\CSV TEMP FILE.csv
"@

$DataSet.Tables[0] | Export-Csv -NoTypeInformation -delimiter "|" -path $extractFile

(Get-Content $extractFile) | Foreach-Object {$_ -replace '"',""}| Select-Object -Skip 1 | Out-File $extractFileNew
Get-Content $extractFileNew | Set-Content -Path $extractFile
Remove-Item $extractFileNew

$DBConn.Close();