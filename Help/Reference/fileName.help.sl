# fileName

- _fileName(u)_

Answer a `String` having the file name part of the `pathName` of the `Url` _u_,
which may not name a file.

```
>>> Url'https://www.ubu.com/sound'
>>> .fileName
'sound'
```

A local file Url:

```
>>> '/x/y.z'.asFileUrl.fileName
'y.z'
```

The empty file Url:

```
>>> ''.asFileUrl.fileName
''
```

A Url with trailing directory separator:

```
>>> Url'A://B/C/'.fileName
''
```

* * *

See also: asFileUrl, asUrl, pathName, Url

Guides: Network Functions

Categories: Network
