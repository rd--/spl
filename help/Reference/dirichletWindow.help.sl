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
Interval(-1, 1).discretize(1024, dirichletWindow:/1).plot
~~~

Discrete _Dirichlet window_ of length 15:

~~~
Interval(-0.5, 0.5).discretize(15, dirichletWindow:/1).plot
~~~

* * *

See also: Window Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/DirichletWindow.html)
