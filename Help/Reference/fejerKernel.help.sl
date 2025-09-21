# fejerKernel

- _fejerKernel(n)_

Answer the _n_-th Fejer kernel function of _x_.

Plot kernels for _n_ of two, four and six:

~~~spl svg=A
(-1.pi -- 1.pi).functionPlot(
	[2 4 6].collect(
		fejerKernel:/1
	)
)
~~~

![](sw/spl/Help/Image/fejerKernel-A.svg)

* * *

See also: dirichletKernel, lanczosKernel, sin

Guides: Window Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/FejersIntegral.html),
_W_
[1](https://en.wikipedia.org/wiki/Fejér_kernel)
