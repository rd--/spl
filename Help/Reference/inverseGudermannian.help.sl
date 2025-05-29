# inverseGudermannian

- _inverseGudermannian(z)_

Answer the inverse Gudermannian function of _z_.

Evaluate numerically:

```
>>> 0.5.inverseGudermannian
0.5222
```

Plot over a subset of the reals:

~~~spl svg=A
(-0.5.pi -- 0.5.pi).functionPlot(
	inverseGudermannian:/1
	.clip([-4 4])
)
~~~

![](sw/spl/Help/Image/inverseGudermannian-A.svg)

* * *

See also: gudermannian, log, tan

References:
_Mathematica_
[1](https://mathworld.wolfram.com/InverseGudermannian.html)
[2](https://reference.wolfram.com/language/ref/InverseGudermannian.html)
_W_
[1](https://en.wikipedia.org/wiki/Gudermannian_function)
