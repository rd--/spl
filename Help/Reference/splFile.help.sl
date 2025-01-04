# splFile

- _splFile(aString)_

Answer a `String` holding the absolute file path to _aString_ given by prepending the `splDirectory`.

The Spl read me file:

```
>>> 'README.md'.splFile
'/home/rohan/sw/spl/README.md'
```

The directory holding the Spl help files:

```
>>> 'Help'.splFile
'/home/rohan/sw/spl/Help'
```

* * *

See also: environmentVariable, splDirectory
