# interprime

- _interprime(n)_

Answer the _n_--th interprime number,
the average of two consecutive odd primes.

First few terms,
OEIS [A024675](https://oeis.org/A024675):

```
>>> 1:24.collect(interprime:/1)
[
	 4  6  9 12 15 18 21 26 30 34
	39 42 45 50 56 60 64 69 72 76
	81 86 93 99
]
```

Plot:

~~~spl svg=A
1:99.collect(interprime:/1)
.stepPlot
~~~

![](sw/spl/Help/Image/interprime-A.svg)

* * *

See also: prime

Guides: Prime Number Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Interprime.html),
_OEIS_
[1](https://oeis.org/A024675),
_W_
[1](https://en.wikipedia.org/wiki/Interprime)

Categories: Math
