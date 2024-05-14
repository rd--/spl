# integerDigits

- _integerDigits(anInteger, base)_
- _integerDigits(alpha)_ => _integerDigits(alpha, 10)_

Answer a `List` of the decimal digits in the integer _anInteger_.

Find digits in base 10:

```
>>> 58127.integerDigits
[5 8 1 2 7]
```

Find digits in base 2 & 3:

```
>>> 58127.integerDigits(2)
[1 1 1 0 0 0 1 1 0 0 0 0 1 1 1 1 ]

>>> 58127.integerDigits(3)
[2 2 2 1 2 0 1 2 1 2]
```

Bases larger than 10 can be used:

```
>>> 58127.integerDigits(16)
[14 3 0 15]
```

Threads over lists:

```
>>> [6 7 2].integerDigits(2)
[1 1 0; 1 1 1; 1 0]
```

Find the digits of 7 in different bases:

```
>>> 7.integerDigits(2:4)
[1 1 1; 2 1; 1 3]
```

Find only the last 4 digits:

```
>>> 6345354.integerDigits(10, 4)
[5 3 5 4]
```

Count from zero to seven in binary, answers to three places:

```
>>> 0:7.integerDigits(2, 3)
[0 0 0; 0 0 1; 0 1 0; 0 1 1; 1 0 0; 1 0 1; 1 1 0; 1 1 1]
```

Number of 1s in the ternary expansion of _n_,
OEIS [A062756](https://oeis.org/A062756):

```
>>> 0:23.collect { :i |
>>> 	i.integerDigits(3).count(isOne:/1)
>>> }
[0 1 0 1 2 1 0 1 0 1 2 1 2 3 2 1 2 1 0 1 0 1 2 1]
```

Find the the _population count_,
the number of ones in the binary representation of a non-negative integer,
for the first few powers of three:

```
>>> 0:29.collect { :i |
>>> 	(3 ^ i).integerDigits(2).count(isOne:/1)
>>> }
[1 2 2 4 3 6 6 5 6 8 9 13 10 11 14 15 11 14 14 17 17 20 19 22 16 18 24 30 25 25]
```

Least numbers whose square and cube, taken together, are pandigital _n_ times,
c.f. OEIS [A364024](https://oeis.org/A364024):

```
>>> let n = 69 ^ [2 3];
>>> (n, n.integerDigits.++.sort)
([4761 328509], [0 1 2 3 4 5 6 7 8 9])

>>> let n = 6534 ^ [2 3];
>>> (n, n.integerDigits.++.sort)
([42693156 278957081304], [0 0 1 1 2 2 3 3 4 4 5 5 6 6 7 7 8 8 9 9])

>>> let n = 497375 ^ [2 3];
>>> (n, n.integerDigits.++.sort)
(
	[247381890625 123041567849609380],
	[0 0 0 1 1 1 2 2 2 3 3 3 4 4 4 5 5 6 6 6 6 7 7 8 8 8 8 9 9 9]
)

>>> 46839081n ^ [2 3]
[2193899508924561n, 102760236804377735568441n]

>>> 4641856941n ^ [2 3]
[21546835860709877481n, 100017329596623853972439445621n]
```

Scatter plot of first two-thousand terms of Oeis [A265326](https://oeis.org/A265326):

~~~
{ :n |
	let m = n.nthPrime;
	m - m.integerDigits(2).reversed.fromDigits(2)
}.map(1:2000).scatterPlot
~~~

Scatter plot of first two-thousand terms of Oeis [A117966](https://oeis.org/A117966):

~~~
{ :i |
	i.integerDigits(3).collect { :n |
		(n = 2).if { -1 } { n }
	}.fromDigits(3)
}.map(0:2000).scatterPlot
~~~

* * *

See also: digitCount

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Digit.html)
[2](https://reference.wolfram.com/language/ref/IntegerDigits.html)
