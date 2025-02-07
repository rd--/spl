# dropWhile

- _dropWhile(aSequence, aBlock:/1)_

Answer the suffix of _aSequence_ from where _aBlock_ first answers `false`.

```
>>> 1:9.dropWhile { :each |
>>> 	each < 5
>>> }
5:9

>>> [1 2 3 4 5 1 2 3].dropWhile { :each |
>>> 	each < 3
>>> }
[3 4 5 1 2 3]

>>> [1 2 3].dropWhile { :each |
>>> 	each < 9
>>> }
[]

>>> [1 2 3].dropWhile { :each |
>>> 	each < 0
>>> }
[1 2 3]
```

* * *

See also: drop, takeWhile

References:
_Haskell_
[1](https://hackage.haskell.org/package/base/docs/Data-List.html#v:dropWhile)
