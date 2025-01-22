# Range

- _Range(start, stop, step)_

A `Range` is a `Type` that represents a finite arithmetic progression.

```
>>> Range(1, 9, 1).asList
[1 2 3 4 5 6 7 8 9]

>>> Range(1, 9, 2).asList
[1 3 5 7 9]
```

`step` may be negative:

```
>>> Range(9, 1, -2).asList
[9 7 5 3 1]
```

Ordinarily the range is inclusive,
both `start` and `stop` are elements of the answer.
However the `step` value may specify a range that not include `stop`.

```
>>> Range(1, 9, 3).asList
[1 4 7]
```

Note in particular that with non-integer values _stop_ may not be in the list of values specified by the `Range`:

```
>>> let r = Range(1.2, 2.2, 0.15);
>>> (r.size, r.asList)
(7, [1.2 1.35 1.5 1.65 1.8 1.95 2.1])
```

The `last`, `min` and `max` methods report the true value:

```
>>> let r = Range(1.2, 2.2, 0.15);
>>> (r.last, r.end, r.max)
(2.1, 2.1, 2.1)
```

This is distinct from the problem of accumulating errors in the summation process,
which is handled specially:

```
>>> { :x |
>>> 	x + 0.01
>>> }.iterate(0, 100) > 1
true

>>> Range(0, 1, 0.01).last > 1
false

>>> Range(0, 1, 0.01).asList.last > 1
false
```

There is a `Range Syntax` for writing Ranges and interval lists:

```
>>> 1:4
Range(1, 4, 1)

>>> (1 .. 4)
Range(1, 4, 1)

>>> 1:2:9
Range(1, 9, 2)

>>> (1, 3 .. 9)
Range(1, 9, 2)
```

A `Range` is _proper_ if it is not empty and if the _stop_ value is the last value:

```
>>> 1:9.isProper
true

>>> (1, 1.5 .. 3.75).isProper
false

>>> (1, 2 .. 0).isProper
false
```

A `Range` is _normal_ if it is _proper_ and if the _start_ value is less than or equal to the _stop_ value:

```
>>> 1:9.isNormal
true

>>> 7:5.isNormal
false
```

While the _p:q_ and _(p .. q)_ notations cannot make empty or _improper_ `Range` values,
the _(p, q .. r)_ notation may:

```
>>> (7, 8 .. 5)
Range(7, 5, 1)
```

Use a step of 2:

```
>>> Range(1, 10, 2).asList
[1 3 5 7 9]
```

Use a negative step:

```
>>> Range(10, 1, -1).asList
[10 9 8 7 6 5 4 3 2 1]
```

Use a non-integer step:

```
>>> Range(0, 10, pi).asList
[0 3.14159 6.28319 9.42478]
```

`Range` of `LargeInteger`:

```
>>> Range(1n, 2n ^ 90, 1n).size
1237940039285380274899124224n

>>> Range(2n ^ 90, 2n ^ 90 + 2, 2n)
>>> .asList
[
	1237940039285380274899124224n
	1237940039285380274899124226n
]
```

A `Range` may have only one place:

```
>>> 1:1.size
1
```

By convention a `Range` where the step is in the wrong direction is empty:

```
>>> let r = Range(1, 0, 1);
>>> (r.size, r.isEmpty, r.asList)
(0, true, [])
```

A `Range` may not have a `step` of `zero`:

```
>>> { Range(1, 9, 0) }.ifError { true }
true
```

Floating point ranges are subject to floating point errors:

```
>>> (1.80, 1.85 .. 1.90).asList
[1.8 1.85]

>>> 0:2 * 0.05 + 1.8
[1.8 1.85 1.9]

>>> 2 * 0.05 + 1.8 > 1.9
true
```

The elements of a simple integer range are all integers:

```
>>> 1:999.allSatisfy(isInteger:/1)
true
```

Compute the first ten squares:

```
>>> 1:10 ^ 2
[1 4 9 16 25 36 49 64 81 100]
```

* * *

See also: .., :, ArithmeticProgression, discretize, do, downTo, end, Interval, isIntegerRange, last, reverseDo, start, stop, subdivide, thenTo, to, toBy, upOrDownTo

Guides: Range Syntax

References:
_Mathematica_
[1](https://mathworld.wolfram.com/ArithmeticProgression.html)
[2](https://mathworld.wolfram.com/CommonDifference.html)
[3](https://reference.wolfram.com/language/ref/Range.html)
[4](https://reference.wolfram.com/language/ref/Span.html),
_Octave_
[1](https://docs.octave.org/latest/Ranges.html),
_Smalltalk_
5.7.19

Categories: Collection, Type
