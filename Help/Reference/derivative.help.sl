# derivative

- _derivative(f:/1, n=1)_

At `exp`:

```
>>> exp:/1.derivative
exp:/1
```

At `sin`:

```
>>> sin:/1.derivative(0)
sin:/1

>>> sin:/1.derivative(1)
cos:/1
```

At `cos`:

```
>>> cos:/1.derivative(0)
cos:/1

>>> cos:/1.derivative(3)
sin:/1
```

Plot derivatives of `sin`:

~~~spl svg=A
(0 -- 3.pi).functionPlot(
	0:3.collect { :n |
		sin:/1.derivative(n)
	}
)
~~~

![](Help/Image/derivative-A.svg)

* * *

See also: Block, cos, sin

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Derivative.html)
[2](https://reference.wolfram.com/language/ref/Derivative.html),
_W_
[1](https://en.wikipedia.org/wiki/Derivative)
