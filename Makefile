all: generated/nrpe_dsa.cfg deb

generated/nrpe_dsa.cfg: nagios-master.cfg build-nagios
	[ -d generated ] || mkdir generated
	./build-nagios


deb: generated/nrpe_dsa.cfg
	if ! [ -e Build-tree/dsa-nagios-nrpe-config/nrpe_dsa.cfg ] || \
	   ! diff generated/nrpe_dsa.cfg Build-tree/dsa-nagios-nrpe-config/nrpe_dsa.cfg > /dev/null; then \
		cp -a generated/nrpe_dsa.cfg dsa-nagios-nrpe-config && \
		cd dsa-nagios-nrpe-config && dch -i "Automatically generated new version." && cd .. && \
		bzr ci -m 'Automatically generated new version' dsa-nagios-nrpe-config/debian/changelog && \
		rm -rf Build-tree && \
		mkdir Build-tree && \
		cp -av dsa-nagios-nrpe-config Build-tree && \
		cd Build-tree/dsa-nagios-nrpe-config && debuild -rfakeroot -uc -us; \
	fi

clean:
	rm -rf generated
	rm -rf Build-tree
	rm -f dsa-nagios-nrpe-config/nrpe_dsa.cfg

install: generated/nrpe_dsa.cfg
	dh_testroot
	#
	install -m 644 checkcommands.cfg /etc/nagios-plugins/config/local-dsa-checkcommands.cfg
	#
	install -m 644 generated/auto-dependencies.cfg /etc/nagios3/conf.d
	install -m 644 generated/auto-hostextinfo.cfg /etc/nagios3/conf.d
	install -m 644 generated/auto-hostgroups.cfg /etc/nagios3/conf.d
	install -m 644 generated/auto-hosts.cfg /etc/nagios3/conf.d
	install -m 644 generated/auto-serviceextinfo.cfg /etc/nagios3/conf.d
	install -m 644 generated/auto-services.cfg /etc/nagios3/conf.d
	#
	@echo "Also run: "
	@echo " cp Build-tree/*.deb /var/www/userdir-ldap/debian-admin &&"
	@echo "   cd /var/www/userdir-ldap/debian-admin &&"
	@echo "   zzzz_rebuild_index_here"
	#
	@echo
	#
	env -i /etc/init.d/nagios3 reload

.PHONY: all deb
