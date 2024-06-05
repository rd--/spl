# linePlot

- _linePlot(aList)_

Plot a list of _y_ values:

~~~
[1 1 2 3 5 8].linePlot
~~~

Plot a list of _x,y_ pairs:

~~~
(0, 3 .. 21).collect { :k |
	[(k * 2.pi / 7).cos, (k * 2.pi / 7).sin]
}.linePlot
~~~

* * *

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/ListLinePlot.html)
