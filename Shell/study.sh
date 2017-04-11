#!/bin/bash
TIME=$(date +"%M")
echo -e $(date) Start "\\n"> update.log
echo ""
i=1
for ((;;))
do
TMP=$(date +"%M")
if (("$TIME"!="$TMP"))
then
echo -e "\\n" $(date) NO.$i >> update.log
i=$i+1
TIME=$TMP
pacaur -Syu -y >> update.log
fi
done