# pathExtension

- _pathExtension(p)_

Answer the extension component of the filename path _p_.
The extension includes the leading dot character.

Find the file extension of a string:

```
>>> 'file.text'.pathExtension
'.text'

>>> 'file.text'.pathStem
'file'
```

With directory components:

```
>>> '/p/q/r.s'.pathExtension
'.s'
```

If there is no extension answers the empty string:

```
>>> '/p/q/r'.pathExtension
''
```

If there is a trailing dot with no extension answers the trailing dot:

```
>>> '/p/q/r.'.pathExtension
'.'
```

The extension is only the part following the final dot:

```
>>> 'plus.help.sl'.pathExtension
'.sl'

>>> 'plus.help.sl'.pathStem
'plus.help'
```

* * *

See also: pathBasename, pathDirectory, pathIsAbsolute, pathJoin, pathNormalize

Guides: File Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/FileExtension.html)

Categories: System
