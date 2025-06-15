# trochoid

- _trochoid(a, b)_

A trochoid is the locus of a point at a distance _b_ from the center of a circle of radius _a_ rolling on a fixed line.

+SmallFloat{
	trochoid { :a :b |
		{ :theta |
			let x = (a * theta) - (b * theta.sin);
			let y = a - (b * theta.cos);
			[x, y]
		}
	}
}

Where _a=b_, a cycloid:

~~~svg=A
(0 -- 4.pi).functionPlot(
	trochoid(1, 1)
)
~~~

![](sw/spl/Help/Image/trochoid-A.svg)

Where _b<a_, a curtate cycloid:

~~~svg=B
(0 -- 4.pi).functionPlot(
	trochoid(1, 0.25)
)
~~~

![](sw/spl/Help/Image/trochoid-B.svg)

Where _b>a_, a prolate cycloid:

~~~svg=C
(0 -- 4.pi).functionPlot(
	trochoid(1, 1.25)
)
~~~

![](sw/spl/Help/Image/trochoid-C.svg)

* * *

See also: sphericalTrochoid

Guides: Curve Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Trochoid.html)
[2](https://mathworld.wolfram.com/Cycloid.html)
[3](https://mathworld.wolfram.com/CurtateCycloid.html)
[4](https://mathworld.wolfram.com/ProlateCycloid.html),
_W_
[1](https://en.wikipedia.org/wiki/Trochoid)
