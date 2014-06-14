<h1>puppet-tor<h1>

<h2>Install/uninstall a (by default non-exit) Tor relay using default Debian packages<h2>

The default include sets up Tor as a basic non-exit relay listening on port 9001
```
include 'tor'
```

You can specify the default ORPort
```
class {'tor':
  orport => 443,
}
```

You can specify your own contact details with 'nickname' and 'contact' parameters
```
class {'tor':
  nickname => 'whatever',
  contact  => '0xFFFFFF Whatever <whatever@example.com>',
}
```

If you want it to advertise directory services, specify also the DirPort parameter (defaults to 0)
```
class {'tor':
  nickname => 'whatever',
  contact  => '0xFFFFFF Whatever <whatever@example.com>',
  dirport  => 'auto',
}
```

If you want it to be an exit relay
```
class {'tor':
  nickname   => 'whatever',
  contact    => '0xFFFFFF Whatever <whatever@example.com>',
  exit_relay => true,
}
```

You can also use the the official Tor APT repository so to have the most recent stable version, but you need puppetlabs/apt module for that to work.
```
class {'tor':
  nickname        => 'whatever',
  contact         => '0xFFFFFF Whatever <whatever@example.com>',
  enable_apt_repo => true,
}
```

If you need to override any configuration value, you can always provide them as an array (custom_config parameter)
```
class {'tor':
  nickname        => 'whatever',
  contact         => '0xFFFFFF Whatever <whatever@example.com>',
  enable_apt_repo => true,
  custom_config   => [
    'ExitPolicy reject 0.0.0.0/8,accept *:*',
    'MaxAdvertisedBandwidth 1MB',
    '...',
  ],
}
```

Finally, to remove it safely
```
class {'tor':
  ensure => absent,
}
```
