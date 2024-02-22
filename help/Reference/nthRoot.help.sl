# nthRoot

- _nthRoot(x, n)_

Answer the real-valued _n_-th root of _x_.

```
>>> -32.nthRoot(5)
-2

>>> -2 ^ 5
-32

>>> 5.nthRoot(3)
1.70998

>>> 1.70998 ^ 3
5

>>> 2.nthRoot(8)
1.09051

>>> 1.09051 ^ 8
2
```

Note that this is not the same as _x ^ (1 / n)_.

```
>>> -4.5.nthRoot(3)
-1.65096

>>> -4.5j0 ^ (1 / 3)
0.82548j1.42978
```

Threads elementwise over lists and matrices:

```
>>> [0 1.5 8 inf].nthRoot(3)
[0 1.14471 2 inf]

>>> [2 3 6].collect { :n | 729.nthRoot(n) }
[27 9 3]
```

Plot over a subset of the reals:

~~~
(-1, -0.99 .. 1).collect { :x | x.nthRoot(3) }.plot
~~~

* * *

See also: ^, sqrt, cubeRoot

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Surd.html)
[2](https://reference.wolfram.com/language/ref/Surd.html)
