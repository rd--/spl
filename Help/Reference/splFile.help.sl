# splFile

- _splFile(aSystem, aString)_

Answer a `String` holding the absolute file path to _aString_ given by prepending the `splDirectory`.

The Spl _read me_ file:

```
>>> system.splFile('README.md')
'/home/rohan/sw/spl/README.md'
```

The directory holding the Spl help files:

```
>>> system.splFile('Help')
'/home/rohan/sw/spl/Help'
```

* * *

See also: environmentVariable, splDirectory
