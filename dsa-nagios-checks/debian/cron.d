@hourly  root [ -x /usr/sbin/dsa-update-apt-status ] && /usr/sbin/dsa-update-apt-status 2>&1 | logger -t dsa-update-apt-status
@hourly  root if [ -x /sbin/iptables-save ]; then umask 0177 && /sbin/iptables-save | sed -e 's/\[.*//' -e 's/^#.*//' | sha256sum > /var/run/iptables-online.checksum; fi
@hourly  root if [ -x /sbin/ip6tables-save ]; then umask 0177 && /sbin/ip6tables-save | sed -e 's/\[.*//' -e 's/^#.*//' | sha256sum > /var/run/ip6tables-online.checksum; fi
13 */4 * * * root [ -x /usr/sbin/dsa-update-samhain-status ] && /usr/sbin/dsa-update-samhain-status

SHELL=/bin/bash
40 12 25 * *   root [ -x /usr/sbin/dsa-update-unowned-file-status ] && sleep $(( $RANDOM \% 86400 )) && /usr/sbin/dsa-update-unowned-file-status
# vim:ft=crontab:
