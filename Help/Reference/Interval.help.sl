# Interval

- _Interval(min, max)_

An interval represents the range of values between `min` and `max`,
the lower and upper bounds respectively.
Intervals are closed, they includes both end points.

```
>>> let i = Interval(0, 1);
>>> (
>>> 	i.min,
>>> 	i.max,
>>> 	i.minMax,
>>> 	i.includes(0),
>>> 	i.includes(1)
>>> )
(0, 1, [0 1], true, true)
```

There are aliases `lowerBound`, `upperBound` and `endPoints`:

```
>>> let i = Interval(0, 1);
>>> (
>>> 	i.lowerBound, i.upperBound,
>>> 	i.endPoints
>>> )
(0, 1, [0 1])
```

Use `+` to add intervals, getting an interval representing the result:

```
>>> (1 -- 6) + (0 -- 2)
1 -- 8
```

Squaring gives a non-negative interval:

```
>>> (-2 -- 5).square
0 -- 25
```

Exact comparisons can be made with intervals:

```
>>> (5 -- 8) > 1.pi
true
```

Numbers automatically turn into intervals:

```
>>> 1.asInterval
(1 -- 1)

>>> (-1 -- 1) + 1 * 0.5
(0 -- 1)
```

Use `min` and `max` to find end points of intervals:

```
>>> let i = (-1.pi -- 1.pi);
>>> (i.min, i.max)
(-1.pi, 1.pi)
```

Use `includes` to determine if a point is in the interval (checking for containment):

```
>>> (2 -- 5).includes(1.pi)
true

>>> let i = (1 -- 5);
>>> [3.2, 5, 1, 9].collect { :each |
>>> 	i.includes(each)
>>> }
[true true true false]
```

Use `union` to combine intervals:

```
>>> (1 -- 3).union(2 -- 4)
(1 -- 4)

>>> (1 -- 9).union(3 -- 5)
(1 -- 9)
```

Cannot combine disjoint intervals:

```
>>> {
>>> 	(-2 -- 0).union(1 -- 4)
>>> }.hasError
true
```

Use `intersection` to find where intervals overlap:

```
>>> (-2 -- 3).intersection(1 -- 4)
(1 -- 3)

>>> (-2 -- 1.pi).intersection(1.e -- 4)
(1.e -- 1.pi)
```

Cannot intersect disjoint intervals:

```
>>> {
>>> 	(-2 -- 0).intersection(1 -- 4)
>>> }.hasError
true
```

It is an `error` if `min` exceeds `max`:

```
>>> { (1 -- 0) }.hasError
true
```

`Interval` values can be converted to `Range` values using `discretize`:

```
>>> (1 -- 10).discretize(10)
1:10
```

or `subdivide`:

```
>>> (1 -- 10).subdivide(9)
1:10
```

The `centre` and `radius` of an interval:

```
>>> let x = 3 -- 7;
>>> (
>>> 	x.centre,
>>> 	(3 + 7) / 2,
>>> 	x.radius,
>>> 	(7 - 3) / 2
>>> )
(5, 5, 2, 2)
```

Sample a function uniformly on an interval:

~~~spl svg=A
(0 -- 2.pi).subdivide(47).collect { :x |
	(2 * x).sin - (3 * x).cos
}.discretePlot
~~~

![](sw/spl/Help/Image/Interval-A.svg)

* * *

See also: --, discretize, includes, intersection, Range, subdivide, union

Guides: Range Syntax

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Interval.html)
[2](https://reference.wolfram.com/language/ref/Interval.html),
_W_
[1](https://en.wikipedia.org/wiki/Interval_(mathematics))

Categories: Collection, Number, Type
