# betweenAnd

- _betweenAnd(x, min, max)_

Answer `true` if _x_ is between (inclusively) _min_ and _max_, else `false`.

Check that a number is included in an interval:

```
>>> 3.betweenAnd(1, 5)
true

>>> 0:6.collect { :each | each.betweenAnd(1, 5) }
[false true true true true true false]
```

Threads over lists:

```
>>> [-1 0 1 2].betweenAnd(0, 1)
[false true true false]
```

Use `Interval` or `Range` and `includes` instead of `betweenAnd`:

```
>>> (1 -- 10).includes(7)
true

>>> 1:10.includes(7)
true
```

* * *

See also: <=, >=, between, exclusivelyBetweenAnd, inclusivelyBetweenAnd

References:
_Smalltalk_
5.6.1.5

Categories: Comparing
