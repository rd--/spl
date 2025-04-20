# lanczosKernel

- _lanczosKernel(a)_

Answer the Lanczos kernel function for parameter _a_.

Plot kernels for _a_ of one, two and three:

~~~spl svg=A
(-1.pi -- 1.pi).functionPlot(
	[1 2 3].collect(
		lanczosKernel:/1
	)
)
~~~

![](sw/spl/Help/Image/lanczosKernel-A.svg)

* * *

See also: lanczosWindow

Guides: Window Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Lanczos_resampling)
