# takeWhile

- _takeWhile(aSequence | aStream, aBlock:/1)_

Answer the prefix of _aSequence_ or _aStream_ for which a _aBlock_ answers `true`.

```
>>> 1:9.takeWhile { :each | each < 5 }
1:4

>>> [1 2 3 4 1 2 3 4]
>>> .takeWhile(<.bindRight(3))
[1 2]

>>> [1 2 3].takeWhile(true.constant)
[1 2 3]

>>> [1 2 3].takeWhile(isNegative:/1)
[]

>>> [1 2 3; 4 5; 6].takeWhile { :each |
>>> 	each.size >= 2
>>> }
[1 2 3; 4 5]
```

At `Stream`:

```
>>> Sfc32(12345).takeWhile { :each |
>>> 	each > 0.35
>>> }.upToEnd
[0.80111 0.47353 0.98349 0.92329]
```

* * *

See also: doWhileTrue, dropWhile, take

References:
_Haskell_
[1](https://hackage.haskell.org/package/base/docs/Data-List.html#v:takeWhile)
