# asUrl

- _asUrl(url)_
- _asUrl(url, base)_

Construct a `Url`.

At `String`:

```
>>> 'http://cern.ch/'.asUrl.isUrl
true

>>> let url = 'http://cern.ch/'.asUrl;
>>> (url.hostName, url.host)
('cern.ch', 'cern.ch')

>>> let url = 'http://cern.ch:8080/'.asUrl;
>>> (url.hostName, url.host)
('cern.ch', 'cern.ch:8080')

>>> 'http://cern.ch:8080/'.asUrl.port
'8080'

>>> 'http://cern.ch/'.asUrl.protocol
'http:'

>>> 'http://cern.ch/#home'.asUrl.hash
'#home'
```

With base `Url`:

```
>>> let baseUrl = 'http://worldwideweb.cern.ch';
>>> 'browser/'.asUrl(baseUrl).pathName
'/browser/'

>>> let baseUrl = 'https://rohandrape.net/sw/spl/';
>>> 'README.md'.asUrl(baseUrl).pathName
'/sw/spl/README.md'
```

File `Url`:

```
let url = '/home/rohan/sw/spl/help/Reference/Url.help.sl'.asFileUrl;
url.fetchText.then { :aString | aString.postLine }
```

* * *

See also: asFileUrl, href, hostName, Location, origin, pathName, UrlSearchParams

Categories: Network
