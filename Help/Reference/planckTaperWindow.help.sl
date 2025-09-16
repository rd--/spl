# planckTaperWindow

- _planckTaperWindow(x, ε)_

Answer the PlanckTaper window function at _x_.
ε is the fraction of the window width over which the window function smoothly rises or falls.

At specific value:

```
>>> 0.45.planckTaperWindow(1 / 3)
0.00411
```

Threads over lists, zero at each end-point:

```
>>> [-1 -0.5 0 0.5 1].planckTaperWindow(1 / 3)
[0 0 1 0 0]
```

Shape of a Planck-taper window using specified parameters for ε:

~~~spl svg=A
(-1 -- 1).functionPlot(
	(1 / [10 3 2]).collect { :e |
		{ :x |
			x.planckTaperWindow(e)
		}
	}
)
~~~

![](sw/spl/Help/Image/planckTaperWindow-A.svg)

Discrete Planck-taper window of length 15:

~~~spl svg=B
(-0.5 -- 0.5)
.discretize(15) { :x |
	x.planckTaperWindow(0.5)
}.discretePlot
~~~

![](sw/spl/Help/Image/planckTaperWindow-B.svg)

Frequency response of the Planck-taper window:

~~~spl svg=C
51.windowTable { :x |
	x.planckTaperWindow(1 / 10)
}.fftPlot(512, 'Centred', 'Logarithmic')
~~~

![](sw/spl/Help/Image/planckTaperWindow-C.svg)

* * *

See also: tukeyWindow

Guides: Window Functions

Categories: Windowing
