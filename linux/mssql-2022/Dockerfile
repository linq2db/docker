FROM ubuntu:22.04

RUN mkdir -m 0755 -p /etc/apt/keyrings/ \
    && apt update \
    && apt install curl gpg -y \
    && curl -fsSL https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor -o /etc/apt/keyrings/microsoft.gpg \
    && echo "deb [signed-by=/etc/apt/keyrings/microsoft.gpg] https://packages.microsoft.com/ubuntu/22.04/mssql-server-2022 jammy main" | tee /etc/apt/sources.list.d/mssql.list \
    && echo "deb [signed-by=/etc/apt/keyrings/microsoft.gpg] https://packages.microsoft.com/ubuntu/22.04/prod jammy main" | tee /etc/apt/sources.list.d/mssql-tools.list \
    && apt update \
    && ACCEPT_EULA=Y DEBIAN_FRONTEND=noninteractive apt install mssql-server mssql-tools18 -y \
    && apt clean \
    && rm -rf /var/lib/apt/lists

CMD /opt/mssql/bin/sqlservr
