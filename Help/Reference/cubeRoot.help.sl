# cubeRoot

- _cubeRoot(n)_

Answer the real-valued cube root of the number _n_.

`cubeRoot` gives a real root:

```
>>> 27.cubeRoot
3

>>> -27.cubeRoot
-3

>>> -3.cubed
-27

>>> 27.cubeRoot.negated
-3

>>> 27 ^ (1 / 3)
3

>>> -8.cubeRoot
-2

>>> -4.5.cubeRoot
-1.65096

>>> 128.cubeRoot
5.03968
```

Values at `zero` & `inf`:

```
>>> 0.cubeRoot
0

>>> Infinity.cubeRoot
Infinity
```

Threads over lists:

```
>>> [1 8 27 64].cubeRoot
[1 2 3 4]
```

Plot over a subset of the reals:

~~~spl svg=A
(-2 -- 2).functionPlot(cubeRoot:/1)
~~~

![](sw/spl/Help/Image/cubeRoot-A.svg)

* * *

See also: ^, nthRoot, real, sqrt

References:
_Mathematica_
[1](https://mathworld.wolfram.com/CubeRoot.html)
[2](https://reference.wolfram.com/language/ref/CubeRoot.html),
_Tc39_
[1](https://tc39.es/ecma262/multipage/numbers-and-dates.html#sec-math.cbrt)

Categories: Math
