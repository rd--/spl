# kaiserWindow

- _kaiserWindow(aNumber, alpha=3)_

Answer the _Kaiser_ window function at _aNumber_.

```
>>> 0.1.kaiserWindow(3)
0.9522
```

Plot:

~~~spl svg=A
(-1 -- 1).functionPlot { :x |
	x.kaiserWindow(3)
}
~~~

![](sw/spl/Help/Image/kaiserWindow-A.svg)

Shape of a _Kaiser_ window using a specified parameter:

~~~spl svg=B
(-1 -- 1).functionPlot { :x |
	x.kaiserWindow(4)
}
~~~

![](sw/spl/Help/Image/kaiserWindow-B.svg)

Variation of the shape as a function of the parameter α:

~~~spl svg=C
let k = 23;
{ :x :a |
	x.kaiserWindow(a) * 8
}.table(
	(-1 -- 1).subdivide(k),
	(0 -- 5).subdivide(k)
).surfacePlot
~~~

![](sw/spl/Help/Image/kaiserWindow-C.svg)

Discrete _Kaiser_ window of length 15:

~~~spl svg=D
(-0.5 -- 0.5).discretize(
	15,
	{ :x | x.kaiserWindow(3) }
).discretePlot
~~~

![](sw/spl/Help/Image/kaiserWindow-D.svg)

* * *

See also: besselI, gaussianWindow, hammingWindow, welchWindow

Guides: Window Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/KaiserWindow.html),
_Mathworks_
[1](https://mathworks.com/help/signal/ref/kaiser.html)

Categories: Windowing
