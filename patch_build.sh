#!/bin/bash

set -u

BASE_DIR=`pwd`

PATCH_ROOT="/root/patch"
FROM_BRANCH=$1
TO_BRANCH=$2

#DIR=$(ls -l ${BASE_DIR} |awk '/^d/ {print $NF}')
DIR=$(ls -l ${BASE_DIR} |awk '/^d/ {print $NF}' |grep -v vue)

DATE=`date '+%Y-%m-%d'`
TMP_DIR=/tmp/${DATE}_patch_tmp

rm -fr $TMP_DIR
mkdir $TMP_DIR

for path in $DIR
    do
        cd ${BASE_DIR}/$path;
		
		git checkout ${FROM_BRANCH};
		if [ $? -ne 0 ]
		then
			echo -e  "\e[31;43;1m ${path} do not has ${FROM_BRANCH} \e[0m"
			continue 
		fi
        git reset --hard HEAD;
        git pull;
		
        git checkout ${TO_BRANCH};
		if [ $? -ne 0 ]
		then
			echo -e  "\e[31;43;1m ${path} do not has ${FROM_BRANCH} \e[0m"
			continue 
		fi
		git reset --hard HEAD;
        git pull;
		
		git diff ${FROM_BRANCH}...${TO_BRANCH}  > $TMP_DIR/${path/t2cloud/portal}.patch
    done
	
cd $TMP_DIR
find . -size 0 -exec rm {} \;
cp ${PATCH_ROOT}/rpm/*.rpm .
tar zcvf ${DATE}_patch.tar.gz *
mv ${DATE}_patch.tar.gz $BASE_DIR
cd $BASE_DIR
rm -fr $TMP_DIR





