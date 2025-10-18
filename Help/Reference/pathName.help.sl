# pathName

- _pathName(u)_

Answer a `String` having an initial '/' followed by the path of the `Url` _u_,
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

Guides: Network Functions

Categories: Network
