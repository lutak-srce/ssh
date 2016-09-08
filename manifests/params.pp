#
# = Class: ssh::params
#
class ssh::params {
  $package_ensure = 'present'
  case $::osfamily {
    /(Debian|debian|Ubuntu|ubuntu)/: {
      $server_package_name = 'openssh-server'
      $client_package_name = 'openssh-client'
      $sshd_config         = '/etc/ssh/sshd_config'
      $ssh_config          = '/etc/ssh/ssh_config'
      $ssh_known_hosts     = '/etc/ssh/ssh_known_hosts'
      $service_name        = 'ssh'
      $private_mode        = '0600'
      $private_group       = 'root'
    }
    /(RedHat|redhat|amazon)/: {
      $server_package_name = 'openssh-server'
      $client_package_name = 'openssh-clients'
      $sshd_config         = '/etc/ssh/sshd_config'
      $ssh_config          = '/etc/ssh/ssh_config'
      $ssh_known_hosts     = '/etc/ssh/ssh_known_hosts'
      $service_name        = 'sshd'
      case $::operatingsystemmajrelease {
        default: {
          $private_mode  = '0600'
          $private_group = 'root'
        }
        /^7./ : {
          $private_mode  = '0640'
          $private_group = 'ssh_keys'
        }
      }
    }
    default: {
      case $::operatingsystem {
        default: {
          fail("Unsupported platform: ${::osfamily}/${::operatingsystem}")
        }
      }
    }
  }
}
