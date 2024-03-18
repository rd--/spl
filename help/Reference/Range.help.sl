# Range

- _Range(start, stop, step)_

A `Range` is a `Type` that represents a finite arithmetic progression.

```
>>> Range(1, 9, 2).asList
[1 3 5 7 9]

>>> Range(9, 1, -2).asList
[9 7 5 3 1]
```

With non-integer values, may not reach _stop_:

```
>>> Range(1.2, 2.2, 0.15).asList
[1.2 1.35 1.5 1.65 1.8 1.95 2.1]
```

There is a `Range Syntax` for writing Ranges and interval lists:

```
>>> 1:4
Range(1, 4, 1)

>>> (1 .. 4)
Range(1, 4, 1)

>>> (1, 3 .. 9)
Range(1, 9, 2)
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

Range of large integers:

```
>>> Range(1n, 2n ^ 90, 1n).size
1237940039285380274899124224n

>>> Range(2n ^ 90, 2n ^ 90 + 2, 2n).asList
[1237940039285380274899124224n 1237940039285380274899124226n]
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

* * *

See also: downTo, Interval, isIntegerRange, Range Syntax, thenTo, to, toBy, upOrDownTo

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Range.html)
[2](https://reference.wolfram.com/language/ref/Span.html),
_Smalltalk_
5.7.19

Categories: Collection, Type
