# Span

- _Span(start, stop, step)_

A `Span` is a `Type` that represents a finite arithmetic progression of positive integers,
that may be specified relative to an implicit extent.

If `start` or `stop` is negative,
the absolute value indicates the index starting at the end and running backwards,
so that _-1_ indicates the last place and _-2_ the second last and so on.
In this case an _extent_ must be specified in order to _resolve_ the span.

Absolute and relative `start` values:

```
>>> Span(7, 3, -1).asRange
Range(7, 3, -1)

>>> Span(-3, 3, -1).asRange(9)
Range(7, 3, -1)
```

Absolute and relative `stop` values:

```
>>> Span(3, 7, 2).asRange
Range(3, 7, 2)

>>> Span(3, -3, 2).asRange(9)
Range(3, 7, 2)
```

`step` may be negative,
and not equal to `one`:

```
>>> Span(7, 3, -2).asRange
Range(7, 3, -2)

>>> Span(-3, 3, -2).asRange(9)
Range(7, 3, -2)
```

A `Span` may have only one place:

```
>>> Span(1, 1, 1).size
1
```

Compute the first ten squares:

```
>>> Span(1, 10, 1) ^ 2
[1 4 9 16 25 36 49 64 81 100]
```

* * *

See also: :, ArithmeticProgression, Interval, List, Range

Guides: Range Syntax

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Span.html),

Categories: Collection, Type
