# sqrt

- _sqrt(aNumber)_

Answer the number that, multiplied with itself, is _aNumber_.

```
>>> 3.sqrt
1.73205

>>> 7.sqrt
2.64575

>>> 200.sqrt
(10 * 2.sqrt)
```

Negative numbers have imaginary square roots:

```
>>> -9.sqrt
0J3

>>> -25J0.sqrt
0J5
```

At `Complex`:

```
>>> 5J1.sqrt
2.24711J0.22250
```

At `LargeInteger`:

```
>>> 81L.sqrt
9L
```

Threads elementwise over lists and matrices:

```
>>> [0 1.5 0J1 1.pi Infinity].sqrt
[0, 1.22474, -1J0 ^ 0.25, 1.pi.sqrt, Infinity]

>>> [1 4 9 16].sqrt
[1 2 3 4]

>>> 1:4.sqrt
[1 1.4142 1.7321 2]
```

Values at `zero` and infinity:

```
>>> 0.sqrt
0

>>> Infinity.sqrt
Infinity
```

Plot over a subset of the reals:

~~~spl svg=A
(0 -- 10).functionPlot(sqrt:/1)
~~~

![](sw/spl/Help/Image/sqrt-A.svg)

Where supported `sqrt` is displayed as √.

* * *

See also: cubeRoot, nthRoot, squared

References:
_Mathematica_
[1](https://mathworld.wolfram.com/SquareRoot.html)
[2](https://reference.wolfram.com/language/ref/Sqrt.html),
_Smalltalk_
5.6.2.34

Unicode: U+221A √ Square Root

Categories: Math, Operator
