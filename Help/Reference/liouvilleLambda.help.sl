# liouvilleLambda

- _liouvilleLambda(n)_

Answer the Liouville lambda function at _n_.
The answer is one whenever the number of prime factors counting multiplicity of _n_ is even,
and negative one otherwise.

Compute the Liouville function at 8 and 9:

```
>>> 8.liouvilleLambda
-1

>>> 9.liouvilleLambda
1
```

The first few terms:

```
>>> 1:34.collect(liouvilleLambda:/1)
[
	 1 -1 -1  1 -1  1 -1 -1  1  1
	-1 -1 -1  1  1  1 -1 -1 -1 -1
	 1  1 -1  1  1  1 -1 -1 -1 -1
	-1 -1  1  1
]
```

Plot the Liouville lambda sequence for the first 20 numbers:

~~~spl svg=A
1:20.collect(liouvilleLambda:/1)
.discretePlot
~~~

![](sw/spl/Help/Image/liouvilleLambda-A.svg)

Parity of number of primes dividing _n_,
OEIS [A007421](https://oeis.org/A007421):

~~~spl svg=B
1:75.collect { :n |
	(n.liouvilleLambda + 3) / 2
}.stepPlot
~~~

![](sw/spl/Help/Image/liouvilleLambda-B.svg)

* * *

See also: primeFactors, size

Guides: Integer Sequence Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/LiouvilleFunction.html)
[2](https://reference.wolfram.com/language/ref/LiouvilleLambda.html),
_OEIS_
[1](https://oeis.org/A008836)
[2](https://oeis.org/A007421),
_W_
[1](https://en.wikipedia.org/wiki/Liouville_function)
