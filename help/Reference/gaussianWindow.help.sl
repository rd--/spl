# gaussianWindow

- _gaussianWindow(aNumber, sigma)_

Answer the _Gaussian_ window function at _aNumber_.

```
>>> 0.1.gaussianWindow
0.945959
```

Plot:

~~~
(-1 -- 1).functionPlot(gaussianWindow:/1)
~~~

Shape of a _Gaussian_ window using a specified parameter:

~~~
(-1 -- 1).functionPlot { :x | x.gaussianWindow(0.2) }
~~~

Discrete _Gaussian_ window of length 15:

~~~
(-0.5 -- 0.5).discretize(15, gaussianWindow:/1).discretePlot
~~~

* * *

See also: bartlettWindow, blackmanWindow, dirichletWindow, hammingWindow, hannWindow, welchWindow

Guides: Window Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/GaussianFunction.html)
[2](https://reference.wolfram.com/language/ref/GaussianWindow.html)

Categories: Windowing
