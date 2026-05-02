# isPrefixOf

- _isPrefixOf(s, t)_

Answer `true` if the _s_ is a prefix of _t_, else `false`.

At `String`:

```
>>> 'Abc'.isPrefixOf('Abcde')
true

>>> 'Abcde'.isPrefixOf('Abc')
false
```

A string is a prefix of itself:

```
>>> 'Abc'.isPrefixOf('Abc')
true
```

At `List`:

```
>>> [0 .. 9].isPrefixOf([0 .. 23])
true

>>> [0 .. 9].isPrefixOf([1 .. 9])
false
```

The empty sequence is a prefix of all sequences:

```
>>> [].isPrefixOf([])
true

>>> [].isPrefixOf([1])
true

>>> ''.isPrefixOf('')
true

>>> ''.isPrefixOf('Abc')
true
```

* * *

See also: beginsWith

Guides: List Functions

References:
_Haskell_
[1](https://hackage-content.haskell.org/package/base/docs/Data-List.html#v:isPrefixOf)
