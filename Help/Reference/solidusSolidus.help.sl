# // (solidusSolidus)

- _aNumber // anotherNumber_

Operator form of `quotient`.

```
>>> -9 // 4
-2

>>> -5 // 3
-1

>>> 5 // 2
2

>>> -0.9 // 0.4
-2

>>> 10E4 // 985
101

>>> -8 // 7
-1
```

Threads over lists:

```
>>> [-5 .. 5] // 3
[-1 -1 -1 -0 -0 0 0 0 1 1 1]

>>> [7 7 -7 -7] // [3 -3 3 -3]
[2 -2 -2 2]
```

Plot the Ulam spiral of the quotient:

~~~spl png=A
(99.ulamSpiralMatrix % 1185 / 1185).Graymap
~~~

![](sw/spl/Help/Image/solidusSolidus-A.png)

Where supported `//` is displayed as ⫽.

The name of this operator is `solidusSolidus`.

* * *

See also: /, quotient, remainder

References:
_Julia_
[1](https://docs.julialang.org/en/v1/base/math/#Base.div),
_Mathematica_
[1](https://mathworld.wolfram.com/IntegerDivision.html)
[2](https://mathworld.wolfram.com/Quotient.html)
[3](https://reference.wolfram.com/language/ref/Quotient.html),
_Mathworks_
[1](https://mathworks.com/help/symbolic/sym.quorem.html),
_Smalltalk_
5.6.2.5

Unicode: U+0002F / Solidus, U+02AFD ⫽ Double Solidus Operator

Categories: Math, Operator
