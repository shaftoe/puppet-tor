# == Class: tor::package
class tor::package () {

  $ensure = $::tor::ensure ? {
    present => latest,
    default => purged
  }

  $packages = [
    'tor',
    'torsocks',
    'tor-geoipdb',
  ]

  package {$packages: ensure => $ensure }

}
