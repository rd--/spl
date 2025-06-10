# hammingWindow

- _hammingWindow(x)_

Answer the Hamming window function at _x_.

```
>>> 0.1.hammingWindow
0.912812
```

Threads over lists, zero at each end-point:

```
>>> [-1 0 1].hammingWindow
[0 1 0]
```

Plot:

~~~spl svg=A
(-0.5 -- 0.5).functionPlot(
	hammingWindow:/1
)
~~~

![](sw/spl/Help/Image/hammingWindow-A.svg)

Discrete Hamming window of length 15:

~~~spl svg=B
(-0.5 -- 0.5).discretize(
	15,
	hammingWindow:/1
).discretePlot
~~~

![](sw/spl/Help/Image/hammingWindow-B.svg)

Frequency response of the Hamming window:

~~~spl svg=C
51.windowTable { :x |
	x.hammingWindow
}.fftPlot(512)
~~~

![](sw/spl/Help/Image/hammingWindow-C.svg)

* * *

See also: hammingWindowTable, hannWindow

Guides: Window Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/HammingFunction.html)
[2](https://reference.wolfram.com/language/ref/HammingWindow.html)

Categories: Windowing
