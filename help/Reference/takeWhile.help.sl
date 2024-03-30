# takeWhile

- _takeWhile(aSequence, aBlock:/1)_

Answer a `List` of the prefix of _aSequence_ for which a _aBlock_ answers `true`.

```
>>> 1:9.takeWhile { :each | each < 5 }
1:4

>>> [1 2 3 4 1 2 3 4].takeWhile(<.bindRight(3))
[1 2]

>>> [1 2 3].takeWhile(true.constant)
[1 2 3]

>>> [1 2 3].takeWhile(isNegative:/1)
[]

>>> [1 2 3; 4 5; 6].takeWhile { :each | each.size >= 2 }
[1 2 3; 4 5]
```

* * *

See also: doWhile, dropWhile, take

References:
_Haskell_
[1](https://hackage.haskell.org/package/base/docs/Data-List.html#v:takeWhile)
