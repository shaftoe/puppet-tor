# == Class: tor::user
class tor::user () {
  $ensure = $::tor::ensure
  $user  = $::tor::unix_user

  group { $user: ensure => present }

  user { $user:
    ensure => $ensure,
    gid    => $user,
    home   => '/var/lib/tor',
  }

}
