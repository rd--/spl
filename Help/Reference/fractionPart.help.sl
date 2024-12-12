# fractionPart

- _fractionPart(aNumber)_

Answer a number whose value is the difference between the _aNumber_ and its truncated value,
so that _x.truncated + x.fractionPart = x_.

```
>>> let x = 1.6;
>>> x.fractionPart + x.truncated
x

>>> let x = -1.6;
>>> x.fractionPart + x.truncated
x

>>> let x = 3.1416;
>>> x.fractionPart + x.truncated
x
```

At `SmallFloat`:

```
>>> 0.5.fractionPart
0.5

>>> 2.4.fractionPart
0.4

>>> -5.45533.fractionPart
-0.45533
```

Fractional part of a negative real number:

```
>>> -2.4.fractionPart
-0.4
```

At `Integer`:

```
>>> 1.fractionPart
0
```

At `Fraction`:

```
>>> -5/4.fractionPart
-1/4
```

At `Complex`:

```
>>> (235 / 47).j(5.3).fractionPart
0j0.3
```

Threads element-wise over lists:

```
>>> [2.4 2.5 2.6].fractionPart
[0.4 0.5 0.6]
```

Plot over a subset of the reals:

~~~spl svg=A
(-2 -- 2).functionPlot(fractionPart:/1)
~~~

![](sw/spl/Help/Image/fractionPart-A.svg)

* * *

See also: integerPart, truncated

References:
_Mathematica_
[1](https://mathworld.wolfram.com/FractionalPart.html)
[2](https://reference.wolfram.com/language/ref/FractionalPart.html),
_Smalltalk_
5.6.2.20

Categories: Truncation, Rounding
