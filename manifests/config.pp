# == Class: tor::config
class tor::config () {

  $ensure      = $::tor::ensure
  $fingerprint = $::tor::fingerprint
  $nickname    = $::tor::nickname
  $contact     = $::tor::contact
  $exit_policy = $::tor::exit_policy
  $unix_user   = $::tor::unix_user

  file {'/etc/tor/torrc':
    ensure  => $ensure,
    content => template('tor/torrc.erb')
  }

  if $fingerprint != undef {
    file {'/var/lib/tor/fingerprint':
      ensure  => $ensure,
      owner   => $unix_user,
      group   => $unix_user,
      mode    => '0600',
      content => template('tor/fingerprint.erb')
    }
  }

}
