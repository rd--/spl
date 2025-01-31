# endsWith

- _endsWith(aSequence, anotherSequence)_

Answer if the _aSequence_ ends with _anotherSequence_.

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

References:
_Haskell_
[1](https://hackage.haskell.org/package/base/docs/Data-List.html#v:isPrefixOf)
_Mathematica_
[1](https://reference.wolfram.com/language/ref/StringStartsQ.html)

Categories: Testing
