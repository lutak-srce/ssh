# Class: ssh::server::keys
#
# This module manages keys for ssh server,
# and is only intended to use as ssh::server
# helper class
#
class ssh::server::keys {
  # ssh keys
  file { '/etc/ssh/ssh_host_dsa_key':
    ensure  => file,
    owner   => root,
    group   => root,
    mode    => '0600',
    source  => [
      'puppet:///private/ssh/ssh_host_dsa_key',
      'puppet:///modules/ssh/ssh_host_dsa_key',
    ],
    require => Package['openssh-server'],
    notify  => Service['sshd'],
  }
  file { '/etc/ssh/ssh_host_dsa_key.pub':
    ensure  => file,
    owner   => root,
    group   => root,
    mode    => '0644',
    source  => [
      'puppet:///private/ssh/ssh_host_dsa_key.pub',
      'puppet:///modules/ssh/ssh_host_dsa_key.pub',
    ],
    require => Package['openssh-server'],
    notify  => Service['sshd'],
  }
  file { '/etc/ssh/ssh_host_key':
    ensure  => file,
    owner   => root,
    group   => root,
    mode    => '0600',
    source  => [
      'puppet:///private/ssh/ssh_host_key',
      'puppet:///modules/ssh/ssh_host_key',
    ],
    require => Package['openssh-server'],
    notify  => Service['sshd'],
  }
  file { '/etc/ssh/ssh_host_key.pub':
    ensure  => file,
    owner   => root,
    group   => root,
    mode    => '0644',
    source  => [
      'puppet:///private/ssh/ssh_host_key.pub',
      'puppet:///modules/ssh/ssh_host_key.pub',
    ],
    require => Package['openssh-server'],
    notify  => Service['sshd'],
  }
  file { '/etc/ssh/ssh_host_rsa_key':
    ensure  => file,
    owner   => root,
    group   => root,
    mode    => '0600',
    source  => [
      'puppet:///private/ssh/ssh_host_rsa_key',
      'puppet:///modules/ssh/ssh_host_rsa_key',
    ],
    require => Package['openssh-server'],
    notify  => Service['sshd'],
  }
  file { '/etc/ssh/ssh_host_rsa_key.pub':
    ensure  => file,
    owner   => root,
    group   => root,
    mode    => '0644',
    source  => [
      'puppet:///private/ssh/ssh_host_rsa_key.pub',
      'puppet:///modules/ssh/ssh_host_rsa_key.pub',
    ],
    require => Package['openssh-server'],
    notify  => Service['sshd'],
  }

}
