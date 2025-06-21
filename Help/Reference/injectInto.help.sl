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

The accumulator value is at the left of the operand:

```
>>> [5 6 7 8].injectInto(
>>> 	[1 2 3 4]
>>> ) { :z :each |
>>> 	[each] ++ z
>>> }
[8 7 6 5 1 2 3 4]
```

Form a number from digits:

```
>>> [4 5 1 6 7 8].injectInto(0) { :i :j |
>>> 	10 * i + j
>>> }
451678
```

Successively partition a list:

```
>>> let [a] = [2 4 3].injectInto(
>>> 	[1 .. 30],
>>> 	partition:/2
>>> );
>>> (a, a.shape)
(
	[
		1 2; 3 4; 5 6; 7 8:;
		9 10; 11 12; 13 14; 15 16:;
		17 18; 19 20; 21 22; 23 24
	],
	[3 4 2]
)
```

Find all possible sums of any of the elements of a list of numbers:

```
>>> [1 2 2 8].injectInto([0]) { :i :j |
>>> 	i.union(i + j)
>>> }.asList
[0 1 2 3 4 5 8 9 10 11 12 13]
```

* * *

See also: foldLeft, foldRight, reduce

References:
_Haskell_
[1](https://hackage.haskell.org/package/base/docs/Prelude.html#v:foldl),
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Fold.html),
_Smalltalk_
5.7.1.16

Categories: Enumerating
