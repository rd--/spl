# pathName

- _pathName(aUrl)_

Answer a `String` having an initial '/' followed by the path of _aUrl_,
not including the query string or fragment.

```
>>> 'http://audiosynth.com/readinglist.html'.asUrl.pathName
'/readinglist.html'
```

The empty file `Url`:

```
>>> ''.asFileUrl.pathName
'/'
```

* * *

See also: fileName, hostName, href, Location, Url

Categories: Network
