# heavisideLambda

- _heavisideLambda(x)_

Represents the triangle distribution Λ which is nonzero for _|x|<1_.

Evaluate numerically:

```
>>> -0.2.heavisideLambda
0.8

>>> 0.8.heavisideLambda
0.2

>>> [-1 1/4].collect(heavisideLambda:/1)
[0 3/4]
```

Plot in one dimension:

~~~spl svg=A
(-2 -- 2).functionPlot(
	heavisideLambda:/1
)
~~~

![](sw/spl/Help/Image/heavisideLambda-A.svg)

Plot a function involving `heavisideLambda`:

~~~spl svg=B
(0 -- 1).functionPlot { :x |
	x.tanh * (3 * x - 1).heavisideLambda
}
~~~

![](sw/spl/Help/Image/heavisideLambda-B.svg)

* * *

See also: convolve, diracDelta, heavisidePi, heavisideTheta, triangleWave, unitTriangle

References:
_Mathematica_
[1](https://mathworld.wolfram.com/LambdaFunction.html)
[2](https://reference.wolfram.com/language/ref/HeavisideLambda.html),
_W_
[1](https://simple.wikipedia.org/wiki/Heaviside_function)
[2](https://en.wikipedia.org/wiki/Heaviside_step_function)
