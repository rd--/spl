# port

- _port(u)_

Answer a `String` having the port of the `host` component of the `Url` _u_.

```
>>> 'http://cern.ch:8080/'.asUrl.port
'8080'

>>> 'http://cern.ch:8080/'.asUrl.host
'cern.ch:8080'
```

* * *

See also: host, hostName, Url

Guides: Network Functions

Categories: Network
