#!/bin/bash

PATH='bazel-out/darwin_arm64-fastbuild/bin'
MODULE_NAME='java-test-module'
JARS_ARRAY=("libmodule-hjar.jar" "libmodule.jar" "module.jar")

for JAR in ${JARS_ARRAY[@]}
	do

#    echo "find ${PATH}/${MODULE_NAME} -type f  -iname $JAR"

    IS_JAR_PRESENT=`find ./${PATH}/${MODULE_NAME} -type f -name "$JAR"`
		! [ -z ${IS_JAR_PRESENT} ] && echo "${PATH}/${MODULE_NAME}/${JAR} found...."

	done
