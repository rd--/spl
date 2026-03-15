# cubeRoot

- _cubeRoot(n)_

Answer the real-valued cube root of the number _n_.

`cubeRoot` gives a real root:

```
>>> 27.cubeRoot
3

>>> -27.cubeRoot
-3

>>> -3.cube
-27

>>> 27.cubeRoot.negate
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

Numbers that are not cubes,
OEIS [A007412](https://oeis.org/A007412):

```
>>> 1:30.reject { :n |
>>> 	n.cubeRoot.isInteger
>>> }
[
	 2  3  4  5  6  7  9 10 11 12
	13 14 15 16 17 18 19 20 21 22
	23 24 25 26 28 29 30
]
```

Plot over a subset of the reals:

~~~spl svg=A
(-2 -- 2).functionPlot(cubeRoot:/1)
~~~

![](sw/spl/Help/Image/cubeRoot-A.svg)

Least nonnegative integer _k_ such that _xor(n,k)_ is a cube,
OEIS [A330271](https://oeis.org/A330271):

~~~spl svg=B oeis=A330271
0:127.collect { :n |
	0:Infinity.detect { :k |
		n.bitXor(k).cubeRoot.isInteger
	}
}.discretePlot
~~~

![](sw/spl/Help/Image/cubeRoot-B.svg)

* * *

See also: ^, nthRoot, real, sqrt

References:
_Mathematica_
[1](https://mathworld.wolfram.com/CubeRoot.html)
[2](https://reference.wolfram.com/language/ref/CubeRoot.html),
_Tc39_
[1](https://tc39.es/ecma262/multipage/numbers-and-dates.html#sec-math.cbrt)

Categories: Math
