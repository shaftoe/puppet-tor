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
#   Toggle Exit Policies. Valid values are:
#     - 'reduced'. Applying reduced exit policies as of
#       https://trac.torproject.org/projects/tor/wiki/doc/ReducedExitPolicy
#     - 'wide-open'. Accept all traffic
#     - 'custom'. An array of custom 'Exit Policy' has to be provided
#       to apply custom filtering
#     - every other option will be treated as non exit, i.e. "ExitPolicy reject *:*"
#   Default: false (i.e. Exit Polices reject *:*)
#
# [*exit_custom_rules*]
#   When exit_relay => 'custom', use this array to define exit policies.
#   Every element of the array is an ExitPolicy line. Ex:
#
#    exit_custom_rules => [
#      'accept *:443',
#      'reject *:*'
#    ]
#
#   Default: []
#
# [*enable_apt_repo*]
#   Use Tor APT repository. Default: false
#
# [*custom_config*]
#   Array of custom config lines for torrc. Default: []
#

class tor (
  $ensure            = present,
  $orport            = 9001,
  $dirport           = 0,
  $nickname          = undef,
  $contact           = undef,
  $exit_relay        = false,
  $exit_custom_rules = [],
  $enable_apt_repo   = false,
  $custom_config     = []
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
