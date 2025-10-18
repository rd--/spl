# host

- _host(u)_

Answer a `String` having the host subcomponent, or domain, of the `Url` _u_.
The `host` is part of the authority component.

Includes the port number if specified, unlike `hostName`:

```
>>> 'http://cern.ch:8080/'.asUrl.host
'cern.ch:8080'
```

* * *

See also: fragment, hostName, href, pathName, port, protocol, query, Url

Guides: Network Functions

Categories: Network
