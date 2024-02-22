# min

- _min(aCollection)_
- _min(aMagnitude, anotherMagnitude)_

The unary form answers the minimum value in the collection.
The collection must be non-empty and contain compatible Magnitudes.

```
>>> 1:10.min
1

>>> { [].min }.ifError { true }
true
```

The binary form answer the receiver or the argument, whichever has the least magnitude.

```
>>> [4 3 2 3 1 5 7].reduce(min:/2)
1

>>> 2.4.min(1.9)
1.9
```

The binary form allows vector operands:

```
>>> [1 3 5].min([5 3 1])
[1 3 1]

>>> 0.max(1.min([-0.2 -0.1 0.3 0.8 1 1.3]))
[0 0 0.3 0.8 1 1]
```

* * *

See also: floor, max

References:
_Apl_
[1](https://aplwiki.com/wiki/Minimum),
_Haskell_
[1](https://hackage.haskell.org/package/base/docs/Prelude.html#v:min)
[2](https://hackage.haskell.org/package/base/docs/Prelude.html#v:minimum),
_Mathematica_
[1](https://mathworld.wolfram.com/Minimum.html)
[2](https://reference.wolfram.com/language/ref/Min.html)

Categories: Testing
