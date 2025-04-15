# welchWindow

- _welchWindow(aNumber, alpha=1)_

Answer the _Welch_ window function at _aNumber_ given the parameter α.

Evaluate numerically:

```
>>> 0.1.welchWindow(1)
0.96
```

Threads over lists, zero at each end-point:

```
>>> [-1 0 1].welchWindow(1)
[0 1 0]
```

Plot:

~~~spl svg=A
(-1 -- 1).functionPlot(welchWindow:/1)
~~~

![](sw/spl/Help/Image/welchWindow-A.svg)

Shape of a _Welch_ window using a specified parameter:

~~~spl svg=B
(-1 -- 1).functionPlot { :x |
	x.welchWindow(1.2)
}
~~~

![](sw/spl/Help/Image/welchWindow-B.svg)

Discrete _Welch_ window of length 15:

~~~spl svg=C
(-0.5 -- 0.5).discretize(
	15,
	welchWindow:/1
).discretePlot
~~~

![](sw/spl/Help/Image/welchWindow-C.svg)

* * *

See also: gaussianWindow, hammingWindow, kaiserWindow, welchTable

Guides: Window Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/WelchApodizationFunction.html)
[2](https://reference.wolfram.com/language/ref/WelchWindow.html)

Categories: Windowing
