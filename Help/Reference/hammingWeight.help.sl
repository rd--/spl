# hammingWeight

- _hammingWeight(n)_

Answer the Hamming weight,
or binary weight,
of the integer _n_.

The first few terms,
OEIS [A000120](https://oeis.org/A000120):

```
>>> 0:31.collect(hammingWeight:/1)
[
	0 1 1 2 1 2 2 3 1 2
	2 3 2 3 3 4 1 2 2 3
	2 3 3 4 2 3 3 4 3 4
	4 5
]
```

Threads over lists,
take modulo two it is the Thue-Morse sequence,
OEIS [A010060](https://oeis.org/A010060):

```
>>> 0:31.hammingWeight % 2
32.thueMorseSequence
```

Scatter plot first few terms,
OEIS [A000120](https://oeis.org/A000120):

~~~spl svg=A
0:99.hammingWeight.scatterPlot
~~~

![](sw/spl/Help/Image/hammingWeight-A.svg)

Line plot of the first eight-bit integers:

~~~spl svg=B
0:255.hammingWeight.linePlot
~~~

![](sw/spl/Help/Image/hammingWeight-B.svg)

Plot integers with hamming weight of three,
OEIS [A014311](https://oeis.org/A014311):

~~~spl svg=C
0:250.select { :n |
	n.hammingWeight = 3
}.scatterPlot
~~~

![](sw/spl/Help/Image/hammingWeight-C.svg)

Plot Hamming weight of _3n_,
OEIS [A036555](https://oeis.org/A036555):

~~~spl svg=D
(0:250 * 3).hammingWeight.scatterPlot
~~~

![](sw/spl/Help/Image/hammingWeight-D.svg)

Plot partial sums of _w(n)!_,
OEIS [A188064](https://oeis.org/A188064):

~~~spl svg=E
0:250.hammingWeight
.factorial
.prefixSum
.stepPlot
~~~

![](sw/spl/Help/Image/hammingWeight-E.svg)

Plot _w(n)!_,
OEIS [A093659](https://oeis.org/A093659):

~~~spl svg=F
0:250.hammingWeight
.factorial
.log
.scatterPlot
~~~

![](sw/spl/Help/Image/hammingWeight-F.svg)

Plot irregular triangle read by rows of _0:2^n-1_ sorted by _w_,
OEIS [A294648](https://oeis.org/A294648):

~~~spl svg=G
1:7.collect { :n |
	let m = 2 ^ n - 1;
	[0 .. m].sortOn(hammingWeight:/1)
}.catenate.scatterPlot
~~~

![](sw/spl/Help/Image/hammingWeight-G.svg)

Plot only the sixth row of the table:

~~~spl svg=H
[0 .. 2 ^ 6 - 1]
.sortOn(hammingWeight:/1)
.stepPlot
~~~

![](sw/spl/Help/Image/hammingWeight-H.svg)

Plot least _k_ such that the _w(k)_ equals the _w(k×n)_,
OEIS [A292849](https://oeis.org/A292849):

~~~spl svg=I
1:250.collect { :n |
	1:Infinity.detect { :k |
		k.hammingWeight
		=
		(k * n).hammingWeight
	}
}.log.scatterPlot
~~~

![](sw/spl/Help/Image/hammingWeight-I.svg)

Plot triangle read by rows of _0:n_ sorted by _w_,
OEIS [A262881](https://oeis.org/A262881):

~~~spl svg=J
1:21.collect { :n |
	[0 .. n].sortOn(hammingWeight:/1)
}.catenate.scatterPlot
~~~

![](sw/spl/Help/Image/hammingWeight-J.svg)

Plot lexicographically earliest sequence of distinct positive terms
such that for consecutive terms _w(i+j)≥10_,
OEIS [A287639](https://oeis.org/A287639):

~~~spl svg=K
let a = [1];
99.timesRepeat {
	let x = a.last;
	a.add(
		1:Infinity.detect { :y |
			a.includes(y).not & {
				(x + y)
				.hammingWeight
				>= 10
			}
		}
	)
};
a.scatterPlot
~~~

![](sw/spl/Help/Image/hammingWeight-K.svg)

Plot further terms:

~~~spl svg=L
OeisEntry('A287639').then { :e |
	e.bFileData
	.first(300)
	.scatterPlot
}
~~~

![](sw/spl/Help/Image/hammingWeight-L.svg)

Plot later segment of further terms:

~~~spl svg=M
OeisEntry('A287639').then { :e |
	e.bFileData
	.copyFromTo(950, 1200)
	.scatterPlot
}
~~~

![](sw/spl/Help/Image/hammingWeight-M.svg)

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
