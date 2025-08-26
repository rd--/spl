# circleInversion

- _circleInversion(x, c)_

Answer the inversion of _x_ given the reference circle _c_.

At `List`, invert a point:

```
>>> let c = Circle([0 0], 1);
>>> let u = [2 2];
>>> let v = u.circleInversion(c);
>>> (v, v.circleInversion(c))
([0.25 0.25], [2 2])
```

A point on the circumference of the inversion circle is its own inverse point:

```
>>> [1 0].circleInversion(Circle([0 0], 1))
[1 0]
```

At `Circle`, invert a circle to another circle:

```
>>> let c = Circle([0 0], 1);
>>> let u = Circle([2 2], 1);
>>> u.circleInversion(c)
Circle([2/7 2/7], 1/7)
```

The inverse of a circle is a line if the original circle contains the center of inversion:

```
>>> let c = Circle([0 0], 1);
>>> let u = Circle([2 2], 2 * 2.sqrt);
>>> u.circleInversion(c)
InfiniteLine([0.125 0.125], [-0.7071 -0.7071])
```

Orthogonal circles are invariant under inversion with respect to each other:

```
>>> Circle([5 0], 4)
>>> .circleInversion(Circle([0 0], 3))
Circle([5 0], 4)
```

Draw circle inversion of a point:

~~~spl svg=A
let c = Circle([0 0], 1);
let p = [0.35 0.35];
let q = p.circleInversion(c);
[
	c,
	[p q].PointCloud,
	[p q].Line
].LineDrawing
~~~

![](sw/spl/Help/Image/circleInversion-A.svg)

Draw circle inversion of a circle:

~~~spl svg=B
let a = Circle([0 0], 1.75);
let b = Circle([2 2], 1.35);
let c = b.circleInversion(a);
let p = a.center;
let q = b.center;
let r = c.center;
[
	a,
	b,
	c,
	[p q r].PointCloud,
	[p q].Line
].LineDrawing
~~~

![](sw/spl/Help/Image/circleInversion-B.svg)

Inversion with respect to a circle does not map the center of the circle to the center of its image:

~~~spl svg=C
let a = Circle([0 0], 1.75);
let b = [0.15 0.25 0.35 0.45].collect { :r |
	Circle([0.75 0.75], r)
};
[
	a,
	b,
	b.collect { :x |
		x.circleInversion(a)
	}
].LineDrawing
~~~

![](sw/spl/Help/Image/circleInversion-C.svg)

Orthogonal circles are invariant under inversion with respect to each other,
however points exchange places:

~~~spl svg=D
let a = Circle([5 0], 4);
let b = Circle([0 0], 3);
let c = a.circleInversion(b);
let p = (-3 / 2.sqrt) # 2;
let q = p.circleInversion(a);
let r = a.center;
[
	b,
	c,
	[p q].PointCloud,
	[p q r].Line
].LineDrawing
~~~

![](sw/spl/Help/Image/circleInversion-D.svg)

* * *

See also: Circle, circlePower, isOrthogonalCircle

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Inversion.html),
_W_
[1](https://en.wikipedia.org/wiki/Circle_inversion)
