# hilbertCurve

- _hilbertCurve(n)_

Answer the line segments representing the _n_-th step Hilbert curve.

The 1st step of the Hilbert curve:

```
>>> 1.hilbertCurve
[0 0; 0 1; 1 1; 1 0]
```

The 2nd step of the Hilbert curve:

```
>>> 2.hilbertCurve
[
	0 0; 1 0; 1 1; 0 1;
	0 2; 0 3; 1 3; 1 2;
	2 2; 2 3; 3 3; 3 2;
	3 1; 2 1; 2 0; 3 0
]
```

Lengths of successive approximations to the Hilbert curve:

```
>>> 1:5.collect { :n |
>>> 	n.hilbertCurve.size
>>> }
[4 16 64 256 1024]
```

Drawing of the 4th step of the Hilbert curve:

~~~spl svg=A
4.hilbertCurve.asLineDrawing
~~~

![](sw/spl/Help/Image/hilbertCurve-A.svg)

Drawing of the 5th step of the Hilbert curve:

~~~spl svg=B
5.hilbertCurve.asLineDrawing
~~~

![](sw/spl/Help/Image/hilbertCurve-B.svg)

* * *

See also: angleVector, peanoCurve, substitutionSystem

Guides: Curve Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/HilbertCurve.html),
_W_
[1](https://en.wikipedia.org/wiki/Hilbert_curve)
