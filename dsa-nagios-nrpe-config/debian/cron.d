@reboot  root sleep 10m && [ -x /usr/share/dsa/weak-ssh-keys-check ] && /usr/share/dsa/weak-ssh-keys-check -s /var/cache/dsa/nagios/weak-ssh-keys
@daily   root              [ -x /usr/share/dsa/weak-ssh-keys-check ] && /usr/share/dsa/weak-ssh-keys-check -s /var/cache/dsa/nagios/weak-ssh-keys

@hourly  root [ -x /usr/sbin/dsa-update-apt-status ] && /usr/sbin/dsa-update-apt-status
13 */4 * * * root [ -x /usr/sbin/dsa-update-apt-samhain ] && /usr/sbin/dsa-update-apt-samhain

# vim:ft=crontab:
