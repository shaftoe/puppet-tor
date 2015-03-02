# == Class: tor::apt
# Needs APT module from Puppetlabs
# https://forge.puppetlabs.com/puppetlabs/apt

class tor::apt () {
  $ensure = $::tor::ensure

  if $::tor::enable_apt_repo {

    include 'apt'

    # Declare apt::key only if installing (to avoid double removal)
    if $ensure == 'present' {
      apt::key {'EE8CBC9E886DDD89':
        key_server => 'keys.gnupg.net',
        before     => Apt::Source['tor'],
      }
    }
    apt::source { 'tor':
      ensure            => $ensure,
      location          => 'http://deb.torproject.org/torproject.org',
      release           => $::lsbdistcodename,
      repos             => 'main',
    } ->
    package {'deb.torproject.org-keyring': ensure => $ensure}
  }

}
