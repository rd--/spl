# Radix Syntax

By default integers are written in decimal.
Other radices are allowed using an infix _r_ syntax.
The form is _radix_ followed by _r_ followed by the literal in the indicated radix.
Below are equivalent ways of writing the integer twenty three
(in binary, octal, decimal and hexadecimal):

```
>>> [2r10111 8r27 10r23 16r17]
[23 23 23 23]
```

Negative integers are written with a leading minus sign:

```
>>> [-2r10111 -8r27 -10r23 -16r17]
[-23 -23 -23 -23]
```

Larger integers:

```
>>> 2r11010101
213

>>> 8r325
213

>>> 16rD5
213

>>> 16rACCEDED
181202413
```

_Note_:
The radices two, eight, ten and sixteen should be implemented by all systems,
other radices may raise errors.

```
>>> 9r55
50
```

* * *

See also: Integer Literals, Literals Syntax

Categories: Syntax
