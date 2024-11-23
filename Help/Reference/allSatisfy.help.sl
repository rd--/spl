# allSatisfy

- _allSatisfy(aCollection, aBlock:/1)_

Evaluate _aBlock_ with the elements of _aCollection_.
If _aBlock_ returns `false` for any element return `false`, otherwise return `true`.
Only tests elements until one answers `false`.

```
>>> [1 3 5 7 9].allSatisfy(isOdd:/1)
true

>>> 1:5.allSatisfy(isOdd:/1)
false

>>> 1:5.allSatisfy { :each | each > 3 }
false
```

The empty list always answers `true`:

```
>>> [].allSatisfy(isOdd:/1)
true
```

* * *

See also: anySatisfy, noneSatisfy

References:
_Haskell_
[1](https://hackage.haskell.org/package/base/docs/Prelude.html#v:all),
_Mathematica_
[1](https://reference.wolfram.com/language/ref/AllTrue.html),
_Smalltalk_
5.7.1.1

Categories: Testing
