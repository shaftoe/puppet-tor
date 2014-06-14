# == Class: tor::service
class tor::service () {

  if $::tor::ensure == present {
    service {'tor':
      ensure => running,
      enable => true,
    }
  }

}
