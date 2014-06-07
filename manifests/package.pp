# == Class: tor::package
class tor::package () {

  $ensure = $::tor::ensure ? {
    present => present,
    default => purged
  }

  package {['tor', 'torsocks']: ensure => $ensure }

}
