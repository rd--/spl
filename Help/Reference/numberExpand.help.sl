# numberExpand

- _numberExpand(x, b)_

Answer a list of the digits of _x_ in base _b_ multiplied by their corresponding powers of _b_.
The least power is in all cases `zero`.

Expand an integer number into a list of multiples of powers of 10:

```
>>> 157.numberExpand(10)
[100 50 7]

>>> [100 50 7].sum
157

>>> 1437.numberExpand(10)
[1000 400 30 7]
```

Expand a real number into a list of multiples of powers of 10:

```
>>> (1111 / 2).numberExpand(10)
[500 50 5.5]

>>> [500 50 5.5].sum
1111 / 2
```

Expand a number in base 2:

```
>>> 157.numberExpand(2)
[128 0 0 16 8 4 0 1]

>>> [128 0 0 16 8 4 0 1].sum
157

>>> (1111 / 7).numberExpand(2)
[128 0 0 16 8 4 2 5/7]

>>> [128 0 0 16 8 4 2 5/7].sum
1111/7
```

Expand a negative integer:

```
>>> -14379.numberExpand(10)
[-10000 -4000 -300 -70 -9]
```

* * *

See also: integerDigits, realDigits, numberDecompose

Guides: Number Digit Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/NumberExpand.html)
