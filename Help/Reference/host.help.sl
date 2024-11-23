# host

- _host(aUrl)_

Answer a `String` having the host subcomponent, or domain, of _aUrl_.
The `host` is part of the authority component.

Includes the port number if specified, unlike `hostName`:

```
>>> 'http://cern.ch:8080/'.asUrl.host
'cern.ch:8080'
```

* * *

See also: fragment, hostName, href, pathName, port, protocol, query, Url

Categories: Network
