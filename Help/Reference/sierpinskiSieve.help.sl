# sierpinskiSieve

- _sierpinskiSieve(n)_

Answer the line segments representing the _n_-th step Sierpiński sieve,
also called the Sierpiński triangle and the Sierpiński gasket.

Lengths of successive approximations to the Sierpiński sieve:

```
>>> 1:3.collect { :n |
>>> 	n.sierpinskiSieve.size
>>> }
[19 55 163]
```

Drawing of the 3rd step of the Sierpiński sieve:

~~~spl svg=A
3.sierpinskiSieve.Line
~~~

![](sw/spl/Help/Image/sierpinskiSieve-A.svg)

Drawing of the 4th step of the Sierpiński sieve:

~~~spl svg=B
4.sierpinskiSieve.Line
~~~

![](sw/spl/Help/Image/sierpinskiSieve-B.svg)

* * *

See also: sierpinskiCurve, substitutionSystem

Guides: Curve Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/SierpinskiSieve.html)
[2](https://reference.wolfram.com/language/ref/SierpinskiMesh.html),
_Riddle_
[1](https://larryriddle.agnesscott.org/ifs/carpet/boxfractal.htm),
_W_
[1](https://en.wikipedia.org/wiki/Sierpi%C5%84ski_triangle)
