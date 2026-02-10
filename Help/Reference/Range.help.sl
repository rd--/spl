# Range

- _Range([i j k])_

A `Range` is a `Type` that represents a finite arithmetic progression,
ranging from _i_ to _j_ by step _k_.
The range is closed, it includes both the lower and upper bound.

```
>>> Range([1 9 1]).asList
[1 2 3 4 5 6 7 8 9]

>>> Range([1 9 2]).asList
[1 3 5 7 9]
```

`step` may be negative:

```
>>> Range([9 1 -2]).asList
[9 7 5 3 1]
```

Count backwards by seven,
OEIS [A115020](https://oeis.org/A115020):

```
>>> Range([100 2 -7]).asList
[
	100  93  86  79  72  65
	 58  51  44  37  30  23
	 16   9  2
]
```

Ordinarily the range is inclusive,
both `start` and `stop` are elements of the answer.
However the `step` value may specify a range that not include `stop`,
in which case it is not a proper range:

```
>>> let x = Range([1 9 3]);
>>> (x.asList, x.isProper)
([1 4 7], false)

>>> let x = Range([0 10 3]);
>>> (x.asList, x.isProper)
([0 3 6 9], false)
```

Note in particular that with non-integer values _stop_ may not be in the list of values specified by the `Range`:

```
>>> let x = Range([1.2 2.2 0.15]);
>>> (x.size, x.asList, x.isProper)
(
	7,
	[1.2 1.35 1.5 1.65 1.8 1.95 2.1],
	false
)
```

The `last`, `min` and `max` methods report the true value:

```
>>> let x = Range([1.2 2.2 0.15]);
>>> (x.last, x.end, x.max, x.isProper)
(2.1, 2.1, 2.1, false)
```

This is distinct from the problem of accumulating errors in the summation process,
which is handled specially:

```
>>> { :x |
>>> 	x + 0.01
>>> }.iterate(0, 100) > 1
true

>>> let a = Range([0 1 0.01]);
>>> let b = a.asList;
>>> (a.last > 1, b.last > 1, a.isProper)
(false, false, true)
```

Range expressions are written _(i .. j)_,
or _(i, j .. k)_ where _j_ is the second term,
and can specify arbitrary ranges:

```
>>> (1 .. 4)
Range([1 4 1])

>>> (1, 3 .. 9)
Range([1 9 2])
```

A `Range` is _proper_ if it is not empty and if the _stop_ value is the last value:

```
>>> (1 .. 9).isProper
true

>>> (1, 1.5 .. 3.75).isProper
false

>>> Range(1, 0, 1).isProper
false
```

A `Range` is _normal_ if it is _proper_ and if the _start_ value is less than or equal to the _stop_ value:

```
>>> (1 .. 9).isNormal
true

>>> (7, 6 .. 5).isNormal
false
```

While the _.._ range notation cannot make empty `Range` values,
the _:_ notation may:

```
>>> { (7 .. 5) }.hasError
true

>>> { (7, 8 .. 5) }.hasError
true

>>> 7:5
Range([7 5 1])
```

Use a step of 2:

```
>>> Range([1 10 2]).asList
[1 3 5 7 9]
```

Use a negative step:

```
>>> Range([10 1 -1]).asList
[10 9 8 7 6 5 4 3 2 1]
```

Use a non-integer step:

```
>>> Range([0 10 1.pi]).asList
[0 3.14159 6.28319 9.42478]

>>> Range([0 2.pi 0.5.pi]).collect { :x |
>>> 	[x, x.radiansToDegrees.floor]
>>> }
[
	0       0;
	1/2.pi  90;
	1.pi   180;
	3/2.pi 270;
	2.pi   360
]
```

`Range` of `LargeInteger`:

```
>>> Range(1L, 2L ^ 90, 1L).size
1237940039285380274899124224L

>>> Range(2L ^ 90, 2L ^ 90 + 2, 2L)
>>> .asList
[
	1237940039285380274899124224L
	1237940039285380274899124226L
]
```

A `Range` may have only one place:

```
>>> (1 .. 1).size
1
```

By convention a `Range` where the step is in the wrong direction is empty:

```
>>> let r = Range([1 0 1]);
>>> (r.size, r.isEmpty, r.asList)
(0, true, [])
```

A `Range` may not have a `step` of `zero`:

```
>>> {
>>> 	Range([1 9 0])
>>> }.hasError
true
```

Floating point ranges are subject to floating point errors:

```
>>> (1.80, 1.85 .. 1.90).asList
[1.8 1.85]

>>> (0 .. 2) * 0.05 + 1.8
[1.8 1.85 1.9]

>>> 2 * 0.05 + 1.8 > 1.9
true
```

The elements of a simple integer range are all integers:

```
>>> (1 .. 999).allSatisfy(isInteger:/1)
true
```

Compute the first ten squares:

```
>>> (1 .. 10) ^ 2
[1 4 9 16 25 36 49 64 81 100]
```

In addition to the `Range Syntax` forms for writing `Range` and `List` values,
there is a syntax for writing `Range` literals as either _i:j_,
or _i:j:k_ where _j_ is the step size.

```
>>> 1:4
Range([1 4 1])

>>> 1:9:2
Range([1 9 2])
```

Work with infinite ranges:

```
>>> 1:Infinity.indexOf(9)
9

>>> 1:Infinity.detect { :x | x = 9 }
9
```

* * *

See also: .., ArithmeticProgression, characterRange, discretize, do, downTo, end, Interval, isIntegerRange, last, reverseDo, RelativeRange, start, stop, subdivide, thenTo, to, toBy, upOrDownTo

Guides: Range Syntax, Range Literal Syntax

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
