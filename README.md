gecoscc-chef-server
===================

This cookbook determines target platform and then downloads and installs chef-server via the official omnibus packages.

Currently, only CentOS is supported, but provider is already ready to add Debian support.

How to (easily) use it
======================

This snippet will download cookbook tarball and run a 'chef-solo' using the cookbook.

You can also check our [from-the-scratch approach](https://github.com/gecos-team/gecoscc-chef-server-repo/blob/master/scripts/gecoscc-chef-server-install.sh) (installs rvm -> installs chef gem -> run chef-solo with this cookbook -> uninstall rvm/chef-gem).

<pre><code>
export COOKBOOK_NAME='gecoscc-chef-server-cookbook'

# echo method is used instead of cat+heredoc because MarkDown wont render from &lt&lt
echo "root = File.absolute_path(File.dirname(__FILE__))" > /tmp/solo.rb
echo "" >> /tmp/solo.rb
echo "file_cache_path root" >> /tmp/solo.rb
echo "cookbook_path root + '/cookbooks'" >> /tmp/solo.rb

echo "{" > /tmp/solo.json
echo "    \"run_list\": [ \"recipe[${COOKBOOK_NAME}::default]\" ]" >> /tmp/solo.json
echo "}" >> /tmp/solo.json

mkdir /tmp/cookbooks
wget -O /tmp/${COOKBOOK_NAME}.tar.gz https://api.github.com/repos/gecos-team/${COOKBOOK_NAME}/tarball 
tar -C /tmp/cookbooks -zxf /tmp/${COOKBOOK_NAME}.tar.gz
mv /tmp/cookbooks/*${COOKBOOK_NAME}* /tmp/cookbooks/${COOKBOOK_NAME}
chef-solo -c /tmp/solo.rb -j /tmp/solo.json
</code></pre>



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
