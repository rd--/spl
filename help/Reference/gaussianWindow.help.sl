# gaussianWindow

- _gaussianWindow(aNumber, sigma)_

Answer the _Gaussian_ window function at _aNumber_.

```
>>> 0.1.gaussianWindow
0.945959
```

Plot:

~~~
(-1 -- 1).discretize(1024, gaussianWindow:/1).plot
~~~

Shape of a _Gaussian_ window using a specified parameter:

~~~
(-1 -- 1).discretize(1024).gaussianWindow(0.2).plot
~~~

Discrete _Gaussian_ window of length 15:

~~~
(-0.5 -- 0.5).discretize(15, gaussianWindow:/1).plot
~~~

* * *

See also: Window Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/GaussianFunction.html)
[2](https://reference.wolfram.com/language/ref/GaussianWindow.html)
