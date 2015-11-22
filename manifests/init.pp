# Class: ssh
#
# This module manages ssh
#
class ssh (
  $server_package_name = $ssh::params::server_package_name,
  $package_ensure      = $ssh::params::package_ensure,
  $service_name        = $ssh::params::service_name,
  $client_package_name = $ssh::params::client_package_name,
) inherits ssh::params {

  package { $client_package_name : ensure => present, }

}
