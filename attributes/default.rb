## SSH Pathing Defaults and Keys

default[:homelab_setup][:user] = 'root'
default[:homelab_setup][:ssh_directory] = File.join('/home', node[:homelab_setup][:user], '.ssh')
default[:homelab_setup][:authorized_keys] = File.join(node[:homelab_setup][:ssh_directory], 'authorized_keys')
default[:homelab_setup][:keys] = ['']
