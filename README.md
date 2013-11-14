gecoscc-chef-server
===================

This cookbook determines target platform and then downloads and installs chef-server via the official omnibus packages.

Currently, only CentOS is supported, but provider is already ready to add Debian support.

How to (easily) use it
======================

<code>
export COOKBOOK_NAME=cookbook-gecoscc-chef-server

cat > /tmp/solo.rb << EOF
root = File.absolute_path(File.dirname(__FILE__))

file_cache_path root
cookbook_path root + '/cookbooks'
EOF

cat > /tmp/solo.json << EOF
{
    "run_list": [ "recipe[${COOKBOOK_NAME}::default]" ]
}
EOF

mkdir /tmp/cookbooks
wget -O /tmp/${COOKBOOK_NAME}.tar.gz https://api.github.com/repos/gecos-team/${COOKBOOK_NAME}/tarball 
tar -C /tmp/cookbooks -zxf /tmp/${COOKBOOK_NAME}.tar.gz
mv /tmp/cookbooks/*${COOKBOOK_NAME}* /tmp/cookbooks/${COOKBOOK_NAME}
chef-solo -c /tmp/solo.rb -j /tmp/solo.json
</code>

You can also check our [from-the-scratch approach](https://github.com/gecos-team/gecoscc-chef-server-repo/blob/master/scripts/gecoscc-chef-server-install.sh) (installs rvm -> installs chef gem -> run chef-solo with this cookbook -> uninstall rvm/chef-gem).

Contributing
============

1.  Fork the repository on Github
2.  Create a named feature branch (like `add_component_x`)
3.  Write your change
4.  Submit a Pull Request using Github

Licence and Authors
=====================

Copyright © 2013 Junta de Andalucia < http://www.juntadeandalucia.es >
Licensed under the EUPL V.1.1

The license text is available at http://www.osor.eu/eupl and the attached PDF

Authors: Roberto C. Morano <rcmorano@emergya.com>
