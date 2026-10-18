# Radix Syntax

By default integers are written in decimal.
Other radices are allowed using an infix _b_ syntax.
The _b_ must be written in lower case.
The form is _radix_,
also called _base_,
followed by _b_,
followed by the literal in the indicated radix.
Below are equivalent ways of writing the integer twenty three
(in binary, octal, decimal and hexadecimal):

```
>>> [2b10111 8b27 10b23 16b17]
[23 23 23 23]
```

Negative integers are written with a leading minus sign:

```
>>> [-2b10111 -8b27 -10b23 -16b17]
[-23 -23 -23 -23]
```

Larger small integers:

```
>>> 2b11010101
213

>>> 8b325
213

>>> 16bD5
213

>>> 16bACCEDED
181202413
```

Underscores are allowed as separators:

```
>>> 2b110010_101001_011001_010011
8b62_51_31_23

>>> 10b13_276_755
16bCA_96_53
```

All radices are written from most to least significant,
necessarily so as the written notation is not fixed width.

The binary shift operators shift according to this notation,
and can be read directly.

Shifting left moves bits to more significant positions and introduces zeroes at the right,
doubling the value for each bit shifted:

```
>>> 2b0001_0100 << 1
2b0010_1000

>>> 2b0001_0100 << 2
2b0101_0000

>>> 2b0001_0100 << 3
2b1010_0000
```

Shifting right moves bits to less significant positions,
and in the unsigned case introduces zeroes to the left,
halving the value,
and rounding down when odd,
for each bit shifted:

```
>>> 2b0001_0100 >> 1
2b0000_1010

>>> 2b0001_0100 >> 2
2b0000_0101

>>> 2b0001_0100 >> 3
2b0000_0010
```

_Note_:
The radices two, eight, ten and sixteen should be implemented by all systems,
other radices may raise errors.

```
>>> 23.integerDigits(3)
[2 1 2]

>>> 3b212
23

>>> 23.integerDigits(4)
[1 1 3]

>>> 4b113
23

>>> 23.integerDigits(5)
[4 3]

>>> 5b43
23

>>> 23.integerDigits(6)
[3 5]

>>> 6b35
23

>>> 23.integerDigits(7)
[3 2]

>>> 7b32
23

>>> 23.integerDigits(8)
[2 7]

>>> 8b27
23

>>> 23.integerDigits(9)
[2 5]

>>> 9b25
23
```

_Rational_:
This is the _J_ language notation for radix integers.
It is similar to the _Smalltalk_ notation,
which however uses the letter _r_.
The _J_ notation is preferred for Sᴘʟ since _R_ is used in `Fraction Syntax`.
Sᴘʟ also requires that letters used as digits be written in upper case.

* * *

Guides: Integer Syntax, Number Syntax

Categories: Syntax
