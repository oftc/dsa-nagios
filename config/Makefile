all: generated/nrpe_dsa.cfg deb

generated/nrpe_dsa.cfg: nagios-master.cfg build-nagios
	[ -d generated ] || mkdir generated
	./build-nagios

clean:
	rm -rf generated

install: generated/nrpe_dsa.cfg
	rsync -avHz --delete-before --ignore-errors -e 'ssh -t -i /var/lib/puppet/.ssh/id_rsa.puppet-sync' generated static handel.debian.org:draghi.debian.org/nagiosconfig

.PHONY: all deb

