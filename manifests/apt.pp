# == Class: tor::apt
# Needs APT module from Puppetlabs
# https://forge.puppetlabs.com/puppetlabs/apt

class tor::apt () {

  if $::tor::enable_apt_repo {
    include 'apt'

    apt::source { 'tor':
      ensure            => $::tor::ensure,
      location          => 'http://deb.torproject.org/torproject.org',
      release           => $::lsbdistcodename,
      repos             => 'main',
      key               => 'A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89',
      key_server        => 'keys.gnupg.net',
    } ->
    package {'deb.torproject.org-keyring': ensure => $::tor::ensure}

  }
}
