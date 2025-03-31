# between

- _between(x, [min max])_
- _between([min max])_

Answer `true` if _x_ is between (inclusively) _min_ and _max_, else `false`.

Check that a number is included in an interval:

```
>>> 3.between(1 -- 5)
true

>>> 3.between([1 5])
true
```

Use an operator form:

>>> 0:6.collect((1 -- 5).between)
[false true true true true true false]
```

Threads over lists:

```
>>> [-1 0 1 2].between(0 -- 1)
[false true true false]
```

Use `includes` instead of `between`:

```
>>> (1 -- 10).includes(7)
true

>>> 1:10.includes(7)
true
```

* * *

See also: <=, >=, betweenAnd, coordinateBounds, exclusivelyBetweenAnd, includes, inclusivelyBetweenAnd, minMax

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Between.html)

Categories: Comparing
