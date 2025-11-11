# abs

- _abs(z)_

Answer a number that is the absolute value,
or positive magnitude,
of the number _z_.

```
>>> 2.abs
2

>>> -2.5.abs
2.5

>>> 3.14.abs
3.14

>>> (-2 * 10).abs
20
```

`abs` is defined at `Complex`,
where it is also called the complex modulus or `norm`:

```
>>> (1J1.abs, 1J1.norm)
(2.sqrt, 2.sqrt)

>>> (1.4J2.3.abs, 1.4J2.3.norm)
(2.69258, 2.69258)

>>> (-2J1.abs, -2J1.norm)
(5.sqrt, 5.sqrt)

>>> (3J-4.abs, 3J-4.norm)
(5, 5)
```

`abs` collects over lists:

```
>>> [-2.5 3.141 1.4J2.3 -2J1].abs
[2.5 3.141 2.69258 2.23607]
```

`abs` collects over matrices:

```
>>> [1 -2 3; -4 5 -6].abs
[1 2 3; 4 5 6]
```

Plot over a subset of the reals:

~~~spl svg=A
(-3 -- 3).functionPlot(abs:/1)
~~~

![](sw/spl/Help/Image/abs-A.svg)

Plot _|1 + x|_:

~~~spl svg=B
(-2 -- 4).functionPlot(abs:/1)
~~~

![](sw/spl/Help/Image/abs-B.svg)

Plot `abs` at Gaussian integers:

~~~spl png=C
{ :x :y |
	x.j(y).abs.round % 2
}.table(-36:36, -36:36).Bitmap
~~~

![](sw/spl/Help/Image/abs-C.png)

* * *

See also: absArg, arg, hypot, imaginary, norm, sign, real

Guides: Complex Number Functions

References:
_Apl_
[1](https://aplwiki.com/wiki/Magnitude),
_Haskell_
[1](https://hackage.haskell.org/package/base/docs/Prelude.html#v:abs),
_Maple_
[1](https://www.maplesoft.com/support/help/Maple/view.aspx?path=abs),
_Mathematica_
[1](https://mathworld.wolfram.com/AbsoluteValue.html)
[2](https://mathworld.wolfram.com/ComplexModulus.html)
[3](https://reference.wolfram.com/language/ref/Abs.html)
[4](https://reference.wolfram.com/language/ref/RealAbs.html),
_Mathworks_
[1](https://mathworks.com/help/matlab/ref/abs.html),
_Smalltalk_
5.6.2.10,
_W_
[1](https://en.wikipedia.org/wiki/Absolute_value)

Categories: Arithmetic
