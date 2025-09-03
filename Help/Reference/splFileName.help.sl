# splFileName

- _splFileName(system, s)_

Answer a `String` holding the absolute file path to the file name specified by the string _s_,
given by prepending the `splDirectory`.

The Sᴘʟ _read me_ file:

```
>>> system.splFileName('README.md')
'/home/rohan/sw/spl/README.md'
```

The directory holding the Sᴘʟ help files:

```
>>> system.splFileName('Help')
'/home/rohan/sw/spl/Help'
```

* * *

See also: environmentVariable, splDirectory

Guides: Reflection Functions, System Functions
