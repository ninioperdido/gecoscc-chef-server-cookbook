#
# Cookbook Name:: gecoscc-chef-server
# Resource:: chef-server.rb
#
# Copyright 2013, Junta de Andalucia
# http://www.juntadeandalucia.es/
#
# All rights reserved - EUPL License V 1.1
# http://www.osor.eu/eupl
#

def initialize(*args)
  super
  @action = :install
end

actions :install
