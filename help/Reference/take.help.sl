# take

- _take(aCollection, anInteger)_
- _take(aSequence, anInteger, anObject)_

Answer a copy of _aCollection_ with only the first _anInteger_ places,
or less if _aCollection_ is not large enough.

```
>>> 'Hello World!'.take(5)
'Hello'

>>> 1:5.take(3)
[1 2 3]

>>> [1 2].take(3)
[1 2]

>>> [].take(3)
[]

>>> [1 2].take(0)
[]

>>> { [1 2].take(-1) }.ifError { true }
true

>>> [5 4 3 2 1].take(3)
[5 4 3]
```

The ternary form only applies to sequences.
If _anInteger_ is negative, answer a copy of _aSequence_ with only the last _anInteger_ places.

```
>>> [5 4 3 2 1].take(-3, 0)
[3 2 1]

>>> [5 4 3 2 1].takeLast(3, 0)
[3 2 1]
```

The ternary form allows taking more elements than the sequence contains,
filling the empty slots with _anObject_, either as a suffix:

```
>>> [5 4 3 2 1].take(8, 0)
[5 4 3 2 1 0 0 0]
```

or as a prefix:

```
>>> [5 4 3 2 1].take(-8, 0)
[0 0 0 5 4 3 2 1]
```

- _take(n, k)_ => _positiveIntegerBinomial(n, k)_

At _Integer_ _take_ is an alias for _positiveIntegerBinomial_,
which tells the number of combinations of _n_ elements taken _k_ at a time.

```
>>> 6.take(3)
((6 * 5 * 4) / (1 * 2 * 3))
```

If _k > n_ answers zero:

```
>>> 3.take(6)
0
```

* * *

See also: any, binomial, drop, takeFirst, takeLast

References:
_Apl_
[1](http://aplwiki.com/wiki/Take),
_Haskell_
[1](https://hackage.haskell.org/package/base/docs/Prelude.html#v:take)
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Take.html)

Categories: Accessing
