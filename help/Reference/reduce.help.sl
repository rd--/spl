# reduce

_reduce(anIterable, aBlock:/2)_

Apply _aBlock_ cumulatively to the elements of _anIterable_.

Initially evaluates the block with the first two elements of the collecton,
then with the result of the first evaluation and the next element,
and so on.
Answers the result of the final evaluation.
If _aCollection_ is empty, raise an error.
If _aCollection_ has a single element, answer that element.

For sequenceable collections the elements will be used in order,
for unordered collections the order is unspecified.

For instance, to sum the numeric elements of a collection:

```
>>> [1 .. 9].reduce(+)
45
```

In cases where _aBlock_ is not associative, reduce associates to the left:

```
>>> [1 .. 9].reduce(-)
-43

>>> (((((((1 - 2) - 3) - 4) - 5) - 6) - 7) - 8) - 9
-43
```

_reduce_ is an alias for _foldLeft_, the dual of which is _foldRight_:

```
>>> [1 .. 9].foldRight(-)
5

>>> (1 - (2 - (3 - (4 - (5 - (6 - (7 - (8 - 9))))))))
5
```

Reducing an empty collection is an error:

```
>>> { [].reduce(+) }.ifError { true }
true
```

Reducing with logical combinators:

```
>>> [true false true true].reduce(&&)
false

>>> [false false true true].reduce(||)
true
```

* * *

See also: injectInto, scan

References:
_Apl_
[1](https://aplwiki.com/wiki/Reduce),
_Haskell_
[1](https://hackage.haskell.org/package/base/docs/Prelude.html#v:foldr1)

Categories: Enumerating
