#
# Cookbook:: homelab-setup
# Recipe:: default
#
# Copyright:: 2020, The Authors, All Rights Reserved.

package 'vim' do
  action :install
end

package 'wget' do
  action :install
end

user_home = "/home/#{node[:homelab_setup][:user]}"

user node[:homelab_setup][:user] do
  comment 'Create SSH User if needed'
  home user_home
  manage_home true
  action :create
  not_if "getent passwd #{node[:homelab_setup][:user]}"
end

directory node[:homelab_setup][:ssh_directory] do
  owner node[:homelab_setup][:user]
  group node[:homelab_setup][:user]
  mode '0755'
  action :create
  not_if { ::Dir.exist?("#{node[:homelab_setup][:ssh_directory]}") }
end

template node[:homelab_setup][:authorized_keys] do
  source 'authorized_keys.erb'
  owner node[:homelab_setup][:user]
  group node[:homelab_setup][:user]
  mode '644'
  action :create
end

sudo 'sudo-no-password' do
  users node[:homelab_setup][:user]
  nopasswd true
end
