# isBetween

- _isBetween(x, [min max])_
- _isBetween(x, min, max)_

Answer `true` if _x_ is between (inclusively) _min_ and _max_, else `false`.

Check that a number is included in an interval:

```
>>> 3.isBetween(1 -- 5)
true

>>> 3.isBetween([1 5])
true
```

Threads over lists:

```
>>> [-1 0 1 2].isBetween(0 -- 1)
[false true true false]
```

Use `includes` instead of `isBetween`:

```
>>> (1 -- 10).includes(7)
true

>>> 1:10.includes(7)
true
```

The ternary form,
check that a number is included in an interval:

```
>>> 3.isBetween(1, 5)
true

>>> 0:6.collect { :each | each.isBetween(1, 5) }
[false true true true true true false]
```

Threads over lists:

```
>>> [-1 0 1 2].isBetween(0, 1)
[false true true false]
```

Use `Interval` or `Range` and `includes` instead of `isBetween`:

```
>>> (1 -- 10).includes(7)
true

>>> 1:10.includes(7)
true
```

* * *

See also: <=, >=, coordinateBounds, includes, isExclusivelyBetween, isInclusivelyBetween, minMax

Guides: Comparison Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Between.html),
_Smalltalk_
5.6.1.5
