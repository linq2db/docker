rmdir ..\sources\mssql-2022 /q /s

sql2022\SQL2022-SSEI-Expr.exe /Quiet /Action=Download /MediaPath=%cd%\tmp /MediaType=Advanced

tmp\SQLEXPRADV_x64_ENU.exe /q /x:..\sources\mssql-2022
rmdir tmp /q /s

mkdir ..\sources\mssql-2022\cu
copy sql2022\sqlserver2022-kb5065865-x64_d3f857bf4df7a52fc5597a040c5846aedff394e0.exe ..\sources\mssql-2022\cu\ /Y

mkdir ..\sources\mssql-2022\gac
xcopy sql2022-gac\ ..\sources\mssql-2022\gac\ /s /e /h
