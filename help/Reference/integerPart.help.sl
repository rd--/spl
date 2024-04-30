# integerPart

- _integerPart(aNumber)_

Answers the integer part of _aNumber_.
`integerPart` is equivalent to `truncated`.

Find the integer part of a real number:

```
>>> 2.4.integerPart
2

>>> 456.457.integerPart
456

>>> (pi + e).integerPart
5
```

Find the integer part of a negative real number:

```
>>> -2.4.integerPart
-2
```

At `Fraction`:

```
>>> -5/4.integerPart
-1
```

At `Complex`:

```
>>> (78 / 47).j(-4.2).integerPart
1j-4
```

Threads elementwise over lists:

```
>>> [2.4 2.5 3.0].integerPart
[2 2 3]
```

Plot over a subset of the reals:

~~~
(-2, -1.99 .. 2).integerPart.plot
~~~

* * *

See also: ceiling, floor, fractionPart, truncated

References:
_Mathematica_
[1](https://mathworld.wolfram.com/IntegerPart.html)
[2](https://reference.wolfram.com/language/ref/IntegerPart.html),
_Smalltalk_
5.6.2.21
