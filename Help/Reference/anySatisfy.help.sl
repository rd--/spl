# anySatisfy

- _anySatisfy(aCollection, aBlock:/1)_

Evaluate _aBlock_ with the elements of _aCollection_.
If _aBlock_ answers `true` for any element return `true`, otherwise return `false`.
Only tests elements until one elements answers `true`.

```
>>> [1 3 5 7 9].anySatisfy(isEven:/1)
false

>>> [1 2 3 4 5].anySatisfy(isEven:/1)
true
```

An empty collection always answers `false`:

```
>>> [].anySatisfy(isEven:/1)
false
```

At `Record`:

```
>>> (a: 2, b: 3, c: 6).anySatisfy(isOdd:/1)
true
```

* * *

See also: allSatisfy, noneSatisfy

Guides: Boolean Functions

References:
_Haskell_
[1](https://hackage.haskell.org/package/base/docs/Prelude.html#v:any)
_Mathematica_
[1](https://reference.wolfram.com/language/ref/AnyTrue.html),
_Smalltalk_
5.7.1.2

Categories: Testing
