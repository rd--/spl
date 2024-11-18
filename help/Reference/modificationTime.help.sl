# modificationTime

- _modificationTime(aPath)_

Answer the modification time of _aPath_ as milliseconds since the Unix epoch.

```
>>> '/tmp'.modificationTime > 0
true
```

If _aPath_ does not exist, the modification time will be reported as `zero`.

```
>>> '/DirectoryDoesNotExist'.modificationTime
0
```

* * *

* * *

See also: fileInformation

Guides: File Functions

Categories: System
