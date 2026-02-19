# / (solidus)

- _m / n_
- _m./_

The binary form is `divide`.

```
>>> 77 / 11
divide(77, 11)
```

The unary form is `reciprocal`.

```
>>> 4./
reciprocal(4)

>>> [2 4 8]./
[0.5 0.25 0.125]

>>> 77 * 11./
77 / 11
```

Where supported `/` is displayed as ÷.

The name of this operator is `solidus`.

This glyph forms part of the `Fraction Syntax`:

```
>>> 616/33
Fraction(56, 3)

>>> 616 / 33
18.666
````

Numerator of _1/4-1/n^2_,
from Balmer spectrum of hydrogen,
OEIS [A061037](https://oeis.org/A061037):

~~~spl svg=A
(1/4 - (2:125 ^ 2/1)./)
.numerator
.scatterPlot
~~~

![](sw/spl/Help/Image/solidus-A.svg)

* * *

See also: //, +, -, *, divide, reciprocal

Guides: Arithmetic Functions, Binary Operators, Fraction Syntax, Mathematical Functions

Unicode: U+0002F / Solidus, U+00F7 ÷ Division Sign

Categories: Math, Operator
