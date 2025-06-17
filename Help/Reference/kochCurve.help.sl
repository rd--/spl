# kochCurve

- _kochCurve(n)_

Answer the line segments representing the _n_-th step Koch curve.

Lengths of successive approximations to the Koch curve:

```
>>> 1:4.collect { :n |
>>> 	n.kochCurve.size
>>> }
[5 17 65 257]
```

Drawing of the 4th step of the Koch curve:

~~~spl svg=A
4.kochCurve.Line
~~~

![](sw/spl/Help/Image/kochCurve-A.svg)

Drawing of the 5th step of the Koch curve:

~~~spl svg=B
5.kochCurve.Line
~~~

![](sw/spl/Help/Image/kochCurve-B.svg)

* * *

See also: angleVector, peanoCurve, substitutionSystem

Guides: Curve Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/KochCurve.html),
_Riddle_
[1](https://larryriddle.agnesscott.org/ifs/kcurve/kcurve.htm),
_W_
[1](https://en.wikipedia.org/wiki/Koch_snowflake)
