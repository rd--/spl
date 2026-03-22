# hammingWeight

- _hammingWeight(n)_

Answer the Hamming weight,
or binary weight,
of the integer _n_.

Hamming weight,
threads over lists,
OEIS [A000120](https://oeis.org/A000120):

```
>>> 0:31.hammingWeight
[
	0 1 1 2 1 2 2 3 1 2
	2 3 2 3 3 4 1 2 2 3
	2 3 3 4 2 3 3 4 3 4
	4 5
]
```

Taken modulo two it is the Thue-Morse sequence,
OEIS [A010060](https://oeis.org/A010060):

```
>>> 0:31.hammingWeight % 2
32.thueMorseSequence
```

Length of longest chain of subgroups in _Sn_,
OEIS [A007238](https://oeis.org/A007238):

```
>>> 1:16.collect { :n |
>>> 	let w = n.hammingWeight;
>>> 	(3 * n / 2).ceiling - w - 1
>>> }
[0 1 2 4 5 6 7 10 11 12 13 15 16 17 18 22]
```

Hamming weight,
OEIS [A000120](https://oeis.org/A000120):

~~~spl svg=A oeis=A000120
0:99.hammingWeight.scatterPlot
~~~

![](Help/Image/hammingWeight-A.svg)

Hamming weight of the first eight-bit integers,
line plot,
OEIS [A000120](https://oeis.org/A000120):

~~~spl svg=B oeis=A000120
0:255.hammingWeight.linePlot
~~~

![](Help/Image/hammingWeight-B.svg)

Integers with hamming weight of three,
OEIS [A014311](https://oeis.org/A014311):

~~~spl svg=C oeis=A014311
0:250.select { :n |
	n.hammingWeight = 3
}.scatterPlot
~~~

![](Help/Image/hammingWeight-C.svg)

Hamming weight of _3n_,
OEIS [A036555](https://oeis.org/A036555):

~~~spl svg=D oeis=A036555
(0:250 * 3).hammingWeight.scatterPlot
~~~

![](Help/Image/hammingWeight-D.svg)

Partial sums of _w(n)!_,
OEIS [A188064](https://oeis.org/A188064):

~~~spl svg=E oeis=A188064
0:250.hammingWeight
.factorial
.prefixSum
.stepPlot
~~~

![](Help/Image/hammingWeight-E.svg)

_w(n)!_,
OEIS [A093659](https://oeis.org/A093659):

~~~spl svg=F oeis=A093659
0:250.hammingWeight
.factorial
.scatterPlot.log
~~~

![](Help/Image/hammingWeight-F.svg)

Irregular triangle read by rows of _0:2^n-1_ sorted by _w_,
OEIS [A294648](https://oeis.org/A294648):

~~~spl svg=G oeis=A294648
1:7.collect { :n |
	let m = 2 ^ n - 1;
	[0 .. m].sortOn(hammingWeight:/1)
}.catenate.scatterPlot
~~~

![](Help/Image/hammingWeight-G.svg)

Plot only the sixth row of the table:

~~~spl svg=H
[0 .. 2 ^ 6 - 1]
.sortOn(hammingWeight:/1)
.stepPlot
~~~

![](Help/Image/hammingWeight-H.svg)

Least _k_ such that the _w(k)_ equals the _w(k×n)_,
OEIS [A292849](https://oeis.org/A292849):

~~~spl svg=I oeis=A292849
1:250.collect { :n |
	1:Infinity.detect { :k |
		k.hammingWeight
		=
		(k * n).hammingWeight
	}
}.scatterPlot.log
~~~

![](Help/Image/hammingWeight-I.svg)

Triangle,
read by rows,
of _0:n_ sorted by _w_,
OEIS [A262881](https://oeis.org/A262881):

~~~spl svg=J oeis=A262881
1:21.collect { :n |
	[0 .. n].sortOn(hammingWeight:/1)
}.catenate.scatterPlot
~~~

![](Help/Image/hammingWeight-J.svg)

Lexicographically earliest sequence of distinct positive terms
such that for consecutive terms _w(i+j)≥10_,
OEIS [A287639](https://oeis.org/A287639):

~~~spl svg=K oeis=A287639
[1].leastExcludedSequence(100) { :a :n :m |
	(a[n - 1] + m).hammingWeight >= 10
}.scatterPlot
~~~

![](Help/Image/hammingWeight-K.svg)

Lexicographically earliest sequence of distinct positive terms
such that for consecutive terms _w(i+j)≥10_,
further terms,
OEIS [A287639](https://oeis.org/A287639):

~~~spl svg=L oeis=A287639
OeisEntry('A287639').then { :e |
	e.bFileData
	.first(300)
	.scatterPlot
}
~~~

![](Help/Image/hammingWeight-L.svg)

Lexicographically earliest sequence of distinct positive terms
such that for consecutive terms _w(i+j)≥10_,
later segment of further terms,
OEIS [A287639](https://oeis.org/A287639):

~~~spl svg=M oeis=A287639
OeisEntry('A287639').then { :e |
	e.bFileData
	.copyFromTo(950, 1200)
	.scatterPlot
}
~~~

![](Help/Image/hammingWeight-M.svg)

_2^(n-w(n))_,
OEIS [A060818](https://oeis.org/A060818):

~~~spl svg=N oeis=A060818
0:50.collect { :n |
	2 ^ (n - n.hammingWeight)
}.scatterPlot.log
~~~

![](Help/Image/hammingWeight-N.svg)

_3^(w(n-1)-1)_,
OEIS [A147610](https://oeis.org/A147610):

~~~spl svg=O oeis=A147610
let n = 2:85;
let w = (n - 1).hammingWeight;
let a = 3 ^ (w - 1);
a.discretePlot
~~~

![](Help/Image/hammingWeight-O.svg)

Partial sums of _3^(w(n-1)-1)_,
OEIS [A151920](https://oeis.org/A151920):

~~~spl svg=P oeis=A151920
let n = 2:85;
let w = (n - 1).hammingWeight;
let a = 3 ^ (w - 1);
a.prefixSum.scatterPlot
~~~

![](Help/Image/hammingWeight-P.svg)

T-toothpick sequence,
OEIS [A160172](https://oeis.org/A160172):

~~~spl svg=Q oeis=A160172
let a = Map { :n |
	(n < 0).if {
		0
	} {
		let m = n + 1;
		1:m.sum { :i |
			3 ^ i.hammingWeight
		} / 3
	}
};
0:85.collect { :n |
	(2 * a[n - 2]) + (2 * a[n - 3]) + n
}.scatterPlot
~~~

![](Help/Image/hammingWeight-Q.svg)

Running sum of every third term in the _+1,-1_-version of Thue-Morse sequence,
OEIS [A005599](https://oeis.org/A005599):

~~~spl svg=R oeis=A005599
0:200.collect { :n |
	0:n.sum { :k |
		-1 ^ (3 * k).hammingWeight
	}
}.linePlot
~~~

![](Help/Image/hammingWeight-R.svg)

Table of Hamming distances between binary vectors,
read by antidiagonals,
OEIS [A101080](https://oeis.org/A101080):

~~~spl svg=S oeis=A101080
0:11.antidiagonalArray { :n :k |
	n.bitXor(k).hammingWeight
}.catenate.discretePlot
~~~

![](Help/Image/hammingWeight-S.svg)

Numerator of Woon’s Bernoulli tree,
OEIS [A242179](https://oeis.org/A242179):

~~~spl svg=T oeis=A242179
1:65.collect { :n |
	let w = n.hammingWeight;
	0 - (-1 ^ (n.log2.floor - w))
}.discretePlot
~~~

![](Help/Image/hammingWeight-T.svg)

* * *

See also: digitCount, gouldsSequence, thueMorseSequence

Guides: Bitwise Functions, Integer Functions

References:
_OEIS_
[1](https://oeis.org/A000120)
[2](https://oeis.org/A010060)
[3](https://oeis.org/A014311),
_W_
[1](https://en.wikipedia.org/wiki/Hamming_weight)
