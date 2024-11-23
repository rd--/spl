# cubeRoot

- _cubeRoot(aNumber)_

Answer the real-valued cube root of _aNumber_.

CubeRoot gives a real root:

```
>>> -27.cubeRoot
-3

>>> -4.5.cubeRoot
-1.65096

>>> 128.cubeRoot
5.03968
```

Values at `zero` & `inf`:

```
>>> 0.cubeRoot
0

>>> inf.cubeRoot
inf
```

Plot over a subset of the reals:

~~~
(-2 -- 2).functionPlot(cubeRoot:/1)
~~~

* * *

See also: ^, nthRoot, sqrt

References:
_Mathematica_
[1](https://mathworld.wolfram.com/CubeRoot.html)
[2](https://reference.wolfram.com/language/ref/CubeRoot.html)
