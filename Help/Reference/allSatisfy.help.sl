# allSatisfy

- _allSatisfy(c, f:/1)_

Evaluate the block _f_ with the elements of the collection _c_.
If _f_ answers `false` for any element,
answers `false`,
otherwise answers `true`.
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

Does not traverse tree structures, see `deepAllSatisfy`:

```
>>> let m = [3 3].iota;
>>> (
>>> 	m.allSatisfy(isList:/1),
>>> 	m.deepAllSatisfy(isInteger:/1)
>>> )
(true, true)
```

* * *

See also: anySatisfy, deepAllSatisfy, noneSatisfy

Guides: Boolean Functions

References:
_Haskell_
[1](https://hackage.haskell.org/package/base/docs/Prelude.html#v:all),
_Mathematica_
[1](https://reference.wolfram.com/language/ref/AllTrue.html)
[2](https://reference.wolfram.com/language/ref/ArrayQ.html),
_Smalltalk_
5.7.1.1

Categories: Testing
