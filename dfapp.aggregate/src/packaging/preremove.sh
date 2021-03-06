#!/bin/bash
#
# Copyright (c) <2013> <Radware Ltd.> and others.  All rights reserved.
#
# This program and the accompanying materials are made available under the terms of the Eclipse Public License
# v1.0 which accompanies this distribution, and is available at http://www.eclipse.org/legal/epl-v10.html
# @author Konstantin Pozdeev
# @version 0.1
#

# delete start-up run levels
/etc/init.d/defense4all stop > /dev/null 2>&1
/etc/init.d/cassandra stop > /dev/null 2>&1

if [ -e /sbin/chkconfig ] ; then
	/sbin/chkconfig --del defense4all
	/sbin/chkconfig --del cassandra
elif [ -e /usr/sbin/update-rc.d ] ; then	
	/usr/sbin/update-rc.d -f defense4all remove
	/usr/sbin/update-rc.d -f cassandra remove
fi

rm -rf /var/log/defense4all  > /dev/null 2>&1

