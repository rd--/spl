# betweenAnd

- _betweenAnd(self, min, max)_

Is _self_ between (inclusively) _min_ and _max_?

Check that a number is included in an interval:

```
>>> 3.betweenAnd(1, 5)
true

>>> 0:6.collect { :each | each.betweenAnd(1, 5) }
[false true true true true true false]
```

Use `Interval` or `Range` and `includes` instead of `betweenAnd`:

```
>>> Interval(1, 10).includes(7)
true

>>> 1:10.includes(7)
true
```

* * *

See also: <=, >=, exclusivelyBetweenAnd, inclusivelyBetweenAnd

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Between.html)

Categories: Comparing
