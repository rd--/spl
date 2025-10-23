# oloid

- _oloid(n)_

Answer a `Polyhedron` of _n_ faces approximating an oloid.

Calculate volume,
OEIS [A215447](https://oeis.org/A215447):

```
>>> let r = 1;
>>> let a = 0.75.ellipticK;
>>> let b = 0.75.ellipticE;
>>> 2/3 * (a + (2 * b)) * r.cube
3.052418
```

Drawing of a small face count oloid:

~~~spl svg=A
32.oloid
~~~

![](sw/spl/Help/Image/oloid-A.svg)

Plot the decimal expansion of the Oloid’s volume:

~~~spl svg=B
[
	3 0 5 2 4 1 8 4 6 8 4 2 4 3 7 4 8 5 6 6
	9 7 2 0 0 5 3 1 9 3 2 1 8 6 2 5 4 5 6 8
	3 9 3 2 1 0 6 4 2 9 8 3 7 1 1 0 9 0 4 9
	2 0 0 3 0 7 7 6 6 1 2 0 3 8 0 7 5 2 9 5
	4 9 8 0 5 5 4 5 4 0 8 4 2 6 5 6 1 2 5 4
	7 8 4 1 8
].scatterPlot
~~~

![](sw/spl/Help/Image/oloid-B.svg)

* * *

See also: Polyhedron

Guides: Geometry Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Oloid.html),
_OEIS_
[1](https://oeis.org/A215447),
_W_
[1](https://en.wikipedia.org/wiki/Oloid)
