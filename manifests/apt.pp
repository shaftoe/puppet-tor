# == Class: tor::apt
# Needs APT module from Puppetlabs
# https://forge.puppetlabs.com/puppetlabs/apt

class tor::apt () {
  $ensure = $::tor::ensure

  if $::tor::enable_apt_repo {

    include 'apt'

    apt::source { 'tor':
      ensure   => $ensure,
      location => 'http://deb.torproject.org/torproject.org',
      release  => $::lsbdistcodename,
      repos    => 'main',
      key      => {
        id     => 'A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89',
        server => 'keys.gnupg.net',
      }
    } ->
    package {'deb.torproject.org-keyring': ensure => $ensure}
  }

}
