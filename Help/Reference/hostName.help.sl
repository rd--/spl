# hostName

- _hostName(aSystem | aUrl)_

At `System`,
answer the name of the local host.

At `Url`,
answer a `String` having the name of the `host` subcomponent of _aUrl_,
also called the domain:

```
>>> 'http://cern.ch/'.asUrl.hostName
'cern.ch'
```

The `hostName` does not include the port number,
unlike `host`:

```
>>> let url = 'http://cern.ch:8080/'.asUrl;
>>> (url.hostName, url.host)
('cern.ch', 'cern.ch:8080')
```

* * *

See also: fragment, host, href, pathName, port, protocol, query, Url

Guides: Network Functions, System Functions

Categories: Network, System
