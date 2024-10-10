#!/bin/bash

export SYBASE=/opt/sap
. /opt/sap/SYBASE.sh

if [ ! -f /opt/sap/initialized ]
then
	echo === FIRST RUN - SETUP SERVER ===

	# we build server on first run as from this command evaluation period starts
	# if sap decides to bring back dev or express editions - we can move it back to dockerfile
	/opt/sap/ASE-16_0/bin/srvbuildres -r /opt/sap/ASE-16_0/sybase-ase.rs

	rm /opt/sap/interfaces
	cp /opt/sap/interfaces1 /opt/sap/interfaces
	rm /opt/sap/interfaces1

	# fix macos support
	sed -i 's/allow sql server async i\/o = DEFAULT/allow sql server async i\/o = 0/g' /opt/sap/ASE-16_0/MYSYBASE.cfg
	# set bigger default db size
	sed -i 's/default database size = DEFAULT/default database size = 100m/g' /opt/sap/ASE-16_0/MYSYBASE.cfg
	# disable unicode normalization
	sed -i 's/enable unicode normalization = DEFAULT/enable unicode normalization = 0/g' /opt/sap/ASE-16_0/MYSYBASE.cfg

	sed -i '$ d' /opt/sap/ASE-16_0/install/RUN_MYSYBASE
	echo "-T11889" >> /opt/sap/ASE-16_0/install/RUN_MYSYBASE
	sed -i 's/-T11889/-T11889 \\/g' /opt/sap/ASE-16_0/install/RUN_MYSYBASE

	/opt/sap/ASE-16_0/bin/charset -Usa -PmyPassword -SMYSYBASE binary.srt utf8

	/opt/sap/OCS-16_0/bin/isql -Usa -PmyPassword -SMYSYBASE -i"opt/sap/init.sql"

	echo =============== SYBASE CONFIGURED ==========================

	touch /opt/sap/initialized
else
	echo =============== SYBASE STARTED ==========================

	/opt/sap/ASE-16_0/install/RUN_MYSYBASE
fi