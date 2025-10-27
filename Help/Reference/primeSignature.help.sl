# primeSignature

- _primeSignature(n)_

Answer the prime signature of _n_.

First instances of prime signatures, sorted by sum of signature:

```
>>> [
>>> 	  1    2    4    6   8
>>> 	 12   30   16   24  36
>>> 	 60  210   32   48  72
>>> 	120  180  420 2310
>>> ].collect(primeSignature:/1)
[
	;
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
	;
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
	; 1; 1; 2; 1; 1 1; 1; 3; 2; 1 1; 1;
	2 1; 1; 1 1; 1 1; 4; 1; 2 1; 1; 2 1
]
```

* * *

See also: factorInteger

Guides: Prime Number Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/PrimeSignature.html),
OEIS
[1](https://oeis.org/A025487)
[2](https://oeis.org/A118914),
_W_
[1](https://en.wikipedia.org/wiki/Prime_signature)
