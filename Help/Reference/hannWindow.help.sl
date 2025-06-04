# hannWindow

- _hannWindow(x)_

Answer the _Hann_ window function at the number _x_,
also known as the raised cosine window.

At specific values:

```
>>> 0.1.hannWindow(0.5)
0.904508
```

Threads over lists, zero at each end-point:

```
>>> [-1 0 1].hannWindow
[0 1 0]
```

Plot:

~~~spl svg=A
(-0.5 -- 0.5).functionPlot(
	hannWindow:/1
)
~~~

![](sw/spl/Help/Image/hannWindow-A.svg)

Discrete _Hann_ window of length 15:

~~~spl svg=B
(-0.5 -- 0.5).discretize(
	15,
	hannWindow:/1
).discretePlot
~~~

![](sw/spl/Help/Image/hannWindow-B.svg)

* * *

See also: hammingTable, hammingWindow

Guides: Window Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/HanningFunction.html)
[2](https://reference.wolfram.com/language/ref/HannWindow.html),
_W_
[1](https://en.wikipedia.org/wiki/Hann_function)

Categories: Windowing
