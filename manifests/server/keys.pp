#
# = Class: ssh::server::keys
#
# This module manages keys for ssh server,
# and is only intended to use as ssh::server
# helper class
#
class ssh::server::keys (
  $sourcedir     = 'puppet:///private/ssh',
  $private_mode  = $::ssh::params::private_mode,
  $private_group = $::ssh::params::private_group,
) inherits ssh::params {

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
    source => "${sourcedir}/ssh_host_dsa_key",
  }
  file { '/etc/ssh/ssh_host_dsa_key.pub':
    source => "${sourcedir}/ssh_host_dsa_key.pub",
  }

  # RSA1 key
  file { '/etc/ssh/ssh_host_key':
    group  => $private_group,
    mode   => $private_mode,
    source => "${sourcedir}/ssh_host_key",
  }
  file { '/etc/ssh/ssh_host_key.pub':
    source => "${sourcedir}/ssh_host_key.pub",
  }

  # RSA key
  file { '/etc/ssh/ssh_host_rsa_key':
    group  => $private_group,
    mode   => $private_mode,
    source => "${sourcedir}/ssh_host_rsa_key",
  }
  file { '/etc/ssh/ssh_host_rsa_key.pub':
    source => "${sourcedir}/ssh_host_rsa_key.pub",
  }

  # ECDSA key
  file { '/etc/ssh/ssh_host_ecdsa_key':
    group  => $private_group,
    mode   => $private_mode,
    source => "${sourcedir}/ssh_host_ecdsa_key",
  }
  file { '/etc/ssh/ssh_host_ecdsa_key.pub':
    source => "${sourcedir}/ssh_host_ecdsa_key.pub",
  }

  # ED25519 key: can be enabled if master is EL7
  if ( 0 + $::facts['os']['release']['major'] > 6 ) {
    file { '/etc/ssh/ssh_host_ed25519_key':
      group  => $private_group,
      mode   => $private_mode,
      source => "${sourcedir}/ssh_host_ed25519_key",
    }
    file { '/etc/ssh/ssh_host_ed25519_key.pub':
      source => "${sourcedir}/ssh_host_ed25519_key.pub",
    }
  }

}
