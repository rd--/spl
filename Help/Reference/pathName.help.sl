# pathName

- _pathName(aUrl)_

Answer a `String` having an initial '/' followed by the path of _aUrl_,
not including the query string or fragment.

```
>>> 'http://w3c.org/standards'
>>> .asUrl
>>> .pathName
'/standards'
```

The empty file `Url`:

```
>>> ''.asFileUrl.pathName
'/'
```

* * *

See also: fileName, hostName, href, Location, Url

Categories: Network
