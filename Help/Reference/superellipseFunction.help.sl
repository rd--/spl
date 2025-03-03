# superellipseFunction

- _superellipseFunction(a, b, n)_

A superellipse,
also known as a Lamé curve,
is a closed curve resembling defined by an equation that allows for various shapes between a rectangle and an ellipse.

A four-armed star with concave sides:

~~~spl svg=A
(0 -- 2.pi).functionPlot(
	superellipseFunction(1, 1, 0.5)
)
~~~

![](sw/spl/Help/Image/superellipseFunction-A.svg)

A rhombus:

~~~spl svg=B
(0 -- 2.pi).functionPlot(
	superellipseFunction(1, 1, 1)
)
~~~

![](sw/spl/Help/Image/superellipseFunction-B.svg)

A rhombus with with convex sides:

~~~spl svg=C
(0 -- 2.pi).functionPlot(
	superellipseFunction(1, 1, 3 / 2)
)
~~~

![](sw/spl/Help/Image/superellipseFunction-C.svg)

A circle:

~~~spl svg=D
(0 -- 2.pi).functionPlot(
	superellipseFunction(1, 1, 2)
)
~~~

![](sw/spl/Help/Image/superellipseFunction-D.svg)

A squircle:

~~~spl svg=E
(0 -- 2.pi).functionPlot(
	superellipseFunction(1, 1, 4)
)
~~~

![](sw/spl/Help/Image/superellipseFunction-E.svg)

* * *

See also: Superellipse, superformulaFunction
