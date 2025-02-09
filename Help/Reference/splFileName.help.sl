# splFileName

- _splFileName(aSystem, aString)_

Answer a `String` holding the absolute file path to _aString_ given by prepending the `splDirectory`.

The Spl _read me_ file:

```
>>> system.splFileName('README.md')
'/home/rohan/sw/spl/README.md'
```

The directory holding the Spl help files:

```
>>> system.splFileName('Help')
'/home/rohan/sw/spl/Help'
```

* * *

See also: environmentVariable, splDirectory
