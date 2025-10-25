rmdir ..\sources\mssql-2016 /q /s

sql2016\SQLServer2016-SSEI-Expr.exe /Quiet /Action=Download /MediaPath=%cd%\tmp /MediaType=Advanced

tmp\SQLEXPRADV_x64_ENU.exe /q /x:..\sources\mssql-2016
rmdir tmp /q /s

mkdir ..\sources\mssql-2016\cu
copy sql2016\sqlserver2016-kb5065227-x64_981cfebc854b2b8f25e928f85a0237f2e66c6a0d.exe ..\sources\mssql-2016\cu\ /Y

mkdir ..\sources\mssql-2016\gac\Microsoft.NetEnterpriseServers.ExceptionMessageBox\10.0.0.0__89845dcd8080cc91
mkdir ..\sources\mssql-2016\gac\Microsoft.SqlServer.CustomControls\10.0.0.0__89845dcd8080cc91
mkdir ..\sources\mssql-2016\gac\Microsoft.SqlServer.WizardFrameworkLite\10.0.0.0__89845dcd8080cc91
copy ..\sources\mssql-2016\1033_ENU_LP\x64\Setup\sql2008support\windows\gac\Q2BDSRKB.DLL ..\sources\mssql-2016\gac\Microsoft.NetEnterpriseServers.ExceptionMessageBox\10.0.0.0__89845dcd8080cc91\Microsoft.NetEnterpriseServers.ExceptionMessageBox.dll
copy ..\sources\mssql-2016\1033_ENU_LP\x64\Setup\sql2008support\windows\gac\-KKU9GG-.DLL ..\sources\mssql-2016\gac\Microsoft.SqlServer.CustomControls\10.0.0.0__89845dcd8080cc91\MICROSOFT.SQLSERVER.CUSTOMCONTROLS.DLL
copy ..\sources\mssql-2016\1033_ENU_LP\x64\Setup\sql2008support\windows\gac\YO4JF9KP.DLL ..\sources\mssql-2016\gac\Microsoft.SqlServer.WizardFrameworkLite\10.0.0.0__89845dcd8080cc91\Microsoft.SqlServer.WizardFrameworkLite.dll