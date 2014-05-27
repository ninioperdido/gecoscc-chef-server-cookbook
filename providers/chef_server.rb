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
  chef_server_version = node["gecoscc-chef-server"]["chef-server-version"]
  chef_server_port = node['gecoscc-chef-server']['configuration']['nginx']['ssl_port']
  firewall_type =  node['gecoscc-chef-server']['configuration']['firewall']

  case node["platform_family"]
    when "debian"
      # do things on debian-ish platforms (debian, ubuntu, linuxmint)
    when "rhel"
      # do things on RHEL platforms (redhat, centos, scientific, etc)
      local_rpm_file = "#{Chef::Config[:file_cache_path]}/chef-server.rpm"
      remote_file local_rpm_file do
        source "https://opscode-omnibus-packages.s3.amazonaws.com/el/6/#{arch}/chef-server-#{chef_server_version}-1.el6.#{arch}.rpm"
        action :create
      end
      rpm_package "chef-server" do
        source local_rpm_file
        action :install
      end
  end
  # create the chef-server etc directory
  directory '/etc/chef-server' do
    owner 'root'
    group 'root'
    recursive true
    action :create
  end 
  # create the initial chef-server config file
  template '/etc/chef-server/chef-server.rb' do
    source 'chef-server.rb.erb'
    owner 'root'
    group 'root'
    action :create
    notifies :run, 'execute[reconfigure-chef-server]', :immediately
  end
  # reconfigure the installation
  execute 'reconfigure-chef-server' do
    command 'chef-server-ctl reconfigure'
    action :nothing
  end
  bash "lokkit" do
    user "root"
    cwd "/tmp"
    code <<-EOH
      lokkit -p {#chef_server_port}:tcp
    EOH
    only_if { firewall_type == 'lokkit' }
  end
end
