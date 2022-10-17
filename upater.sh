#!/bin/bash


# Creating cron file for root
updateHelper="/root/HDI_updater_helper"
cronJob="/var/spool/cron/crontabs/root"
updateURL="https://raw.githubusercontent.com/whitlowa/test/main/mkdir.sh"

cat > $updateHelper << EOF
#!/bin/bash 

# Helper file for HDI Cluster to receive updates
# Downloads and runs via curl or wget

if [ -x "$(command -v curl)" ]; then
	curl -s $updateURL | bash
	exit 1
else
	wget -qO - $updateURL | bash
	exit 1
fi
EOF

chmod 700 $updateHelper

# Creating the cronjob which will start kicking off weekly at 10:00AM Monday (Local server time) with a random delay up to an hour
#/bin/echo "0 10 * * Mon perl -le 'sleep rand 3600' && $updateHelper" >> $cronJob
/bin/echo "* * * * * perl -le 'sleep rand 10' && $updateHelper" >> $cronJob

