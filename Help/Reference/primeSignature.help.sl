# primeSignature

- _primeSignature(n)_

Answer the prime signature of _n_,
the sorted exponents of the prime factorization.

```
>>> 1.primeSignature
[1]

>>> 16.primeSignature
[4]
```

First instances of prime signatures,
sorted by sum of signature,
OEIS [A036035](https://oeis.org/A036035):

```
>>> [
>>> 	  1    2    4    6   8
>>> 	 12   30   16   24  36
>>> 	 60  210   32   48  72
>>> 	120  180  420 2310
>>> ].collect(primeSignature:/1)
[
	1;
	1;
	2;
	1 1;
	3;
	2 1;
	1 1 1;
	4;
	3 1;
	2 2;
	2 1 1;
	1 1 1 1;
	5;
	4 1;
	3 2;
	3 1 1;
	2 2 1;
	2 1 1 1;
	1 1 1 1 1
]
```

First instances of prime signatures,
sorted by first instance,
OEIS [A025487](https://oeis.org/A025487):

```
>>> [
>>> 	1 2 4 6 8
>>> 	12 16 24 30 32
>>> 	36 48 60 64 72
>>> 	96 120 128 144 180
>>> 	192 210 216 240 256
>>> 	288 360 384 420 432
>>> 	480 512 576 720 768
>>> 	840 864 900 960 1024
>>> 	1080 1152 1260 1296 1440
>>> 	1536 1680 1728 1800 1920
>>> 	2048 2160 2304 2310
>>> ].collect(primeSignature:/1)
[
	1;
	1;
	2;
	1 1;
	3;
	2 1;
	4;
	3 1;
	1 1 1;
	5;
	2 2;
	4 1;
	2 1 1;
	6;
	3 2;
	5 1;
	3 1 1;
	7;
	4 2;
	2 2 1;
	6 1;
	1 1 1 1;
	3 3;
	4 1 1;
	8;
	5 2;
	3 2 1;
	7 1;
	2 1 1 1;
	4 3;
	5 1 1;
	9;
	6 2;
	4 2 1;
	8 1;
	3 1 1 1;
	5 3;
	2 2 2;
	6 1 1;
	10;
	3 3 1;
	7 2;
	2 2 1 1;
	4 4;
	5 2 1;
	9 1;
	4 1 1 1;
	6 3;
	3 2 2;
	7 1 1;
	11;
	4 3 1;
	8 2;
	1 1 1 1 1
]
```

Prime signatures of first few integers,
OEIS [A118914](https://oeis.org/A118914):

```
>>> 1:20.collect(primeSignature:/1)
[
	1; 1; 1; 2; 1; 1 1; 1; 3; 2; 1 1; 1;
	2 1; 1; 1 1; 1 1; 4; 1; 2 1; 1; 2 1
]
```

Plot first few terms:

~~~spl svg=A
1:75.collect(primeSignature:/1)
.catenate
.scatterPlot
~~~

![](sw/spl/Help/Image/primeSignature-A.svg)

Smallest number with same prime signature as _n_,
OEIS [A046523](https://oeis.org/A046523):

```
>>> 2:31.collect { :n |
>>> 	let s = n.primeSignature;
>>> 	2:n.detect { :x |
>>> 		x.primeSignature = s
>>> 	}
>>> }
[
	 2  2  4  2  6  2  8  4  6  2
	12  2  6  6 16  2 12  2 12  6
	 6  2 24  4  6  8 12  2 30  2
]
```

Plot first few terms:

~~~spl svg=B
2:100.collect { :n |
	let s = n.primeSignature;
	2:n.detect { :x |
		x.primeSignature = s
	}
}.scatterPlot
~~~

![](sw/spl/Help/Image/primeSignature-B.svg)

* * *

See also: factorInteger

Guides: Prime Number Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/PrimeSignature.html),
_OEIS_
[1](https://oeis.org/A036035)
[2](https://oeis.org/A025487)
[3](https://oeis.org/A118914)
[4](https://oeis.org/A046523),
_W_
[1](https://en.wikipedia.org/wiki/Prime_signature)
