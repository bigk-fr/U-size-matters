#!/bin/bash
CURDIR=`pwd`

cd `dirname $0`

. ../config/usm.config
. mkhook.sh
[ -d $TMPDIR ] || mkdir -p $TMPDIR
mv $HOOK $TMPDIR
cp $CUSTOM_CONF ${CUSTOM_CONF}.bak
sed -i "s%\(COMPRESSION =\).*%\1 $COMP%" $CUSTOM_CONF
sed -i "s%\(WORK_DIR =\).*%\1 $TMPDIR%" $CUSTOM_CONF
sed -i "s%\(ISO =\).*%\1 $ISO%" $CUSTOM_CONF
sed -i "s%\(DEB =\).*%\1%" $CUSTOM_CONF
sed -i "s%\(HOOK =\).*%\1 $TMPDIR\/$HOOK%" $CUSTOM_CONF

customizer -t
customizer -e
customizer -k
customizer -r

mv ${CUSTOM_CONF}.bak $CUSTOM_CONF
rm -f $TMPDIR/$HOOK

cd $CURDIR
