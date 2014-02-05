#
# Cookbook Name:: gecoscc-chef-server
# Recipe:: default
#
# Copyright 2013, Junta de Andalucia
# http://www.juntadeandalucia.es/
#
# All rights reserved - EUPL License V 1.1
# http://www.osor.eu/eupl
#

gecoscc_chef_server_cookbook_chef_server "chef_server" do
  action :install
end
