#!/bin/bash

##Obtener log4j
wget -q -P IoC/ https://raw.githubusercontent.com/CriticalPathSecurity/Public-Intelligence-Feeds/master/log4j.txt
cat IoC/log4j.txt | grep "\." | sort -u > listas_bloqueo/lista_criticalPathSec.txt
rm IoC/log4j.txt
wget -q -P IoC/ https://gist.githubusercontent.com/blotus/f87ed46718bfdc634c9081110d243166/raw/a200571830febd6f237ec9eca8da14bd9429a43d/log4j_exploitation_attempts_crowdsec.csv
cat IoC/log4j_exploitation_attempts_crowdsec.csv | cut -d "," -f1 | grep "\." | grep -v [a-z] | sort -u > listas_bloqueo/lista_blotus.txt
rm IoC/log4j_exploitation_attempts_crowdsec.csv
wget -q -P IoC/ https://raw.githubusercontent.com/Orange-Cyberdefense/log4shell_iocs/main/OCD-Datalake-Log4Shell_IOCs-Exploit_attempts.csv
cat IoC/OCD-Datalake-Log4Shell_IOCs-Exploit_attempts.csv | cut -d "," -f2 | grep "\." | grep -v [a-z] | sort -u > listas_bloqueo/lista_orange.txt
rm IoC/OCD-Datalake-Log4Shell_IOCs-Exploit_attempts.csv
wget -q -P IoC/ https://raw.githubusercontent.com/Azure/Azure-Sentinel/master/Sample%20Data/Feeds/Log4j_IOC_List.csv
cat IoC/Log4j_IOC_List.csv | grep "\." | grep -v [a-z] | sort -u > listas_bloqueo/lista_azure.txt
rm IoC/Log4j_IOC_List.csv

#Cargar IP de alertas
cat IoC/l_t.txt | sort -u > listas_bloqueo/l_t.txt
#Obtenermos lista de archivos a cargar a git
#ls -la /home/xoonet/file_ordenia/ | awk '{print "-"$5" "$9}' | grep -v "\-0 " | grep "txt" | awk '{print $2}' > archivos_cargar.txt
#cd /home/xoonet
#git init .
#cd /root/file_ordenia
cd listas_bloqueo
git add .
git commit -m "mensaje"
#git remote add origin ssh://git@github.com/netxoo/dubalin.git
git push origin master
