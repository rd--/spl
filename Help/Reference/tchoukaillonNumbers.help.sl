# tchoukaillonNumbers

- _tchoukaillonNumbers(n)_

Answer the first _n_ Tchoukaillon numbers,
also called Mancala or Kalahari numbers.

Tchoukaillon numbers,
OEIS [A007952](https://oeis.org/A007952),
also
OEIS [A002491](https://oeis.org/A002491) minus one:

```
>>> 58.tchoukaillonNumbers
[
	   0    1   3    5  9
	  11   17   21  29 33
	  41   47   57  59 77
	  81  101  107 117 131
	 149  153  173 191 209
	 213  239  257 273 281
	 321  329  359 371 401
	 417  441  453 497 509
	 539  569  611 621 647
	 671  717  731 779 801
	 839  869  917 929 989
	1001 1053 1067
]
```

Tchoukaillon numbers,
OEIS [A007952](https://oeis.org/A007952):

~~~spl svg=A oeis=A007952
65.tchoukaillonNumbers
.discretePlot
~~~

![](Help/Image/tchoukaillonNumbers-A.svg)

First differences of Tchoukaillon numbers,
OEIS [A028913](https://oeis.org/A028913):

~~~spl svg=B oeis=A028913
85.tchoukaillonNumbers
.differences
.discretePlot
~~~

![](Help/Image/tchoukaillonNumbers-B.svg)

The number of Mancala numbers _≤n-1_,
OEIS [A082447](https://oeis.org/A082447):

~~~spl svg=C oeis=A082447
(14.tchoukaillonNumbers + 1)
.characteristicFunction
.prefixSum
.discretePlot
~~~

![](Help/Image/tchoukaillonNumbers-C.svg)

Characteristic function of Tchoukaillon numbers:

~~~spl svg=D
23.tchoukaillonNumbers
.characteristicFunction
.discretePlot
~~~

![](Help/Image/tchoukaillonNumbers-D.svg)

An array of quotients,
OEIS [A140060](https://oeis.org/A140060):

~~~spl svg=E oeis=A140060
let q = { :n :k |
	(k = 1).if {
		n
	} {
		k * floor(q(n, k - 1) / k)
	}
};
(9.tchoukaillonNumbers + 1)
.characteristicFunction
.prefixSum
.withIndexCollect { :m :n |
	1:m.collect { :k |
		q(n, k)
	}
}.catenate.scatterPlot
~~~

![](Help/Image/tchoukaillonNumbers-E.svg)

Run array with run counts given by first differences of Tchoukaillon numbers,
OEIS [A073047](https://oeis.org/A073047):

~~~spl svg=F oeis=A073047
let k = 14;
RunArray(
	14.tchoukaillonNumbers.differences,
	[2 .. k + 1]
).asList.discretePlot
~~~

![](Help/Image/tchoukaillonNumbers-F.svg)

* * *

See also: ludicNumbers

Guides: Integer Sequence Functions

References:
_OEIS_
[1](https://oeis.org/A007952)
