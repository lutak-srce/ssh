# Class: ssh::server::keys
#
# This module manages keys for ssh server,
# and is only intended to use as ssh::server
# helper class
#
class ssh::server::keys (
  $private_mode  = $::ssh::params::private_mode,
  $private_group = $::ssh::params::private_group,
) inherits ssh::params {

  $keys_dir = $::ssh::server::keys_dir

  File {
    ensure  => file,
    owner   => root,
    group   => root,
    mode    => '0644',
    require => Package['openssh-server'],
    notify  => Service['sshd'],
  }

  # DSA key
  file { '/etc/ssh/ssh_host_dsa_key':
    group  => $private_group,
    mode   => $private_mode,
    source => [
      'puppet:///private/ssh/ssh_host_dsa_key',
      'puppet:///modules/ssh/ssh_host_dsa_key',
    ],
  }
  file { '/etc/ssh/ssh_host_dsa_key.pub':
    source => [
      'puppet:///private/ssh/ssh_host_dsa_key.pub',
      'puppet:///modules/ssh/ssh_host_dsa_key.pub',
    ],
  }

  # RSA1 key
  file { '/etc/ssh/ssh_host_key':
    group  => $private_group,
    mode   => $private_mode,
    source => [
      'puppet:///private/ssh/ssh_host_key',
      'puppet:///modules/ssh/ssh_host_key',
    ],
  }
  file { '/etc/ssh/ssh_host_key.pub':
    source => [
      'puppet:///private/ssh/ssh_host_key.pub',
      'puppet:///modules/ssh/ssh_host_key.pub',
    ],
  }

  # RSA key
  file { '/etc/ssh/ssh_host_rsa_key':
    group  => $private_group,
    mode   => $private_mode,
    source => [
      'puppet:///private/ssh/ssh_host_rsa_key',
      'puppet:///modules/ssh/ssh_host_rsa_key',
    ],
  }
  file { '/etc/ssh/ssh_host_rsa_key.pub':
    source => [
      'puppet:///private/ssh/ssh_host_rsa_key.pub',
      'puppet:///modules/ssh/ssh_host_rsa_key.pub',
    ],
  }

  # ECDSA key
  file { '/etc/ssh/ssh_host_ecdsa_key':
    group  => $private_group,
    mode   => $private_mode,
    source => [
      'puppet:///private/ssh/ssh_host_ecdsa_key',
      'puppet:///modules/ssh/ssh_host_ecdsa_key',
    ],
  }
  file { '/etc/ssh/ssh_host_ecdsa_key.pub':
    source => [
      'puppet:///private/ssh/ssh_host_ecdsa_key.pub',
      'puppet:///modules/ssh/ssh_host_ecdsa_key.pub',
    ],
  }

  # ED25519 key
  file { '/etc/ssh/ssh_host_ed25519_key':
    group  => $private_group,
    mode   => $private_mode,
    source => [
      'puppet:///private/ssh/ssh_host_ed25519_key',
      'puppet:///modules/ssh/ssh_host_ed25519_key',
    ],
  }
  file { '/etc/ssh/ssh_host_ed25519_key.pub':
    source => [
      'puppet:///private/ssh/ssh_host_ed25519_key.pub',
      'puppet:///modules/ssh/ssh_host_ed25519_key.pub',
    ],
  }

}
