# Interval

- _Interval(min, max)_

An interval represents the range of values between _min_ and _max_.
Intervals are closed, they includes both end points.

Use `+` to add intervals, getting an interval representing the result:

```
>>> Interval(1, 6) + Interval(0, 2)
Interval(1, 8)
```

Squaring gives a non-negative interval:

```
>>> Interval(-2, 5).squared
Interval(0, 25)
```

Exact comparisons can be made with intervals:

```
>>> Interval(5, 8) > pi
true
```

Numbers automatically turn into intervals:

```
>>> 1.asInterval
Interval(1, 1)

>>> Interval(-1, 1) + 1 * 0.5
Interval(0, 1)
```

Use `min` and `max` to find end points of intervals:

```
>>> let i = Interval(-1.pi, pi);
>>> (i.min, i.max)
(-1.pi, pi)
```

Use `includes` to determine if a point is in the interval (checking for containment):

```
>>> let i = Interval(1, 5);
>>> [3.2, 5, 1, 9].collect { :each | i.includes(each) }
[true, true, true, false]
```

Combine intervals:

```
>>> Interval(1, 3).union(Interval(2, 4))
Interval(1, 4)

>>> Interval(1, 9).union(Interval(3, 5))
Interval(1, 9)
```

Cannot combine disjoint intervals:

```
>>> { Interval(-2, 0).union(Interval(1, 4)) }.ifError { true }
true
```

Find where intervals overlap:

```
>>> Interval(-2, 3).intersection(Interval(1, 4))
Interval(1, 3)

>>> Interval(-2, pi).intersection(Interval(e, 4))
Interval(e, pi)
```

Cannot intersect disjoint intervals:

```
>>> { Interval(-2, 0).intersection(Interval(1, 4)) }.ifError { true }
true
```

It is an `error` if `min` exceeds `max`:

```
>>> { Interval(1, 0) }.ifError { true }
true
```

* * *

See also: Range

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Interval.html)
[2](https://reference.wolfram.com/language/ref/Interval.html)

Categories: Collection, Number, Type
