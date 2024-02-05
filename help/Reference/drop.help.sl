# drop

_drop(aSequence, anInteger)_

Answer a copy of _aSequence_ without the first _anInteger_ places.

```
>>> [5 4 3 2 1].drop(3)
[2 1]

>>> '>>> x'.drop(4)
'x'

>>> 1:5.drop(3)
4:5

>>> [1 2].drop(0)
[1 2]
```

If _anInteger_ is negative, answer a copy of _aSequence_ without the last _anInteger_ places.

```
>>> [1 2].drop(-1)
[1]

>>> [5 4 3 2 1].drop(-3)
[5 4]
```

Removing more elements than the length of the sequence gives an empty result:

```
>>> [5 4 3 2 1].drop(-8)
[]

>>> [1 2].drop(3)
[]

>>> [].drop(3)
[]
```

* * *

See also: dropFirst, dropLast, take

References:
_Apl_
[1](http://aplwiki.com/wiki/Drop),
_Haskell_
[1](https://hackage.haskell.org/package/base/docs/Prelude.html#v:drop)
