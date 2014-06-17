# == Class: tor
# Install a Tor relay
#
# === Parameters
# [*ensure*]
#   If absent, it will remove packages and files. Default: present
#
# [*orport*]
#   ORPort. Default: 9001
#
# [*dirport*]
#   DirPort. Default: 0 (directory services disabled)
#
# [*nickname*]
#   Advertised nickname for the relay. Default: undef
#
# [*contact*]
#   Contact information for the relay. Default: undef
#
# [*exit_relay*]
#   Use default Exit policies. Default: false (i.e. Exit Polices reject *:*)
#
# [*enable_apt_repo*]
#   Use Tor APT repository. Default: false
#
# [*custom_config*]
#   Array of custom config lines for torrc. Default: []
#

class tor (
  $ensure          = present,
  $orport          = 9001,
  $dirport         = 0,
  $nickname        = undef,
  $contact         = undef,
  $exit_relay      = false,
  $enable_apt_repo = false,
  $custom_config   = []
  ) {

  include 'tor::apt'
  include 'tor::package'
  include 'tor::config'
  include 'tor::service'

  Class['tor::apt']     ->
  Class['tor::package'] ->
  Class['tor::config']  ~>
  Class['tor::service']

}
