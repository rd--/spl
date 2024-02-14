# take

- _take(aCollection, maxNumberOfElements)_

Answer _maxNumberOfElements_ from _aCollection_ as a new collection (using _species_),
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
```

- _take(anInteger, aSmallerInteger)_

Return the number of combinations of anInteger elements taken _aSmallerInteger_ at a time.
For 6 take 3, this is (6 * 5 * 4) / (1 * 2 * 3).
Zero outside of Pascals triangle.

- _take(aSequence, anInteger)_

Answer a copy of _aSequence_ with only the first _anInteger_ places.

```
>>> [5 4 3 2 1].take(3)
[5 4 3]
```

- _take(aSequence, anInteger, anObject)_

In the ternary form, if _anInteger_ is negative, answer a copy of _aSequence_ with only the last _anInteger_ places.

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

* * *

See also: any, drop, takeFirst, takeLast

References:
_Apl_
[1](http://aplwiki.com/wiki/Take),
_Haskell_
[1](https://hackage.haskell.org/package/base/docs/Prelude.html#v:take)
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Take.html)

Categories: Accessing
