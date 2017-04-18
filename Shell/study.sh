#!/bin/bash
if (ls /tmp | grep  -F ^backup)
then
echo 'yes'
else
mkdir /tmp/backup/
fi
