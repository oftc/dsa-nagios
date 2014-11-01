@hourly  root [ -x /usr/sbin/dsa-update-apt-status ] && /usr/sbin/dsa-update-apt-status 2>&1 | logger -t dsa-update-apt-status
@hourly  root [ -x /sbin/iptables-save ] && umask 0177; iptables-save | sed -e 's/\[.*//' -e 's/^#.*//' | sha256sum > /var/run/iptables-online.checksum
@hourly  root [ -x /sbin/ip6tables-save ] && umask 0177; ip6tables-save | sed -e 's/\[.*//' -e 's/^#.*//' | sha256sum > /var/run/ip6tables-online.checksum
13 */4 * * * root [ -x /usr/sbin/dsa-update-samhain-status ] && /usr/sbin/dsa-update-samhain-status

SHELL=/bin/bash
40 12 25 * *   root [ -x /usr/sbin/dsa-update-unowned-file-status ] && sleep $(( $RANDOM \% 86400 )) && /usr/sbin/dsa-update-unowned-file-status
# vim:ft=crontab:
