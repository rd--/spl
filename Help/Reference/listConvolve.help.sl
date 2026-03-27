# listConvolve

- _listConvolve(u, v)_

Convolution, also known as Fourier convolution and polynomial multiplication.
The answer size is the list _v_ minus the size of the kernel _u_ plus one.
Implemented using direct calculation.

At `Symbol`:

```
>> [`x` `y`].listConvolve([`a` `b` `c`])
[(+ (* b x) (* a y)), (+ (* c x) (* b y))]
```

Self-convolution of partition numbers,
OEIS [A048574](https://oeis.org/A048574):

```
>>> 1:11.collect { :n |
>>> 	let p = 1:n.partitionsP;
>>> 	p.listConvolve(p).unenclose
>>> }
[1 4 10 22 43 80 141 240 397 640 1011]
```

Primes that are the sum of twenty-five consecutive primes,
OEIS [A215991](https://oeis.org/A215991):

~~~spl svg=A oeis=A215991
let k = List(25, 1);
k.listConvolve(1:350.prime)
.select(isPrime:/1)
.discretePlot
~~~

![](Help/Image/listConvolve-A.svg)

Convolution of primes with themselves,
OEIS [A014342](https://oeis.org/A014342):

~~~spl svg=B oeis=A014342
1:45.collect { :n |
	let p = 1:n.prime;
	p.listConvolve(p).unenclose
}.discretePlot
~~~

![](Help/Image/listConvolve-B.svg)

* * *

See also: convolve

Guides: Fourier Analysis Functions, Signal Processing Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/ListConvolve.html)
