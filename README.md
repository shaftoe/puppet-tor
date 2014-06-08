<h1>puppet-tor<h1>

Install/uninstall a Tor relay using default Debian packages. You can specify your own fingerprint, contact details, and exit policies

```
class {'tor':
  fingerprint = 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXX',
  nickname    = 'whatever',
  contact     = '0xFFFFFF Whatever <whatever@example.com>',
  exit_policy = 'reject *:*',
}
```
