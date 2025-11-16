# deepReduce

- _deepReduce(c, f:/2)_

Apply the block _f_ cumulatively to the deep elements of the iterable collection _c_.
This is `reduceBy` of `deepDo`, see `reduce` for details.

Sum the numeric elements of a matrix,
compare to `reduce` which sums the columns:

```
>>> [3 3].iota.deepReduce(+)
45

>>> [3 3].iota.reduce(+)
[12 15 18]
```

In cases where the block _f_ is not associative, reduce associates to the left:

```
>>> [3 3].iota.deepReduce(-)
-43

>>> [3 3].iota.reduce(-)
[-10 -11 -12]
```

Reducing an empty collection is an error:

```
>>> { [].deepReduce(+) }.hasError
true
```

Reducing with logical combinators:

```
>>> [true false; true true].deepReduce(&&)
false

>>> [true false; true true].reduce(&&)
[true false]
```

Finding the maximum value of a matrix:

```
>>> [3 3].iota.deepReduce(max:/2)
9

>>> [3 3].iota.reduce(max:/2)
[7 8 9]
```

* * *

See also: injectInto, reduce, reduceBy, scan

Categories: Enumerating
