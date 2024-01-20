#!/bin/bash

LOCKFILE_INIT=./initial-run.lock

if [ -f "$LOCKFILE_INIT" ]; then
    echo "Initial install already done. Skipping ..."
else
    echo "Initial install starting ..."

    apt update && apt upgrade -y

    apt install -y cron debmirror

    chmod +x ./debmirror.sh

    touch /var/log/cron.log

    touch $LOCKFILE_INIT
fi

mkdir $DEBMIRROR_DATA

# Configure cron
echo "$CRON /app/scripts/debmirror.sh" > /etc/cron.d/mirror-cron
echo "" >> /etc/cron.d/mirror-cron
chmod 0644 /etc/cron.d/mirror-cron
crontab /etc/cron.d/mirror-cron

echo ""
echo ""
echo ""
echo ""
echo "Starting cron"
echo ""
echo ""
echo ""
echo ""

# Initial run
./debmirror.sh

# Start cron
cron && tail -f /var/log/cron.log
