# pathStem

- _pathStem(p)_

Answer the _stem_ of the path _p_.
The stem is the part of after any leading directories and the before the _extension_.

Find the file stem of a string:

```
>>> 'file.text'.pathStem
'file'

>>> 'file.text'.pathExtension
'.text'
```

With directory components:

```
>>> '/p/q/r.s'.pathStem
'r'
```

The extension is only the part following the final dot:

```
>>> 'plus.help.sl'.pathStem
'plus.help'
```

* * *

See also: pathBasename, pathDirectory, pathExtension, pathIsAbsolute, pathJoin, pathNormalize

Guides: File Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/FileStem.html)

Categories: System
