# Annulus

- _Annulus([x y …], [r₁ r₂])_

A `Type` that represents an annulus between circles of radii _r_ at center _(x,y)_.

The standard annulus:

```
>>> Annulus([0 0], [0.5 1]).area
3/4.pi
```

Draw the standard annulus:

~~~spl svg=A
Annulus([0 0], [0.5 1])
~~~

![](sw/spl/Help/Image/Annulus-A.svg)

A family of annuli:

~~~spl svg=B
let n = 13;
1:n.collect { :t |
	let x = (2.pi * t / n).cos;
	let y = (2.pi * t / n).sin;
	let r = 1;
	Annulus([x y], [0.9 1])
}.LineDrawing
~~~

![](sw/spl/Help/Image/Annulus-B.svg)

* * *

See also: AnnulusSector, Arc, Circle

Guides: Geometry Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Annulus.html)
[2](https://reference.wolfram.com/language/ref/Annulus.html),
_W_
[1](https://en.wikipedia.org/wiki/Annulus_(mathematics))

