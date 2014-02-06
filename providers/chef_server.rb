#
# Cookbook Name:: gecoscc-chef-server
# Provider:: chef-server
#
# Copyright 2013, Junta de Andalucia
# http://www.juntadeandalucia.es/
#
# All rights reserved - EUPL License V 1.1
# http://www.osor.eu/eupl
#

action :install do

  arch = node["languages"]["ruby"]["target_cpu"]

  case node["platform_family"]
    when "debian"
      # do things on debian-ish platforms (debian, ubuntu, linuxmint)
    when "rhel"
      # do things on RHEL platforms (redhat, centos, scientific, etc) 
      local_rpm_file = "#{Chef::Config[:file_cache_path]}/chef-server.rpm"
      remote_file local_rpm_file do
        source "https://opscode-omnibus-packages.s3.amazonaws.com/el/6/#{arch}/chef-server-11.0.10-1.el6.#{arch}.rpm"
        action :create
      end
      rpm_package "chef-server" do
        source local_rpm_file
        action :install
      end
  end

end
