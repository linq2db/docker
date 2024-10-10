ECHO OFF

REM try to remove existing container
docker stop sql2012
docker rm -f sql2012

REM use pull to get latest layers (run will use cached layers)
rem docker pull linq2db/linq2db:win-mssql-2012
docker run -e ACCEPT_EULA=Y -e MSSQL_SA_PASSWORD=Password12! -p 1412:1433 --name sql2012 -d linq2db/linq2db:win-mssql-2012

ECHO pause to wait for SQL Server startup completion
timeout 15

REM create test databases
docker exec sql2012 /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P Password12! -Q "CREATE DATABASE TestData;"
docker exec sql2012 /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P Password12! -Q "CREATE DATABASE TestDataMS;"

