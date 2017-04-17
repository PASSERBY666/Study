#!/bin/bash
tmp=$'cat /etc/*release | grep DISTRIB'
OS=null
if (cat /etc/* | grep yum)
then echo "this is apt" 
else
echo "no"
fi