# Class: ssh::server
#
# This class manages ssh server
#
# Parameters:
#
# Actions:
#   - Install SSH server
#   - Manage SSH host keys
#
# Requires:
#   - get_module_path() form stdlib
#
# Sample Usage:
#
class ssh::server (
  $server_package_name = $ssh::server_package_name,
  $package_ensure      = $ssh::package_ensure,
  $service_name        = $ssh::service_name,
  $keys_dir            = '/etc/puppet/private',
) inherits ssh {

  package { $server_package_name:
    ensure => $package_ensure,
    alias  => 'openssh-server',
  }
  service { 'sshd':
    ensure   => running,
    enable   => true,
    provider => redhat,
    name     => $service_name,
    require  => Package['openssh-server'],
  }

  # get path of current module
  $mypath = get_module_path('ssh')
  if ( generate("${mypath}/scripts/generate_host_keys.sh", "${keys_dir}/${::fqdn}/ssh") =~ /Success/ ) {
    include ::ssh::server::keys
  }
}
