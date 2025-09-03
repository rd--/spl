# isEisensteinPrime

- _isEisensteinPrime(a, b)_

Eisenstein primes are the prime Eisenstein integers.

Plot Eisenstein primes in the complex plane:

~~~spl svg=A
let omega = (-1 + (0J1 * 3.sqrt)) / 2;
{ :a :b |
	isEisensteinPrime(a, b).if {
		(a + (b * omega)).asList
	} {
		nil
	}
}.table(-11:11, -11:11)
.flatten(1)
.select(isNotNil:/1)
.scatterPlot
~~~

![](sw/spl/Help/Image/isEisensteinPrime-A.svg)

Plot Eisenstein primes on a linear _(a,b)_ grid:

~~~spl png=B
{ :a :b |
	isEisensteinPrime(a, b)
	.boole
}.table(-99:99, -99:99)
.Bitmap
~~~

![](sw/spl/Help/Image/isEisensteinPrime-B.png)

* * *

See also: EisensteinInteger, isGaussianPrime, isPrime

Guides: Prime Number Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/EisensteinPrime.html)
