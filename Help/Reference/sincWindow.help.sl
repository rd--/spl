# sincWindow

- _sincWindow(x, alpha=1)_

Answer the sinc window function at _x_.

```
>>> 0.1.sincWindow(1)
0.935489

>>> 0.1.sincWindow(3)
0.50455
```

Threads over lists, zero outside of _(-½,½)_:

```
>>> [-1 -0.5 0 0.5 1].sincWindow(1)
[0 0 1 0 0]
```

Plot:

~~~spl svg=A
(-0.5 -- 0.5).functionPlot { :x |
	x.sincWindow(1)
}
~~~

![](sw/spl/Help/Image/sincWindow-A.svg)

Shape of a sinc window using a specified parameter:

~~~spl svg=B
(-0.5 -- 0.5).functionPlot { :x |
	x.sincWindow(3)
}
~~~

![](sw/spl/Help/Image/sincWindow-B.svg)

Discrete sinc window of length 15:

~~~spl svg=C
(-0.5 -- 0.5).discretize(
	15,
	{ :x | x.sincWindow(2) }
).discretePlot
~~~

![](sw/spl/Help/Image/sincWindow-C.svg)

Frequency response of the sinc window:

~~~spl svg=D
51.windowTable { :x |
	x.sincWindow(2)
}.fftPlot(512, 'Centred', 'Logarithmic')
~~~

![](sw/spl/Help/Image/sincWindow-D.svg)

* * *

See also: besselI, gaussianWindow, hammingWindow, welchWindow

Guides: Window Functions

Categories: Windowing
