# dirichletWindow

- _dirichletWindow(aNumber)_

Answer the _Dirichlet window_ function at _aNumber_.
The _Dirichlet window_ is rectangular.

```
>>> 0.1.dirichletWindow
1
```

Plot:

~~~
(-1 -- 1).functionPlot(dirichletWindow:/1)
~~~

Discrete _Dirichlet window_ of length 15:

~~~
(-0.5 -- 0.5).discretize(15, dirichletWindow:/1).discretePlot
~~~

* * *

See also: gaussianWindow

Guides: Window Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/DirichletWindow.html)

Categories: Windowing
