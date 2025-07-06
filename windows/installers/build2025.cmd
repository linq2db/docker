rmdir ..\sources\mssql-2025 /q /s

sql2025\SQL2025-SSEI-Eval.exe /Quiet /Action=Download /MediaPath=%cd%\tmp /MediaType=CAB

tmp\SQLServer2025-x64-ENU.exe /q /x:..\sources\mssql-2025
rmdir tmp /q /s
