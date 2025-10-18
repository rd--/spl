# fileName

- _fileName(u)_

Answer a `String` having the file name part of the `pathName` of the `Url` _u_,
which may not name a file.

```
>>> 'https://www.ubu.com/sound'
>>> .asUrl
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
>>> 'A://B/C/'.asUrl.fileName
''
```

* * *

See also: asFileUrl, asUrl, pathName, Url

Guides: Network Functions

Categories: Network
