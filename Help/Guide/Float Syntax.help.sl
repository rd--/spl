# Float Syntax

Floating point numbers are written in decimal notation.
Digits are required on both sides of the decimal point,
implicit zeroes are not allowed.

```
>>> 3.141.isFloat
true

>>> 23.0.isFloat
true
```

There is a rarely used _F_ suffix for floating point numbers:

```
>>> 3.141F.isFloat
true

>>> 23.0F.isFloat
true
```

Both positive and negative signs are allowed:

```
>>> -2.3.isNegative
true

>>> +2.3.isPositive
true

>>> +2.0 - -2.0
4.0

>>> -2.0 - +2.0
-4.0
```

Real numbers may also be written in `Scientific Notation`:

```
>>> 1.0E-2
0.01

>>> 2.3E3
2300.0

>>> 3.141E0
3.141
```

Leading zeroes are allowed:

```
>>> 012.345
12.345

>>> -012.345
-12.345
```

Underscores are allowed as separators in the integer part:

```
>>> 123_456.789
123456.789
```

* * *

See also: Float

Guides: Number Syntax, Scientific Notation
