# randomly between 1:07 a.m. and 3:30 a.m
#07 1 * * * perl -le 'sleep rand 9000' && /usr/bin/satellite-sync --email --traceback-mail="mail@org.com" -c rhel-x86_64-server-5 -c rhel-i386-server-5 -c rhn-tools-rhel-x86_64-server-5 -c rhn-tools-rhel-i386-server-5 >/dev/null \
perl -le 'sleep rand 9000' && /usr/bin/satellite-sync --email --traceback-mail="mail@org.com" -c rhel-x86_64-server-5 -c rhel-i386-server-5 -c rhn-tools-rhel-x86_64-server-5 -c rhn-tools-rhel-i386-server-5 -c redhat-rhn-satellite-5.4-server-x86_64-5 -c rhel-x86_64-server-6 -c rhel-i386-server-6 -c rhn-tools-rhel-x86_64-server-6 -c rhn-tools-rhel-i386-server-6 2>&1 > /dev/null