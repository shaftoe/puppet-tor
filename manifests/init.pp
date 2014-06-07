# == Class: tor
class tor (
  $ensure      = present,
  $unix_user   = 'debian-tor',
  $fingerprint = undef,
  $nickname    = undef,
  $contact     = undef,
  $exit_policy = undef
  ) {

  include 'tor::user'
  include 'tor::package'
  include 'tor::config'
  include 'tor::service'

  Class['tor::user']    ->
  Class['tor::package'] ->
  Class['tor::config']  ~>
  Class['tor::service']

}
