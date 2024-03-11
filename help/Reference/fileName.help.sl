# fileName

- _fileName(aUrl)_

Answer a `String` having the file name part of the `pathName` of _aUrl_,
which may not name a file.

```
>>> 'https://www.audiosynth.com/files/sc-users-archive'.asUrl.fileName
'sc-users-archive'

>>> '/x/y.z'.asFileUrl.fileName
'y.z'

>>> ''.asFileUrl.fileName
''
```

* * *

See also: asFileUrl, asUrl, pathName, Url
