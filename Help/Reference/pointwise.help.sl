# pointwise

- _pointwise(f:/2, p:/1, q:/1)_

Answer a unary `Block` over _x_ that implements _f(p(x),q(x))_.

Plot pointwise sum and product of `sin` and `log`:

~~~spl svg=A
(0 -- 13.75).functionPlot(
	[
		+.pointwise(sin:/1, log:/1),
		*.pointwise(sin:/1, log:/1)
	]
)
~~~

![](Help/Image/pointwise-A.svg)

* * *

See also: Block, bind, compose, constant
