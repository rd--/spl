# lines

_lines(aString)_

Answer an array of strings, one for each line of _aString_, without the line ending delimiters.

```
>>> 'a\nbc\ndef'.lines
['a' 'bc' 'def']
```

The inverse is _unlines_:


```
>>> let list = ['a' 'bc' 'def'];
>>> list.unlines.lines
list
```

* * *

See also: unlines

References:
_Haskell_
[1](https://hackage.haskell.org/package/base/docs/Prelude.html#v:lines)

Categories: Accessing
