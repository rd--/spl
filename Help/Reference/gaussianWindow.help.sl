# gaussianWindow

- _gaussianWindow(x, σ=0.3)_

Answer the Gaussian window function at the number _x_.

```
>>> 0.1.gaussianWindow(0.3)
0.945959
```

Threads over lists, zero at each end-point:

```
>>> [-1 0 1].gaussianWindow(0.3)
[0 1 0]
```

Plot, the unary form sets σ to 0.3:

~~~spl svg=A
(-1 -- 1).functionPlot(
	gaussianWindow:/1
)
~~~

![](sw/spl/Help/Image/gaussianWindow-A.svg)

Shape of a Gaussian window using a specified parameter:

~~~spl svg=B
(-1 -- 1).functionPlot { :x |
	x.gaussianWindow(0.2)
}
~~~

![](sw/spl/Help/Image/gaussianWindow-B.svg)

Discrete Gaussian window of length 15:

~~~spl svg=C
(-0.5 -- 0.5)
.discretize(15, gaussianWindow:/1)
.discretePlot
~~~

![](sw/spl/Help/Image/gaussianWindow-C.svg)

The `fft` of the Gaussian window is Gaussian:

~~~spl svg=D
let n = 64;
(-0.5 -- 1.5)
.discretize(n) { :x |
	x.gaussianWindow(3 / n)
}
.fft
.rotatedRight(n // 2)
.abs
.discretePlot
~~~

![](sw/spl/Help/Image/gaussianWindow-D.svg)

Frequency response of the Gaussian window:

~~~spl svg=E
51.windowTable { :x |
	x.gaussianWindow(0.135)
}.fftPlot(512, 'Centred', 'Logarithmic')
~~~

![](sw/spl/Help/Image/gaussianWindow-E.svg)

* * *

See also: bartlettWindow, blackmanWindow, dirichletWindow, hammingWindow, hannWindow, welchWindow

Guides: Window Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/GaussianFunction.html)
[2](https://reference.wolfram.com/language/ref/GaussianWindow.html),
_Mathworks_
[1](https://au.mathworks.com/help/signal/ref/gausswin.html),
_Python_
[1](https://docs.scipy.org/doc/scipy/reference/generated/scipy.signal.windows.gaussian.html)

Categories: Windowing
