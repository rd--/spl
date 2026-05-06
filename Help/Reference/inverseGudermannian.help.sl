# inverseGudermannian

- _inverseGudermannian(z)_

Answer the inverse Gudermannian function of _z_.

Evaluate numerically:

```
>>> 0.5.inverseGudermannian
0.5222

>>> 0.46.inverseGudermannian
0.477137

>>> (4 / 3).inverseGudermannian
2.126176

>>> 1.111111.inverseGudermannian
1.452531

>>> 0.9.inverseGudermannian
1.053923
```

At `Complex`:

```
>>> (5 + 1.pi.i).inverseGudermannian
-0.0829127J1.54624

>>> 0.726205.inverseGudermannian
0.8
```

Threads over lists:

```
>>> [0.1 -0.1; 0 0.2].inverseGudermannian
[0.100167 -0.100167; 0 0.201347]
```

At `zero`:

```
>>> 0.inverseGudermannian
0
```

Plot over a subset of the reals:

~~~spl svg=A
(-0.45.pi -- 0.45.pi).functionPlot(
	inverseGudermannian:/1
	.clip([-4 4])
)
~~~

0.5.pi.inverseGudermannian

![](Help/Image/inverseGudermannian-A.svg)

* * *

See also: gudermannian, log, tan

Guides: Hyperbolic Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/InverseGudermannian.html)
[2](https://reference.wolfram.com/language/ref/InverseGudermannian.html)
_W_
[1](https://en.wikipedia.org/wiki/Gudermannian_function)
