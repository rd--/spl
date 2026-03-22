# seidelTriangle

- _seidelTriangle(n)_

Answer the first _n_ rows of Seidel’s triangle.

First few rows of Seidel’s triangle,
OEIS [A014781](https://oeis.org/A014781):

```
>>> 12.seidelTriangle
[
	1;
	1;
	1 1;
	2 1;
	2 3 3;
	8 6 3;
	8 14 17 17;
	56 48 34 17;
	56 104 138 155 155;
	608 552 448 310 155;
	608 1160 1608 1918 2073 2073;
	9440 8832 7672 6064 4146 2073
]
```

Seidel’s triangle,
log scale scatter plot,
OEIS [A014781](https://oeis.org/A014781):

~~~spl svg=A oeis=A014781
13.seidelTriangle
.catenate
.scatterPlot.logScale
~~~

![](Help/Image/seidelTriangle-A.svg)

* * *

See also: entringerTriangle, genocchiNumber, seidelEntringerArnoldTriangle

Guides: Integer Sequence Functions

References:
_OEIS_
[1](https://oeis.org/A014781)
