rmdir ..\sources\mssql-2017 /q /s

sql2017\SQLServer2017-SSEI-Expr.exe /Quiet /Action=Download /MediaPath=%cd%\tmp /MediaType=Advanced

tmp\SQLEXPRADV_x64_ENU.exe /q /x:..\sources\mssql-2017
rmdir tmp /q /s

mkdir ..\sources\mssql-2017\cu
copy sql2017\sqlserver2017-kb5065225-x64_d30d387b39d6518e491437ee3157784de374e8ae.exe ..\sources\mssql-2017\cu\ /Y

mkdir ..\sources\mssql-2017\gac