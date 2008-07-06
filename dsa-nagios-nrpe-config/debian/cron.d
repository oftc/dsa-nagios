@reboot  root sleep 10m && [ -x /usr/share/dsa/weak-ssh-keys-check ] && /usr/share/dsa/weak-ssh-keys-check -s /var/cache/dsa/nagios/weak-ssh-keys
@daily   root              [ -x /usr/share/dsa/weak-ssh-keys-check ] && /usr/share/dsa/weak-ssh-keys-check -s /var/cache/dsa/nagios/weak-ssh-keys

@reboot  root [ -x /usr/sbin/dsa-update-apt-status ] && /usr/sbin/dsa-update-apt-status
@daily   root [ -x /usr/sbin/dsa-update-apt-status ] && /usr/sbin/dsa-update-apt-status
@hourly  root [ -x /usr/sbin/dsa-update-apt-status ] && /usr/sbin/dsa-update-apt-status hourly

# vim:ft=crontab:
