# hafermanCarpet

- _hafermanCarpet(n)_

Answer a binary matrix representing the _n_-th step Haferman carpet.

```
>>> 2.hafermanCarpet
[
	1 0 1 1 1 1 1 0 1;
	0 1 0 1 1 1 0 1 0;
	1 0 1 1 1 1 1 0 1;
	1 1 1 1 0 1 1 1 1;
	1 1 1 0 1 0 1 1 1;
	1 1 1 1 0 1 1 1 1;
	1 0 1 1 1 1 1 0 1;
	0 1 0 1 1 1 0 1 0;
	1 0 1 1 1 1 1 0 1
]
```

Drawing of the 2nd step of the Haferman carpet:

~~~spl svg=A
2.hafermanCarpet.matrixPlot
~~~

![](sw/spl/Help/Image/hafermanCarpet-A.svg)

Drawing of the 4th step of the Haferman carpet:

~~~spl png=B
4.hafermanCarpet.Bitmap
~~~

![](sw/spl/Help/Image/hafermanCarpet-B.png)

* * *

See also: cantorDust, sierpinskiCarpet, substitutionSystem

Guides: Curve Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/HafermanCarpet.html)
