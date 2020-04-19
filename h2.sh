#!/bin/bash

java \
   ${JAVA_OPTIONS} \
   -cp /var/lib/h2/h2.jar \
   org.h2.tools.Server \
   -web -webDaemon -webAllowOthers -webPort 8082 \
   -tcp -tcpAllowOthers -tcpPort 9092 \
   -baseDir /var/lib/h2/databases \
   -ifNotExists \
   ${H2_OPTIONS}
