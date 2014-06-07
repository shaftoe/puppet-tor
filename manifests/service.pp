# == Class: tor::service
class tor::service () {

  $ensure = $::tor::ensure ? {
    present => running,
    default => stopped
  }
  if $::tor::ensure == present {
    service {'tor': ensure => running }
  }

}
