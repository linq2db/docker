# Docker Generation Scripts for Linq To DB

Contains scripts to build test docker images for Linq To DB testing for databases without official docker support.

Hosting: https://hub.docker.com/r/linq2db/linq2db/tags

## Implemented Images

### Windows

For Windows images we use Windows 2022 base image to be able to run it on Azure DevOps and locally on wider range of base systems. Also 2022 provides smaller base image (by ~1.2 Gb compared to 2025).

- SQL Server 2005 Express on Windows 2022
- SQL Server 2008 Express on Windows 2022
- SQL Server 2012 Express on Windows 2022
- SQL Server 2014 Express on Windows 2022
- SQL Server 2016 Express on Windows 2022
- SQL Server 2017 Express on Windows 2022
- SQL Server 2019 Express on Windows 2022
- SQL Server 2022 Express with FTS on Windows 2022
- SQL Server 2025 (pre-release) on Windows 2022

### Linux

- SQL Server 2017
- SQL Server 2019 with FTS
- SQL Server 2022
- SQL Server 2025
- SAP ASE 16.1