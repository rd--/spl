# endsWith

- _endsWith(u, v)_

Answer if the sequence _u_ ends with another sequence _v_.

```
>>> [1 .. 5].endsWith([3 .. 5])
true
```

Suffix must be a sequence:

```
>>> {
>>> 	[1 .. 5].endsWith(5) = false
>>> }.ifError { true }
true
```

All lists, including the empty list, end with the empty list:

```
>>> [].endsWith([])
true
```

At `String`:

```
>>> 'Great Dane'.endsWith('Dane')
true

>>> 'quickSort'.endsWith('Sort')
true
```

The empty string ends with the empty string, and with nothing else:

```
>>> ''.endsWith('')
true

>>> ''.endsWith('>')
false
```

* * *

See also: beginsWith, endsWithAnyOf

Guides: String Functions

References:
_Haskell_
[1](https://hackage.haskell.org/package/base/docs/Data-List.html#v:isPrefixOf)
_Mathematica_
[1](https://reference.wolfram.com/language/ref/StringEndsQ.html)

Categories: Testing
