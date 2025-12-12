# take

- _take(c, n)_
- _take(c, n, x)_

Answer a copy of the collection _c_ with only the first _n_ places,
or less if _c_ is not large enough.

At `String`:

```
>>> 'Hello World!'.take(5)
'Hello'

>>> 'Text'.take(5)
'Text'
```

At `Range`:

```
>>> 1:5.take(3)
1:3

>>> 1:5.take(9)
1:5
```

At `List`:

```
>>> [1 2].take(3)
[1 2]

>>> [].take(3)
[]

>>> [1 2].take(0)
[]

>>> [5 4 3 2 1].take(3)
[5 4 3]

>>> [1 .. 5].take(9)
[1 2 3 4 5]
```

It is an error if _n_ is less than zero:

```
>>> { [1 2].take(-1) }.hasError
true
```

The ternary form only applies to sequences.
If _n_ is negative, answer a copy of _c_ with only the last _n_ places.

```
>>> [5 4 3 2 1].take(-3, 0)
[3 2 1]

>>> [5 4 3 2 1].takeLast(3, 0)
[3 2 1]
```

The ternary form allows taking more elements than the sequence contains,
filling the empty slots with the object _x_, either as a suffix:

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

See also: any, drop, first, takeFirst, takeLast

Guides: List Functions

References:
_Apl_
[1](http://aplwiki.com/wiki/Take),
_Haskell_
[1](https://hackage.haskell.org/package/base/docs/Prelude.html#v:take)
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Take.html)

Categories: Accessing
