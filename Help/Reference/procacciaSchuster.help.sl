# procacciaSchuster

- _procacciaSchuster(x)_

Implement the finite difference equation proposed by I. Procaccia and H. Schuster to generate _1/f_ noise deterministically.

First few terms with initial _x=0.6781_:

~~~spl svg=A
1.procacciaSchuster
.nestList(0.6781, 350)
.linePlot
~~~

![](sw/spl/Help/Image/procacciaSchuster-A.svg)

First few terms with initial _x=0.2314_:

~~~spl svg=B
1.procacciaSchuster
.nestList(0.2314, 350)
.linePlot
~~~

![](sw/spl/Help/Image/procacciaSchuster-B.svg)

Plot spectrum:

~~~spl svg=C
1.procacciaSchuster
.nestList(0.4171, 400)
.spectralPlot
~~~

![](sw/spl/Help/Image/procacciaSchuster-C.svg)

* * *

See also: FractionalBrownianMotionProcess

Guides: Random Number Generators

Further Reading: Procaccia and Schuster 1983
