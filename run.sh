#!/bin/bash
echo "Checking if /etc/kubernetes/ssl/ is mounted"
if [[ -z $(ls /etc/kubernetes/ssl/*.pem) ]]
then
  echo "Missing pem files."
  exit 1
else
  echo "Found pem files"
fi
echo "Starting cert check..."
while true;
do
  for CERT in $(ls /etc/kubernetes/ssl/*.pem | grep -v key)
  do
    STATUS="UNKNOWN"
    CERTDATE="$(openssl x509 -dates -in $CERT | grep notAfter | awk -F '=' '{print $2}')"
    if openssl x509 -checkend 62208000 -noout -in $CERT > /dev/null
    then
      STATUS="OK"
    else
      if openssl x509 -checkend 86400 -noout -in $ceCERTt > /dev/null
      then
        STATUS="WARNING"
      else
        STATUS="CRITICAL"
      fi
    fi
    echo "$STATUS - $CERT will expire on " $CERTDATE
  done
  echo "Sleeping for 1 hour..."
  sleep 3600
done
