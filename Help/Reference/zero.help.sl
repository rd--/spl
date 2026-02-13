# zero

- _zero(x)_

Answer a zero value of the same type as the object _x_.

At `Complex`:

```
>>> (2 + 3.i).zero
Complex(0, 0)

>>> 2J3.zero
0J0
```

At `Fraction`:

```
>>> 1/3.zero
Fraction(0, 1)
```

At `SmallFloat`:

```
>>> 3.141.zero
0.0
```

At `LargeInteger`:

```
>>> 23L.zero
0L
```

At `Decimal`:

```
>>> 3.141D.zero
0D
```

At `List`, answers with a zeroed collection of the same `shape`:

```
>>> [1 2 3; 4 5 6; 7 8 9].zero
[0 0 0; 0 0 0; 0 0 0]
```

List of zeroes,
OEIS [A000004](https://oeis.org/A000004):

```
>>> 1:9.zero
[0 0 0 0 0 0 0 0 0]
```

* * *

See also: isNegative, isNonZero, isPositive, isZero, one

Guides: Mathematical Functions, Number Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Zero.html),
_OEIS_
[1](https://oeis.org/A000004),
_W_
[1](https://en.wikipedia.org/wiki/0)
[2](https://en.wikipedia.org/wiki/Zero_element)

Categories: Instance Creation
