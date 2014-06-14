# == Class: tor::package
class tor::package () {

  $ensure = $::tor::ensure ? {
    present => latest,
    default => purged
  }

  package {['tor', 'torsocks']: ensure => $ensure }

}
