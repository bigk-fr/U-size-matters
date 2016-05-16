#!/bin/bash

rm -f $HOOK

echo "#!bin/bash" >> $HOOK
echo "rm -f selections.txt" >> $HOOK

while read line; do
	echo "echo \"${line}\" >> selections.txt" >> $HOOK
done < ../selections/selections.txt

while read line2; do
	echo "${line2}"  >> $HOOK
done < hook.part
