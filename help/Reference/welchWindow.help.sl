# welchWindow

- _welchWindow(aNumber, alpha)_

Answer the _Welch_ window function at _aNumber_.

```
>>> 0.1.welchWindow(1)
0.96
```

Plot:

~~~
(-0.5 -- 0.5).functionPlot(welchWindow:/1)
~~~

Shape of a _Welch_ window using a specified parameter:

~~~
(-1 -- 1).functionPlot { :x | x.welchWindow(1.2) }
~~~

Discrete _Welch_ window of length 15:

~~~
(-0.5 -- 0.5).discretize(15, welchWindow:/1).discretePlot
~~~

* * *

See also: welchTable, Window Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/WelchApodizationFunction.html)
[2](https://reference.wolfram.com/language/ref/WelchWindow.html)
