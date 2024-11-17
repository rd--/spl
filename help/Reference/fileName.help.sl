# fileName

- _fileName(aUrl)_

Answer a `String` having the file name part of the `pathName` of _aUrl_,
which may not name a file.

```
>>> 'https://www.audiosynth.com/files/sc-users-archive'.asUrl.fileName
'sc-users-archive'
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

* * *

See also: asFileUrl, asUrl, pathName, Url

Categories: Network
