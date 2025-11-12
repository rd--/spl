# kaiserWindow

- _kaiserWindow(x, alpha=3)_

Answer the Kaiser window function at _x_.

```
>>> 0.1.kaiserWindow(3)
0.9522
```

Threads over lists, zero outside of _(-½,½)_:

```
>>> [-1 -0.5 0 0.5 1].kaiserWindow(3)
[0 0.20488 1 0.20488 0]
```

Plot:

~~~spl svg=A
(-1 -- 1).functionPlot { :x |
	x.kaiserWindow(3)
}
~~~

![](sw/spl/Help/Image/kaiserWindow-A.svg)

Shape of a Kaiser window using a specified parameter:

~~~spl svg=B
(-1 -- 1).functionPlot { :x |
	x.kaiserWindow(4)
}
~~~

![](sw/spl/Help/Image/kaiserWindow-B.svg)

Variation of the shape as a function of the parameter α:

~~~spl svg=C
[-1 1; 0 5].surfacePlot { :x :a |
	x.kaiserWindow(a) * 17
}
~~~

![](sw/spl/Help/Image/kaiserWindow-C.svg)

Discrete Kaiser window of length 15:

~~~spl svg=D
(-0.5 -- 0.5).discretize(
	15,
	{ :x | x.kaiserWindow(3) }
).discretePlot
~~~

![](sw/spl/Help/Image/kaiserWindow-D.svg)

Frequency response of the Kaiser window:

~~~spl svg=E
51.windowTable { :x |
	x.kaiserWindow(2.55)
}.fftPlot(512, 'Centered', 'Logarithmic')
~~~

![](sw/spl/Help/Image/kaiserWindow-E.svg)

* * *

See also: besselI, gaussianWindow, hammingWindow, welchWindow

Guides: Window Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/KaiserWindow.html),
_Mathworks_
[1](https://mathworks.com/help/signal/ref/kaiser.html),
_W_
[1](https://en.wikipedia.org/wiki/Kaiser_window)

Categories: Windowing
