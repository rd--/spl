# select

- _select(c, f:/1)_

Evaluate the block _f_ with each of the elements of the collection _c_ as the argument.
Collect into a new collection like _c_ only those elements for which _f_ evaluates to `true`.
Answer the new collection.

Select elements that are even:

```
>>> [1 2 4 7 6 2].select(isEven:/1)
[2 4 6 2]
```

Select prime numbers:

```
>>> 99:111.select(isPrime:/1)
[101 103 107 109]
```

Use a literal block to test each element:

```
>>> [1 2 4 7 6 2].select { :x |
>>> 	x > 2
>>> }
[4 7 6]
```

Only the first expression selected (c.f. `detect`):

```
>>> [1 2 4 7 6 2].select { :x |
>>> 	x > 2
>>> }.first
4
```

Select operates on values in a dictionary:

```
>>> (a: 1, b: 2, c: 3, d: 4).select { :x |
>>> 	x > 2
>>> }
(c: 3, d: 4)
```

Find pairs containing x:

```
>>> [1 'y'; 2 'x'; 3 'x'; 4 'z'; 5 'x']
>>> .select { :x |
>>> 	x.includes('x')
>>> }
[2 'x'; 3 'x'; 5 'x']
```

Select numbers up to 100 that equal 1 modulo both 3 and 5:

```
>>> 1:100.select { :x |
>>> 	x % 3 = 1 & { x % 5 = 1 }
>>> }
[1 16 31 46 61 76 91]
```

Select characters from a `String`:

```
>>> 'aAbBcC'.select(isLowerCase:/1)
'abc'
```

Retain items that are integers:

```
>>> [1 'x' 2 3 'y' 9 'y'].select(
>>> 	isNumber:/1
>>> )
[1 2 3 9]
```

At a finite `Stream`:

```
>>> [1 .. 9].asStream
>>> .select(isEven:/1)
>>> .upToEnd
[2 4 6 8]
```

At an infinte `Stream`:

```
>>> (1 .. Infinity).asStream
>>> .select(isEven:/1)
>>> .next(4)
[2 4 6 8]
```

At `Sfc32`, which implements `Stream`:

```
>>> Sfc32(188311).collect { :x |
>>> 	(x * 23).round
>>> }.select(isOdd:/1).next(5)
[15 21 5 13 1]
```

Numbers _m_ for which the number of divisors, _τ(m)_, is divisible by three,
OEIS [A059269](https://oeis.org/A059269):

~~~spl svg=A oeis=A059269
1:230.select { :n |
	0.divisorSigma(n).divisible(3)
}.scatterPlot
~~~

![](Help/Image/select-A.svg)

Primes congruent to one or two modulo four,
OEIS [A002313](https://oeis.org/A002313):

~~~spl svg=B oeis=A002313
1:115.prime.select { :n |
	n % 4 != 3
}.discretePlot
~~~

![](Help/Image/select-B.svg)

Numbers _k_ such that _4k+1_ is prime,
OEIS [A005098](https://oeis.org/A005098):

~~~spl svg=C oeis=A005098
1:200.select { :n |
	(4 * n + 1).isPrime
}.discretePlot
~~~

![](Help/Image/select-C.svg)

Numbers of the form _x²+4y²_,
OEIS [A020668](https://oeis.org/A020668):

~~~spl svg=D oeis=A020668
0:200.select { :n |
	2.squaresR(n) != 0 & {
		n % 4 != 2
	}
}.discretePlot
~~~

![](Help/Image/select-D.svg)

Primes of the form _4n+3_,
OEIS [A002145](https://oeis.org/A002145):

~~~spl svg=E oeis=A002145
(1:150 * 4 - 1).select(isPrime:/1)
.discretePlot
~~~

![](Help/Image/select-E.svg)

Primes of the form _6n+1_,
OEIS [A002476](https://oeis.org/A002476):

~~~spl svg=F oeis=A002476
(1:150 * 6 + 1).select(isPrime:/1)
.discretePlot
~~~

![](Help/Image/select-F.svg)

Primes of the form _8n+1_,
OEIS [A007519](https://oeis.org/A007519):

~~~spl svg=G oeis=A007519
(1:170 * 8 + 1).select(isPrime:/1)
.discretePlot
~~~

![](Help/Image/select-G.svg)

One less than primes congruent to one modulo four,
OEIS [A152680](https://oeis.org/A152680):

~~~spl svg=H oeis=A152680
(
	1:100.prime.select { :n |
		n % 4 = 1
	} - 1
).scatterPlot
~~~

![](Help/Image/select-H.svg)

* * *

See also: collect, detect, groupBy, keySelect, reject

Guides: Collection Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Predicate.html)
[2](https://reference.wolfram.com/language/ref/Select.html)
[3](https://reference.wolfram.com/language/ref/Cases.html),
_Python_
[1](https://docs.python.org/3/library/functions.html#filter),
_Smalltalk_
5.7.1.22

Categories: Enumerating
