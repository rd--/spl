# fordCircle

- _fordCircle(h/k)_

Answer the Ford circle for the two relatively prime integers _h_ and _k_.

```
>>> 3/7.fordCircle
Circle([3/7 1/98], 1/98)
```

Draw Ford circles for the ninth-order Farey sequence:

~~~spl svg=A
9.fareySequence
.allButFirstAndLast
.fordCircle
.LineDrawing
~~~

![](sw/spl/Help/Image/fordCircle-A.svg)

* * *

See also: Circle, Fraction, fareySequence, isAdjacentFraction

Guides: Geometry Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/FordCircle.html),
_W_
[1](https://en.wikipedia.org/wiki/Ford_circle)
