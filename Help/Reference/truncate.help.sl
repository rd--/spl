# truncate

- _truncate(n, α=1)_

In the unary case,
answer the integer nearest _n_ toward `zero`,
that is the integer part of the number.

```
>>> 1.25.truncate
1

>>> -1.25.truncate
-1

>>> 1.pi.truncate
3

>>> (0 - 1.pi).truncate
-3
```

Compare to `floor`:

```
>>> 1.25.floor
1

>>> -1.25.floor
-2
```

At `Fraction`:

```
>>> 22/7.truncate
3

>>> -22/7.truncate
-3

>>> 7/8.truncate
0
```

In the binary case,
answer the next multiple of _α_ toward `zero` that is nearest _n_.

```
>>> 3.1479.truncate(0.01)
3.14

>>> 3.1479.truncate(0.1)
3.1

>>> 1923.truncate(10)
1920

>>> 3.1479.truncate(0.005)
3.145

>>> -3.1479.truncate(0.01)
-3.14
```

* * *

See also: ceiling, floor, integerPart, round, roundDown, roundTowardsZero, roundUp

Guides: Rounding Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Truncate.html),
_Smalltalk_
5.6.2.41,
_W_
[1](https://en.wikipedia.org/wiki/Truncation)

Categories: Truncating, Rounding
