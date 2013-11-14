gecoscc-chef-server
===================

This cookbook determines target platform and then downloads and installs chef-server via the official omnibus packages.

Currently, only CentOS is supported, but provider is already ready to add Debian support.

How to (easily) use it
======================

<code>
chef-solo -r https://github.com/gecos-team/cookbook-gecoscc-chef-server/archive/master.zip
</code>

You can also check our [from-the-scratch approach](https://github.com/gecos-team/gecoscc-chef-server-repo/blob/master/scripts/gecoscc-chef-server-install.sh) (installs rvm -> installs chef gem -> run chef-solo with this cookbook).

Licence and Copyright
=====================

Copyright © 2013 Junta de Andalucia < http://www.juntadeandalucia.es >
Licensed under the EUPL V.1.1

The license text is available at http://www.osor.eu/eupl and the attached PDF
