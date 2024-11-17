# port

- _port(aUrl)_

Answer a `String` having the port of the `host` component of _aUrl_.

```
>>> 'http://cern.ch:8080/'.asUrl.port
'8080'

>>> 'http://cern.ch:8080/'.asUrl.host
'cern.ch:8080'
```

* * *

See also: host, hostName, Url

Categories: Network
