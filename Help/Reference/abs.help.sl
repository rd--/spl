# abs

- _abs(aNumber)_

Answer a number that is the absolute value (positive magnitude) of _aNumber_.

```
>>> -2.5.abs
2.5

>>> 3.14.abs
3.14

>>> (-2 * 10).abs
20
```

`abs` is defined at `Complex`:

```
>>> 1j1.abs
2.sqrt

>>> 1.4j2.3.abs
2.69258

>>> -2j1.abs
5.sqrt

>>> 3j-4.abs
5
```

`abs` collects over lists:

```
>>> [-2.5 3.141 1.4j2.3 -2j1].abs
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

* * *

See also: absArg, arg, hypot, imaginary, norm, sign, real

References:
_Apl_
[1](https://aplwiki.com/wiki/Magnitude),
_Haskell_
[1](https://hackage.haskell.org/package/base/docs/Prelude.html#v:abs),
_Maple_
[1](https://www.maplesoft.com/support/help/Maple/view.aspx?path=abs),
_Mathematica_
[1](https://mathworld.wolfram.com/AbsoluteValue.html)
[2](https://reference.wolfram.com/language/ref/Abs.html),
_Mathworks_
[1](https://au.mathworks.com/help/matlab/ref/abs.html),
_Smalltalk_
5.6.2.10

Categories: Arithmetic
