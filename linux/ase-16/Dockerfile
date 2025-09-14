FROM ubuntu:24.04 AS build

ADD context/ASE_Suite.linuxamd64.tgz /setup/ase

COPY context/sybase-response.txt /setup
COPY context/sybase-ase.rs /setup
COPY context/entrypoint.sh /setup
COPY context/interfaces /setup
COPY context/init.sql /setup

RUN set -x \
 && apt update \
 && apt install libaio1t64 libnsl2 -y \
 && ln -s /usr/lib/x86_64-linux-gnu/libaio.so.1t64 /usr/lib/x86_64-linux-gnu/libaio.so.1 \
 && /setup/ase/setup.bin -f /setup/sybase-response.txt -i silent -DAGREE_TO_SAP_LICENSE=true -DRUN_SILENT=true \
 && cp /setup/sybase-ase.rs /opt/sap/ASE-16_1/sybase-ase.rs \
 && cp /setup/interfaces /opt/sap/interfaces1 \
 && cp /setup/entrypoint.sh /usr/local/bin/ \
 && cp /setup/init.sql /opt/sap/ \
 && chmod +x /usr/local/bin/entrypoint.sh \
 && ln -s /usr/local/bin/entrypoint.sh /entrypoint.sh \
 && rm -rf /install \
 && rm -rf /setup \
 && apt clean \
 && rm -rf /var/lib/apt/lists

FROM ubuntu:24.04

COPY --from=build / /

ENTRYPOINT ["/entrypoint.sh"]
