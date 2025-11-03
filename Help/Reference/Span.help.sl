# Span

- _Span([i j k])_

A `Span` is a `Type` that represents a finite arithmetic progression of positive integers,
that may be specified relative to an implicit extent at either `start` or `stop`.

A `Span` that is _not_ relative is equivalent to a `Range` value,
and the `Span` method will answer a `Range` value in these cases.

If one of `start` or `stop` is negative,
the absolute value indicates the index starting at the end and running backwards,
so that _-1_ indicates the last place and _-2_ the second last and so on.
In this case an _extent_ must be specified in order to _resolve_ the span.

Absolute and relative `start` values:

```
>>> Span(7, 3, -1)
Range(7, 3, -1)

>>> 7:-1:3
Range(7, 3, -1)

>>> let s = Span(-3, 3, -1);
>>> (s, s.asRange(9))
(Span(-3, 3, -1), Range(7, 3, -1))

>>> -3:-1:3
Span(-3, 3, -1)
```

Absolute and relative `stop` values:

```
>>> Span(3, 7, 2)
Range(3, 7, 2)

>>> 3:2:7
Range(3, 7, 2)

>>> let s = Span(3, -3, 2);
>>> (s, s.asRange(9))
(Span(3, -3, 2), Range(3, 7, 2))

>>> 3:2:-3
Span(3, -3, 2)
```

`step` may be negative,
and not equal to `one`:

```
>>> Span(7, 3, -2)
Range(7, 3, -2)

>>> 7:-2:3
Range(7, 3, -2)

>>> let s = Span(-3, 3, -2);
>>> (s, s.asRange(9))
(Span(-3, 3, -2), Range(7, 3, -2))

>>> -3:-2:3
Span(-3, 3, -2)
```

A span with a negative `start`, a positive `stop`, and a negative `step` is a relative span,
an equivalent `Range` value would be empty:

```
>>> Span(-1, 1, -1)
Span(-1, 1, -1)

>>> -1:-1:1
Span(-1, 1, -1)

>>> Range(-1, 1, -1).size
0

>>> { -1:-1:1.size }.hasError
true
```

A span with a positive `start`, a negative `stop`, and a positive `step` is a relative span,
an equivalent `Range` value would be empty:

```
>>> Span(1, -1, 1)
Span(1, -1, 1)

>>> 1:-1
Span(1, -1, 1)

>>> Range(1, -1, 1).size
0

>>> { 1:-1.size }.hasError
true
```

All other spans are absolute and are translated into `Range` values:

```
>>> Span(-1, 1, 1)
Range(-1, 1, 1)

>>> -1:1
Range(-1, 1, 1)

>>> Span(1, -1, -1)
Range(1, -1, -1)

>>> 1:-1:-1
Range(1, -1, -1)
```

A span to request the last _n_ items is written _-n:-1_,
which is an ordinary range:

```
>>> -7:-1
Range(-7, -1, 1)

>>> [1, 3 .. 23].atAllSymmetrical(-7:-1)
[11 13 15 17 19 21 23]
```

Zero is not a valid index at `atSymmetrical`,
however `Span` will construct `Range` values that include zero:

```
>>> Span(0, 9, 1)
Range(0, 9, 1)

>>> Span(9, 0, -1)
Range(9, 0, -1)

>>> -9:0
Range(-9, 0, 1)

>>> 0:-1:-9
Range(0, -9, -1)
```

* * *

See also: :, ArithmeticProgression, Interval, List, Range

Guides: Range Syntax, Span Syntax

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Span.html),

Categories: Collection, Type
