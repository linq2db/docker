rmdir ..\sources\mssql-2019 /q /s

sql2019\SQL2019-SSEI-Expr.exe /Quiet /Action=Download /MediaPath=%cd%\tmp /MediaType=Advanced

tmp\SQLEXPRADV_x64_ENU.exe /q /x:..\sources\mssql-2019
rmdir tmp /q /s

mkdir ..\sources\mssql-2019\cu
copy sql2019\sqlserver2019-kb5065222-x64_6c79c7bda2b1dd4f6903c4534aa90a1d2ed8c84b.exe ..\sources\mssql-2019\cu\ /Y

mkdir ..\sources\mssql-2019\gac