all: generated/nrpe_dsa.cfg deb

generated/nrpe_dsa.cfg: nagios-master.cfg build-nagios
	[ -d generated ] || mkdir generated
	./build-nagios

clean:
	rm -rf generated

install: generated/nrpe_dsa.cfg
	rsync -Prltvz --delete generated static handel.debian.org:draghi.debian.org/nagiosconfig

.PHONY: all deb
