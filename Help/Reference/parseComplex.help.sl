# parseComplex

- _parseComplex(s, f:/0)_

Answer the `Complex` number represented by the string _s_,
else evaluate the else clause _f_ or signal an `error`.

Parse integral complex number:

```
>>> '3J4'.parseComplex
3J4
```

Parse fractional complex number:

```
>>> '3.141J1.618'.parseComplex
3.141J1.618
```

Signal an `error` if the string _s_ is not a complex number:

```
>>> '23'.parseComplex { nil }
nil

>>> {
>>> 	'3.141'.parseComplex
>>> }.hasError
true
```

At `Record`:

```
>>> (real: 2, imaginary: 3)
>>> .parseComplex
2J3

>>> 2J3.asRecord
(real: 2, imaginary: 3)
```

* * *

See also: Complex, parseDecimal, parseLargeInteger, parseNumber, parseSmallInteger

Guides: Parsing Functions

Categories: Converting, Parsing
