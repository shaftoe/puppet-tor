# == Class: tor::config
class tor::config () {

  $ensure            = $::tor::ensure
  $orport            = $::tor::orport
  $dirport           = $::tor::dirport
  $exit_relay        = $::tor::exit_relay
  $exit_custom_rules = $::tor::exit_custom_rules
  $nickname          = $::tor::nickname
  $contact           = $::tor::contact
  $custom_config     = $::tor::custom_config

  file {'/etc/tor/torrc':
    ensure  => $ensure,
    content => template('tor/torrc.erb')
  }

}
