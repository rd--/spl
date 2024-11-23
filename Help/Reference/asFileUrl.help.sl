# asFileUrl

- _asFileUrl(aString)_

Construct a file protocol `Url`.

```
>>> let pathName = '/home/rohan/sw/spl/help/Reference/Url.help.sl';
>>> let url = pathName.asFileUrl;
>>> (url.protocol, url.pathName, url.href)
('file:', pathName, 'file:///home/rohan/sw/spl/help/Reference/Url.help.sl')
```

* * *

See also: asFileUrl, href, hostName, Location, origin, pathName, Url

Categories: Network
