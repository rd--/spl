# hostName

- _hostName(aSystem | aUrl)_

At `System`,
answer the name of the local host.

At `Url`,
answer a `String` having the name of the `host` subcomponent of _aUrl_.

```
>>> 'http://audiosynth.com/readinglist.html'.asUrl.hostName
'audiosynth.com'
```

The `hostName` does not include the port number:

```
>>> let url = 'http://cern.ch:8080/'.asUrl;
>>> (url.hostName, url.host)
('cern.ch', 'cern.ch:8080')
```

* * *

See also: fragment, host, href, pathName, port, protocol, query, Url

Guides: Network Functions, System Functions

Categories: Network, System
