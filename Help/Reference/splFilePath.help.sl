# splFilePath

- _splFilePath(s)_

Answer a `FilePath` holding the absolute file path to the file name specified by the string _s_,
given by prepending the `splDirectory`.

The Sᴘʟ _read me_ file:

```
>>> 'README.md'.splFilePath
FilePath'/home/rohan/sw/spl/README.md'
```

The directory holding the Sᴘʟ help files:

```
>>> 'Help'.splFilePath
FilePath'/home/rohan/sw/spl/Help'
```

* * *

See also: FilePath, splDirectory, splFileName

Guides: Reflection Functions, System Functions
