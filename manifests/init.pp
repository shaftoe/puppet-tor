# == Class: tor
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
