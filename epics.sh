#!/bin/sh
# EPICS
PATH=$PATH:/sbin:/usr/local/epics/base/bin/linux-x86:/usr/local/epics/extensions/bin/linux-x86
export EPICS_HOST_ARCH=linux-x86
export EPICS_BASE=/usr/local/epics/base
export EPICS_MODULES=/usr/local/epics/modules
export EPICS_EXTENSIONS=/usr/local/epics/extensions
export EPICS_LOCAL=/usr/local/epics/local
export EPICS_CONFIG=/usr/local/epics/apps/config
export EPICS_HOSTNAME=$(hostname | /bin/cut -f1 -d'-')
export LINUX_HOSTNAME=$(hostname)
export LABVIEW_CINTOOLS=/usr/local/natinst/LabVIEW-2011/cintools
export HYPERVISOR_DIR=/usr/local/natinst/nihypshm
export HYP_SRC=/usr/local/natinst/nihypshm/src
