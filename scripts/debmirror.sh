#!/bin/bash

debmirror   -a $ARCH \
            --no-source \
            -s $SECTION \
            -h $SERVER \
            -d $RELEASE \
            -r $INPATH \
            --progress \
            --method=$PROTO \
            --ignore-release-gpg \
            --i18n \
            $DEBMIRROR_DATA >> /var/log/cron.log
