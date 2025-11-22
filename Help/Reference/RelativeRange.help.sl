# RelativeRange

- _RelativeRange([i j k])_

A `RelativeRange` is a `Type` that represents a finite arithmetic progression of positive integers,
that is specified relative to an implicit extent at either `start` or `stop`.

One of either `start` or `stop` must be negative,
the absolute value indicates the index starting at the end and running backwards,
so that _-1_ indicates the last place and _-2_ the second last and so on.

An _extent_ must be specified in order to _resolve_ the span.

Relative `start` values:

```
>>> let s = RelativeRange(-3, 3, -1);
>>> (s, s.asRange(9))
(RelativeRange(-3, 3, -1), Range(7, 3, -1))

>>> -3:3:-1
RelativeRange(-3, 3, -1)
```

Relative `stop` values:

```
>>> let s = RelativeRange(3, -3, 2);
>>> (s, s.asRange(9))
(RelativeRange(3, -3, 2), Range(3, 7, 2))

>>> 3:-3:2
RelativeRange(3, -3, 2)
```

`step` may be negative,
and not equal to `one`:

```
>>> let s = RelativeRange(-3, 3, -2);
>>> (s, s.asRange(9))
(RelativeRange(-3, 3, -2), Range(7, 3, -2))

>>> -3:3:-2
RelativeRange(-3, 3, -2)
```

A span with a negative `start`, a positive `stop`, and a negative `step` is a relative span,
an equivalent `Range` value would be empty:

```
>>> RelativeRange(-1, 1, -1)
RelativeRange(-1, 1, -1)

>>> -1:1:-1
RelativeRange(-1, 1, -1)

>>> Range(-1, 1, -1).size
0

>>> { -1:1:-1.size }.hasError
true
```

A span with a positive `start`, a negative `stop`, and a positive `step` is a relative span,
an equivalent `Range` value would be empty:

```
>>> RelativeRange(1, -1, 1)
RelativeRange(1, -1, 1)

>>> 1:-1
RelativeRange(1, -1, 1)

>>> Range(1, -1, 1).size
0

>>> { 1:-1.size }.hasError
true
```

Note that a range to request the last _n_ items is written _-n:-1_,
and is an ordinary range:

```
>>> -7:-1
Range(-7, -1, 1)

>>> [1, 3 .. 23].atAllSymmetrical(-7:-1)
[11 13 15 17 19 21 23]
```

Zero is not a valid index at `atSymmetrical`:

```
>>> { RelativeRange(0, -1, 1) }.hasError
true

>>> { RelativeRange(-1, 0, -1) }.hasError
true
```

* * *

See also: :, ArithmeticProgression, Interval, List, Range

Guides: Range Syntax, RelativeRange Syntax

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Span.html),

Categories: Collection, Type
