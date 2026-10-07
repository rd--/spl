# isEisensteinPrime

- _isEisensteinPrime(a, b)_

Eisenstein primes are the prime Eisenstein integers.

Table of first few Eisenstein primes:

```
>>> { :a :b |
>>> 	isEisensteinPrime(a, b).if {
>>> 		[a b]
>>> 	} {
>>> 		nil
>>> 	}
>>> }.table(-4:4, -4:4)
>>> .catenate.deleteMissing
[
	-4 -3; -4 -1; -4 3;
	-3 -4; -3 -2; -3 -1; -3 1; -3 2; -3 4;
	-2 -3; -2 -2; -2 -1; -2 0; -2 1; -2 3;
	-1 -4; -1 -3; -1 -2; -1 1; -1 2; -1 3;
	0 -2; 0 2;
	1 -3; 1 -2; 1 -1; 1 2; 1 3; 1 4;
	2 -3; 2 -1; 2 0; 2 1; 2 2; 2 3;
	3 -4; 3 -2; 3 -1; 3 1; 3 2; 3 4;
	4 -3; 4 1; 4 3
]
```

Plot Eisenstein primes in the complex plane:

~~~spl svg=A
let omega = (-1 + (0J1 * 3.sqrt)) / 2;
{ :a :b |
	isEisensteinPrime(a, b).if {
		(a + (b * omega)).realImaginary
	} {
		nil
	}
}.table(-11:11, -11:11)
.catenate
.deleteMissing
.scatterPlot
~~~

![](Help/Image/isEisensteinPrime-A.svg)

Plot Eisenstein primes on a linear _(a,b)_ grid:

~~~spl png=B
{ :a :b |
	isEisensteinPrime(a, b)
	.boole
}.table(-99:99, -99:99)
.Bitmap
~~~

![](Help/Image/isEisensteinPrime-B.png)

* * *

See also: EisensteinInteger, isGaussianPrime, isPrime

Guides: Prime Number Functions, Predicate Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/EisensteinPrime.html),
_W_
[1](https://en.wikipedia.org/wiki/Eisenstein_integer#Eisenstein_primes)
