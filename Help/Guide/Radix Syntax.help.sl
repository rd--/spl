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

Underscores are allowed as separators:

```
>>> 2r110010_101001_011001_010011
8r62_51_31_23

>>> 10r13_276_755
16rCA_96_53
```

All radices are written from most to least significant,
necessarily so as the written notation is not fixed width.

The binary shift operators shift according to this notation,
and can be read directly.

Shifting left moves bits to more significant positions and introduces zeroes at the right,
doubling the value for each bit shifted:

```
>>> 2r0001_0100 << 1
2r0010_1000

>>> 2r0001_0100 << 2
2r0101_0000

>>> 2r0001_0100 << 3
2r1010_0000
```

Shifting right moves bits to less significant positions,
and in the unsigned case introduces zeroes to the left,
halving the value,
and rounding down when odd,
for each bit shifted:

```
>>> 2r0001_0100 >> 1
2r0000_1010

>>> 2r0001_0100 >> 2
2r0000_0101

>>> 2r0001_0100 >> 3
2r0000_0010
```

_Note_:
The radices two, eight, ten and sixteen should be implemented by all systems,
other radices may raise errors.

```
>>> 9r55
50

>>> (9 ^ [1 0]) * [5 5]
[45 5]
```

* * *

See also: Integer Syntax, Number Syntax

Categories: Syntax
