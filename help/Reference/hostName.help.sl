# hostName

- _hostName(aUrl)_

Answer a `String` having the domain of the Url.

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

See also: host, href, Location, Url

Categories: Network
