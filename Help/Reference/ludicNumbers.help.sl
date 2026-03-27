# ludicNumbers

- _ludicNumbers(n)_

Answer the first Ludic numbers less than or equal to the integer _n_.

Ludic numbers,
OEIS [A003309](https://oeis.org/A003309):

```
>>> 37.ludicNumbers
[1 2 3 5 7 11 13 17 23 25 29 37]
```

Ludic prime numbers,
OEIS [A192503](https://oeis.org/A192503):

```
>>> 43.ludicNumbers.select(isPrime:/1)
[2 3 5 7 11 13 17 23 29 37 41 43]
```

Ludic non-prime numbers,
OEIS [A192504](https://oeis.org/A192504):

```
>>> 200.ludicNumbers.reject(isPrime:/1)
[1 25 77 91 115 119 121 143 161 175]
```

Ludic numbers,
OEIS [A003309](https://oeis.org/A003309):

~~~spl svg=A oeis=A003309
350.ludicNumbers.discretePlot
~~~

![](Help/Image/ludicNumbers-A.svg)

Ludic prime numbers,
OEIS [A192503](https://oeis.org/A192503):

~~~spl svg=B oeis=A192503
650.ludicNumbers.select(isPrime:/1).discretePlot
~~~

![](Help/Image/ludicNumbers-B.svg)

Ludic non-prime numbers,
OEIS [A192504](https://oeis.org/A192504):

~~~spl svg=C oeis=A192504
1050.ludicNumbers.reject(isPrime:/1).discretePlot
~~~

![](Help/Image/ludicNumbers-C.svg)

Characteristic function of ludic numbers,
OEIS [A192490](https://oeis.org/A192490):

~~~spl svg=D oeis=A192490
250.ludicNumbers
.characteristicFunction
.discretePlot
~~~

![](Help/Image/ludicNumbers-D.svg)

Number of ludic numbers not greater than _n_,
OEIS [A192512](https://oeis.org/A192512):

~~~spl svg=E oeis=A192512
150.ludicNumbers
.characteristicFunction
.prefixSum
.stepPlot
~~~

![](Help/Image/ludicNumbers-E.svg)

Nonludic numbers,
OEIS [A192607](https://oeis.org/A192607):

~~~spl svg=F oeis=A192607
let n = 80;
1:n.complement(n.ludicNumbers).discretePlot
~~~

![](Help/Image/ludicNumbers-F.svg)

First differences of Ludic numbers,
OEIS [A260723](https://oeis.org/A260723):

~~~spl svg=G oeis=A260723
350.ludicNumbers
.differences
.discretePlot
~~~

![](Help/Image/ludicNumbers-G.svg)

* * *

See also: sieveOfEratosthenes

Guides: Integer Sequence Functions

References:
_OEIS_
[1](https://oeis.org/wiki/Ludic_numbers)
