# peanoCurve

- _peanoCurve(anInteger)_

Answer the line segments representing the _anInteger_-th step Peano curve.

The 1st step of the Peano curve:

```
>>> 1.peanoCurve
[0 0; 1 0; 2 0; 2 1; 1 1; 0 1; 0 2; 1 2; 2 2]
```

Lengths of successive approximations to the Peano curve:

```
>>> 1:3.collect { :n |
>>> 	n.peanoCurve.size
>>> }
[9 81 729]
```

Drawing of the 2nd step of the Peano curve:

~~~spl svg=A
2.peanoCurve.asLineDrawing
~~~

![](sw/spl/Help/Image/peanoCurve-A.svg)

Drawing of the 3rd step of the Peano curve:

~~~spl svg=B
3.peanoCurve.asLineDrawing
~~~

![](sw/spl/Help/Image/peanoCurve-B.svg)

* * *

See also: angleVector, hilbertCurve, sierpinskiCurve, substitutionSystem

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/PeanoCurve.html),
_W_
[1](https://en.wikipedia.org/wiki/Peano_curve)
