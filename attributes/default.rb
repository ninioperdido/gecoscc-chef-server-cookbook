#
# Cookbook Name:: gecoscc-chef-server
#
# Copyright 2013, Junta de Andalucia
# http://www.juntadeandalucia.es/
#
# All rights reserved - EUPL License V 1.1
# http://www.osor.eu/eupl
#
require 'socket'

server_name = UDPSocket.open {|s| s.connect('64.233.187.99', 1); s.addr.last }

default['gecoscc-chef-server']['chef-server-version'] = '11.0.12'
default['gecoscc-chef-server']['configuration']['nginx']['url'] = "https://#{server_name}"
default['gecoscc-chef-server']['configuration']['nginx']['enable'] = true
default['gecoscc-chef-server']['configuration']['nginx']['non_ssl_port'] = false
default['gecoscc-chef-server']['configuration']['nginx']['enable_non_ssl'] = false
default['gecoscc-chef-server']['configuration']['nginx']['ssl_port'] = 443
default['gecoscc-chef-server']['firewall'] = 'lokkit'
