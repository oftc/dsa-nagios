all: generated/nrpe_dsa.cfg deb

generated/nrpe_dsa.cfg: nagios-master.cfg build-nagios
	[ -d generated ] || mkdir generated
	./build-nagios

clean:
	rm -rf generated

install: generated/nrpe_dsa.cfg
	rsync -Pravz --delete generated static handel.debian.org:/etc/puppet/modules/nagios/files/dsa-nagios

.PHONY: all deb
