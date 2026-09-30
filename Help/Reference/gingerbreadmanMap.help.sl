# gingerbreadmanMap

- _gingerbreadmanMap([x y])_

A two-dimensional piecewise linear map (Devaney 1984).

Evaluate symbolically:

```
>> [`x` `y`].gingerbreadmanMap
[(+ (- 1 y) (abs x)), x]
```

There is a unique orbit of period five:

```
>>> gingerbreadmanMap/1
>>> .nestList([-1 3], 5)
[-1 3; -1 -1; 3 -1; 5 3; 3 5; -1 3]
```

The point _1,1_ has period one:

```
>>> gingerbreadmanMap/1
>>> .nestList([1 1], 1)
[1 1; 1 1]
```

Interior hexagon:

```
>>> gingerbreadmanMap/1
>>> .nestList([0 0], 6)
[0 0; 1 0; 2 1; 2 2; 1 2; 0 1; 0 0]
```

Plot five- and six-orbits:

~~~spl svg=A
[-1 3; 0 0; 0.5 0.5; 0.75 0.75]
.collect { :v |
	gingerbreadmanMap/1
	.nestList(v, 6)
	.findRepeat
	.Polygon
}.LineDrawing
~~~

![](Help/Image/gingerbreadmanMap-A.svg)

Plot initial terms of orbit of seven randomly selected initial conditions:

~~~spl svg=B
Sfc32(326184)
.randomReal([-2.5 8], [7 2])
.collect { :v |
	gingerbreadmanMap/1
	.nestList(v, 35)
}.catenate.scatterPlot
~~~

![](Help/Image/gingerbreadmanMap-B.svg)

* * *

See also: henonMap

Guides: Chaotic Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/GingerbreadmanMap.html),
_W_
[1](https://en.wikipedia.org/wiki/Gingerbreadman_map)

Further Reading: Devaney (1984, 1992)
