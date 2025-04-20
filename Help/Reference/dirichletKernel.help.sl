# dirichletKernel

- _dirichletKernel(n)_

Answer the _n_-th Dirichlet kernel function of _x_.

Plot kernels for _n_ of one, three and five:

~~~spl svg=A
(-1.pi -- 1.pi).functionPlot(
	[1 3 5].collect(
		dirichletKernel:/1
	)
)
~~~

![](sw/spl/Help/Image/dirichletKernel-A.svg)

* * *

See also: fejerKernel, lanczosKernel, sin

References:
_Mathematica_
[1](https://mathworld.wolfram.com/DirichletKernel.html),
_Mathworks_
[1](https://au.mathworks.com/help/signal/ref/diric.html),
_W_
[1](https://en.wikipedia.org/wiki/Dirichlet_kernel)
