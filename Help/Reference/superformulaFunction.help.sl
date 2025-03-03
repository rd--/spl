# superformulaFunction

- _superformulaFunction(a, b, m, n1, n2, n3)_

The superformula is a generalization of the `Superellipse` proposed by Johan Gielis in 2003.

A sixteen pointed snowflake like curve:

~~~spl svg=A
(0 -- 2.pi).functionPlot(
	superformulaFunction(
		1, 1, 16, 0.5, 0.5, 16
	)
)
~~~

![](sw/spl/Help/Image/superformulaFunction-A.svg)

A pinched rectangular curve:

~~~spl svg=B
(0 -- 2.pi).functionPlot(
	superformulaFunction(
		1, 1, 4, 0.5, 0.5, 4
	)
)
~~~

![](sw/spl/Help/Image/superformulaFunction-B.svg)

A seven pointed blob:

~~~spl svg=C
(0 -- 2.pi).functionPlot(
	superformulaFunction(
		1, 1, 7, 3, 4, 17
	)
)
~~~

![](sw/spl/Help/Image/superformulaFunction-C.svg)

* * *

See also: superellipseFunction

References:
_W_
[1](https://en.wikipedia.org/wiki/Superformula)

Further Reading: Gielis 2003
