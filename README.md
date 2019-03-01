#DSNtoCSV
Powershell script to connect to a traditional SQL styled server via a user or System DSN, so that you can perform a query against a database and cleanly export the results to CSV. 

##Variables to set
The file was written with reuse in mind, but it does need a few things
- DSN (The DSN you want to use)
- ftppath (The local path you want to store the files while it writes to disk)
- extract file name and temp file name (the file names you want to write. Temp file is there to perform the cleanup as i couldnt figure out a better way yet)
- DBCmdText (the actual query)

##why powershell?
I used powershell for this simply because a lot of archaic servers im dealing with that need SQL extraction were running Windows Server 2012 (yep, it still exists) and just had powershell ready to go. Next step would be to build a python equiv. 
