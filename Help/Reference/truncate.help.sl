# truncate

- _truncate(x)_

Answer the integer nearest _x_ toward `zero`,
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

* * *

See also: integerPart, round, truncateTo

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Truncate.html),
_Smalltalk_
5.6.2.41,
_W_
[1](https://en.wikipedia.org/wiki/Truncation)

Categories: Truncating, Rounding
