# highBit

- _highBit(n)_

Answer the number of bits required to represent the integer _n_ in base two.

```
>>> 32.highBit
6

>>> 32.integerLength(2)
6
```

Radix two notation indicates this directly:

```
>>> 2b00100000
32

>>> 2b00100000.highBit
6
```

The state of lower bits does not affect the answer:

```
>>> 2b00101000
32 + 8

>>> 2b00101000.highBit
6
```

High bit is not defined for negative integers:

```
>>> {
>>> 	-2b00101000.highBit
>>> }.hasError
true
```

At `LargeInteger`:

```
>>> 52L.factorial.highBit
226
```

Threads over lists,
first few terms from one,
OEIS [A070939](https://oeis.org/A070939):

```
>>> 1:23.highBit
[1 2 2 3 3 3 3 4 4 4 4 4 4 4 4 5 5 5 5 5 5 5 5]
```

First few terms from zero,
OEIS [A029837](https://oeis.org/A029837):

~~~spl svg=A oeis=A029837
(0 .. 2 ^ 9 - 1).functionPlot(highBit/1)
~~~

![](Help/Image/highBit-A.svg)

* * *

See also: Binary, bitLength, bitShiftRight, byteCount, highBitOfInteger, integerLength, lowBit

Guides: Bitwise Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/BitLength.html),
_Smalltalk_
5.6.5.13
