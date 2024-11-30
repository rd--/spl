# injectInto

- _injectInto(anIterable, thisValue, aBlock:/2)_

Accumulate a running value associated with evaluating _aBlock_ with the current value,
initially _thisValue_,
and the successive elements of _anIterable_ as arguments.

For instance, to sum the numeric elements of a collection:

```
>>> 1:9.injectInto(0, +)
45
```

With a non-zero initial value:

```
>>> 1:4.injectInto(42, +)
52
```

With a non-associative operator:

```
>>> 1:4.injectInto(5, -)
-5

>>> (((5 - 4) - 3) - 2) - 1
-5
```

The accumulator value is at the left of the operator:

```
>>> [5 6 7 8].injectInto([1 2 3 4]) { :z :each |
>>> 	[each] ++ z
>>> }
[8 7 6 5 1 2 3 4]
```

* * *

See also: foldLeft, foldRight, reduce

References:
_Haskell_
[1](https://hackage.haskell.org/package/base/docs/Prelude.html#v:foldl),
_Smalltalk_
5.7.1.16

Categories: Enumerating
