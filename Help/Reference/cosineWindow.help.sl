# cosineWindow

- _cosineWindow(x, alpha=1)_

Answer the cosine window function at _x_ given the parameter α.

Evaluate numerically:

```
>>> 0.1.cosineWindow(1)
0.9511
```

Threads over lists, zero at each end-point:

```
>>> [-1 -0.5 0 0.5 1].cosineWindow(1)
[0 0 1 0 0]
```

Plot:

~~~spl svg=A
(-1 -- 1).functionPlot(cosineWindow:/1)
~~~

![](sw/spl/Help/Image/cosineWindow-A.svg)

Shape of a cosine window using a specified parameter:

~~~spl svg=B
(-1 -- 1).functionPlot { :x |
	x.cosineWindow(3)
}
~~~

![](sw/spl/Help/Image/cosineWindow-B.svg)

Discrete cosine window of length 15:

~~~spl svg=C
(-0.5 -- 0.5).discretize(
	15,
	cosineWindow:/1
).discretePlot
~~~

![](sw/spl/Help/Image/cosineWindow-C.svg)

Frequency response of the cosine window:

~~~spl svg=D
51.windowTable(
	cosineWindow:/1
).fftPlot(512, 'Centred', 'Logarithmic')
~~~

![](sw/spl/Help/Image/cosineWindow-D.svg)

* * *

See also: gaussianWindow, hammingWindow, hannWindow, kaiserWindow, welchWindow

Guides: Window Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/CosineWindow.html)

Categories: Windowing
