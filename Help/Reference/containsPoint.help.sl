# containsPoint

- _containsPoint(g, p)_

Answer `true` if the geometry _g_ contains the point _p_.

At `Circle`:

```
>>> let c = Circle([0 0], 1);
>>> [0 0; 0.5 0.5; 1 1; 0 1].collect { :p |
>>> 	c.containsPoint(p)
>>> }
[true true false true]
```

The `zero` radius circle contains the centre:

```
>>> let c = [3 7];
>>> Circle(c, 0).containsPoint(c)
true
```

At `Rectangle` and `Polygon`:

```
>>> [
>>> 	[0 0; 10 10].asRectangle,
>>> 	Polygon([0 0; 10 0; 10 10; 0 10])
>>> ].collect { :c |
>>> 	[
>>> 		5 5;
>>> 		5 8;
>>> 		2 2;
>>> 		0 0;
>>> 		10 10;
>>> 		2.5 2.5;
>>> 		0.01 5;
>>> 		2.2 7.4;
>>> 		-10 5;
>>> 		0 5;
>>> 		1E-3 5;
>>> 		10 5;
>>> 		-4 10;
>>> 		8 5;
>>> 		1 2;
>>> 		2 1;
>>> 		11 9;
>>> 		9 11
>>> 	].collect { :p |
>>> 		c.containsPoint(p).boole
>>> 	}
>>> }
[
	1 1 1 1 0 1 1 1 0 1 1 0 0 1 1 1 0 0;
	1 1 1 0 0 1 1 1 0 1 1 0 0 1 1 1 0 0
]
```

* * *

See also: Polygon, Rectangle

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/RegionMember.html)
_W_
[1](https://en.wikipedia.org/wiki/Point_in_polygon)
