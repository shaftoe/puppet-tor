<h1>puppet-tor</h1>

<h2>Install/uninstall a (by default non-exit) Tor relay using default Debian packages</h2>

The default include sets up Tor as a basic non-exit relay listening on port 9001
```puppet
include 'tor'
```

You can specify the default ORPort
```puppet
class {'tor':
  orport => 443,
}
```

You can specify your own contact details with 'nickname' and 'contact' parameters
```puppet
class {'tor':
  nickname => 'whatever',
  contact  => '0xFFFFFF Whatever <whatever@example.com>',
}
```

If you want it to advertise directory services, specify also the DirPort parameter (defaults to 0)
```puppet
class {'tor':
  nickname => 'whatever',
  contact  => '0xFFFFFF Whatever <whatever@example.com>',
  dirport  => 'auto',
}
```

You can also use the the official Tor APT repository so to have the most recent stable version, but you need puppetlabs/apt module for that to work.
```puppet
class {'tor':
  nickname        => 'whatever',
  contact         => '0xFFFFFF Whatever <whatever@example.com>',
  enable_apt_repo => true,
}
```

If you need to override any configuration value, you can always provide them as an array (custom_config parameter)
```puppet
class {'tor':
  nickname        => 'whatever',
  contact         => '0xFFFFFF Whatever <whatever@example.com>',
  enable_apt_repo => true,
  custom_config   => [
    'AccountingMax 1TB',
    'MaxAdvertisedBandwidth 1MB',
    '...',
  ],
}
```

<h2>Uninstall</h2>

To remove it safely
```puppet
class {'tor':
  ensure => absent,
}
```

<h2>Exit relays policies</h2>

If you want it to be an exit relay, you have a few default options.

You can use reduces exit policies as suggested [here](https://trac.torproject.org/projects/tor/wiki/doc/ReducedExitPolicy)

 ```puppet
class {'tor':
  nickname   => 'whatever',
  contact    => '0xFFFFFF Whatever <whatever@example.com>',
  exit_relay => 'reduced',
}
```

You can provide your own custom list of exit policies

```puppet
class {'tor':
  nickname          => 'whatever',
  contact           => '0xFFFFFF Whatever <whatever@example.com>',
  exit_relay        => 'custom',
  exit_custom_rules => [
    'accept *:443',
    'accept *:80',
    'accept ...',
    'reject *:*'
  ]
}
```

Finally, you can remove any Exit Policy filter and make it a 'wide-open' relay

 ```puppet
class {'tor':
  nickname   => 'whatever',
  contact    => '0xFFFFFF Whatever <whatever@example.com>',
  exit_relay => 'wide-open',
}
```

NOTE: **any other value of exit_relay** will set it as a **non exit relay** (i.e., ExitPolicy reject \*:\*)
