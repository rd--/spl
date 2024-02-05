# beginsWith

_beginsWith(aSequence, anotherSequence)_

Answer if the _aSequence_ starts with _anotherSequence_.

```
>>> [1 .. 5].beginsWith([1 .. 3])
true
```

Prefix must be a sequence:

```
>>> { [1 .. 5].beginsWith(1) = false }.ifError { true }
true
```

All lists, including the empty list, begins with the empty list:

```
[].beginsWith([])
true
```

At String:

```
>>> 'Hello World'.beginsWith('Hello')
true

>>> 'Hello World'.beginsWith('World')
false
```

The empty string begins with the empty string, and with nothing else:

```
>>> ''.beginsWith('')
true

>>> ''.beginsWith('>')
false
```

* * *

See also: beginsWithAnyOf, endsWith

References:
_Haskell_
[1](https://hackage.haskell.org/package/base/docs/Data-List.html#v:isPrefixOf)
