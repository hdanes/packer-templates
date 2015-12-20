#!/usr/bin/env bash

# Kernels
yum -t -y -e 0 install yum-utils
package-cleanup -y --oldkernels --count=1
yum -t -y -e 0 remove yum-utils

# Repository cache
yum -t -y -e 0 clean all

# Zero out the rest of the free space
OUTPUTS=({,"/boot","/home","/tmp","/var","/var/log","/var/log/audit"}/EMPTY )
for OUTPUT_FILE in "${OUTPUTS[@]}"
do
	dd if=/dev/zero of=$OUTPUT_FILE bs=1M
	rm -f $OUTPUT_FILE
done

# Flush file system buffers
sync
