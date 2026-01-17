# luckyNumbers

- _luckyNumbers(n)_

Answer the lucky numbers less than or equal to _n_.

First few terms,
OEIS [A000959](https://oeis.org/A000959):

```
>>> 300.luckyNumbers
[
	  1   3   7   9  13
	 15  21  25  31  33
	 37  43  49  51  63
	 67  69  73  75  79
	 87  93  99 105 111
	115 127 129 133 135
	141 151 159 163 169
	171 189 193 195 201
	205 211 219 223 231
	235 237 241 259 261
	267 273 283 285 289
	297
]
```

Lucky numbers that are also primes:

```
>>> 1000.luckyNumbers
>>> .select(isPrime:/1)
[
	  3   7  13  31  37
	 43  67  73  79 127
	151 163 193 211 223
	241 283 307 331 349
	367 409 421 433 463
	487 541 577 601 613
	619 631 643 673 727
	739 769 787 823 883
	937 991 997
]
```

Step plot of distances between lucky numbers:

~~~spl svg=A
1000.luckyNumbers
.differences
.stepPlot
~~~

![](sw/spl/Help/Image/luckyNumbers-A.svg)

Plot the points at lucky number indices on the first seventeen turns of the spiral:

~~~spl svg=B
let h = (17 * 3).triangularSpiralPoints;
let k = h.size;
let p = k.luckyNumbers;
h.atAll(p).PointCloud
~~~

![](sw/spl/Help/Image/luckyNumbers-B.svg)

Log scale plot of first few terms of lucky and prime number sequences:

~~~spl svg=C
let a = 1000.luckyNumbers;
let b = (1 .. a.size).prime;
[a, b].logScale.linePlot
~~~

![](sw/spl/Help/Image/luckyNumbers-C.svg)

* * *

See also: primesUpTo

Guides: Prime Number Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/LuckyNumber.html),
_OEIS_
[1](https://oeis.org/A000959),
_W_
[1](https://en.wikipedia.org/wiki/Lucky_number)
