# ternaryExpansion

- _ternaryExpansion(n)_

Answer the ternary expansion of _n_.

Numbers whose ternary expansion contains no one,
called the Cantor numbers,
OEIS [A032924](https://oeis.org/A032924):

```
>>> 0:400.reject { :n |
>>> 	n.ternaryExpansion.includes(1)
>>> }
32.cantorNumbers
```

Numbers whose ternary expansion contain no two,
a Stanley sequence,
OEIS [A005836](https://oeis.org/A005836):

```
>>> 0:400.reject { :n |
>>> 	n.ternaryExpansion.includes(2)
>>> }
[0 1].stanleySequence(64)
```

Numbers whose ternary expansion contains no zero,
OEIS [A032924](https://oeis.org/A032924):

~~~spl svg=A oeis=A032924
0:400.reject { :n |
	n.ternaryExpansion.includes(0)
}.scatterPlot
~~~

![](Help/Image/ternaryExpansion-A.svg)

Rebase _n_ from three to two,
OEIS [A065361](https://oeis.org/A065361):

~~~spl svg=B oeis=A065361
0:115.ternaryExpansion.binaryContraction
.scatterPlot
~~~

![](Help/Image/ternaryExpansion-B.svg)

Number of numbers _≤n_ having no zero in their ternary representation,
OEIS [A081608](https://oeis.org/A081608):

~~~spl svg=C oeis=A081608
0:200.collect { :n |
	n.ternaryExpansion.includes(0).not
}.boole.prefixSum.stepPlot
~~~

![](Help/Image/ternaryExpansion-C.svg)

Numbers whose ternary representation begins with one,
OEIS [A132141](https://oeis.org/A132141):

~~~spl svg=D oeis=A132141
0:115.select { :n |
	n.ternaryExpansion[1] = 1
}.discretePlot
~~~

![](Help/Image/ternaryExpansion-D.svg)

Write _n_ in base three and juxtapose,
OEIS [A003137](https://oeis.org/A003137):

~~~spl svg=E oeis=A003137
1:35.ternaryExpansion
.catenate.stepPlot
~~~

![](Help/Image/ternaryExpansion-E.svg)

Numbers in base three,
OEIS [A007089](https://oeis.org/A007089):

~~~spl svg=F oeis=A007089
0:65.ternaryExpansion
.decimalContraction
.discretePlot
~~~

![](Help/Image/ternaryExpansion-F.svg)

* * *

See also: binaryExpansion, cantorNumbers, decimalExpansion, unaryExpansion
