# bakersMap

- _bakersMap(a, b=a)_

Implement the Baker’s map.

Plot with _a=b=1.1_:

~~~spl svg=A
bakersMap(1.1)
.nestList([0.4132 0.5872], 50)
.transpose
.linePlot
~~~

![](sw/spl/Help/Image/bakersMap-A.svg)

Plot with _a=b=0.947_:

~~~spl svg=B
bakersMap(0.947)
.nestList([0.4783 0.1847], 50)
.transpose
.linePlot
~~~

![](sw/spl/Help/Image/bakersMap-B.svg)

* * *

See also: tentMap

Guides: Chaotic Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/BakersMap.html),
_W_
[1](https://en.wikipedia.org/wiki/Baker%27s_map)
