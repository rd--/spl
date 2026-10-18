# between

- _between(min -- max)_

Answer a unary block that will
answer `true` if the argument is between (inclusively) _min_ and _max_,
else `false`.

```
>>> 0:6.collect(
>>> 	(1 -- 5).between
>>> )
[false true true true true true false]
```

* * *

See also: <=, >=, coordinateBounds, includes, isBetween, minMax

Guides: Comparison Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Between.html)

Categories: Comparing
