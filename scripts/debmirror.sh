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
            $DEBMIRROR_DATA >> /var/log/cron.log
