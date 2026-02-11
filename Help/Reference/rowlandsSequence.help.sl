# rowlandsSequence

- _rowlandsSequence(m, n)_

Answer the first _n_ terms of Rowland’s prime-generating sequence,
with initial term _m_.
The _n_-th term is given by _a(n)=a(n-1)+gcd(n,a(n-1))_.

First few terms with _m=7_,
OEIS [A106108](https://oeis.org/A106108):

```
>>> 7.rowlandsSequence(12)
[7 8 9 10 15 18 19 20 21 22 33 36]
```

First few terms with _m=8_,
OEIS [A084663](https://oeis.org/A084663):

```
>>> 8.rowlandsSequence(12)
[8 10 11 12 13 14 21 22 23 24 25 26]
```

First few terms with _m=4_,
OEIS [A084662](https://oeis.org/A084662):

```
>>> 4.rowlandsSequence(12)
[4 6 9 10 15 18 19 20 21 22 33 36]
```

First few terms with _m=5_,
OEIS [A134736](https://oeis.org/A134736):

```
>>> 5.rowlandsSequence(12)
[5 6 9 10 15 18 19 20 21 22 33 36]
```

Least prime in each sequence,
OEIS [A230504](https://oeis.org/A230504):

```
>>> let n = 7;
>>> 1:24.collect { :m |
>>> 	m.rowlandsSequence(n)
>>> 	.detect(isPrime:/1)
>>> }
[
	 2  2  3 19  5 19  7 11 11 17
	11 17 13 17 17 23 17 23 19 23
	23 29 23 29
]
```

The name refers to the first differences,
OEIS [A132199](https://oeis.org/A132199)

```
>>> 7.rowlandsSequence(51)
>>> .differences
[
	1  1 1 5 3  1 1 1 1 11
	3  1 1 1 1  1 1 1 1  1
	1 23 3 1 1  1 1 1 1  1
	1  1 1 1 1  1 1 1 1  1
	1  1 1 1 1 47 3 1 5  3
]
```

Record values,
OEIS [A191304](https://oeis.org/A191304):

```
>>> 7.rowlandsSequence(5000)
>>> .differences
>>> .recordValues
[1 5 11 23 47 101 233 467 941 1889 3779]
```

Deleting ones leaves primes,
OEIS [A137613](https://oeis.org/A137613):

```
>>> 7.rowlandsSequence(500)
>>> .differences
>>> .without(1)
[
	  5 3 11  3 23  3  47 3   5 3
	101 3  7 11  3 13 233 3 467 3
	  5 3
]
```

Without repetitions,
OEIS [A221869](https://oeis.org/A221869):

```
>>> 7.rowlandsSequence(2500)
>>> .differences
>>> .without(1)
>>> .deleteDuplicates
[5 3 11 23 47 101 7 13 233 467 941 1889]
```

Repeated primes,
OEIS [A225487](https://oeis.org/A225487):

```
>>> 7.rowlandsSequence(15000)
>>> .differences
>>> .without(1)
>>> .selectDuplicates
>>> .deleteDuplicates
[5 3 11 7 13]
```

A related sequence by Benoît Cloitre,
in which the ordinarily used `gcd` function is replaced by `lcm`,
OEIS [A135504](https://oeis.org/A135504):

```
>>> 1.rowlandsSequence(10, lcm:/2)
[1 3 6 18 108 216 1728 3456 6912 41472]
```

Delayed divison of the Cloitre sequence,
OEIS [A135506](https://oeis.org/A135506):

```
>>> 1L.rowlandsSequence(89, lcm:/2)
>>> .adjacentPairsCollect(/.swap) - 1
[
	 2  1  2  5  1  7  1  1 5 11
	 1 13  1  5  1 17  1 19 1  1
	11 23  1  5 13  1  1 29 1 31
	 1 11 17  1  1 37  1 13 1 41
	 1 43  1  1 23 47  1  1 1 17
	13 53  1  1  1  1 29 59 1 61
	 1  1  1 13  1 67  1 23 1 71
	 1 73  1  1  1  1 13 79 1  1
	41 83  1  1 43 29  1 89
]
```

Indexes of doublings in the Cloitre sequence,
OEIS [A361461](https://oeis.org/A361461):

```
>>> let k = 47;
>>> let a = 1L.rowlandsSequence(
>>> 	k + 1, lcm:/2
>>> );
>>> 1:k.select { :n |
>>> 	a[n] * 2 = a[n + 1]
>>> }
[
	 2  5  7  8 11 13 15 17 19 20
	23 26 27 29 31 34 35 37 39 41
	43 44 47
]
```

The characteristic function of A361461,
OEIS [A361460](https://oeis.org/A361460):

```
>>> let k = 47;
>>> let a = 1L.rowlandsSequence(
>>> 	k + 1, lcm:/2
>>> );
>>> 1:k.collect { :n |
>>> 	a[n] * 2 = a[n + 1]
>>> }.boole
[
	0 1 0 0 1 0 1 1 0 0
	1 0 1 0 1 0 1 0 1 1
	0 0 1 0 0 1 1 0 1 0
	1 0 0 1 1 0 1 0 1 0
	1 0 1 1 0 0 1
]
```

Plot first few terms,
OEIS [A106108](https://oeis.org/A106108):

~~~spl svg=A
7.rowlandsSequence(200)
.stepPlot
~~~

![](sw/spl/Help/Image/rowlandsSequence-A.svg)

Plot terms of
OEIS [A137613](https://oeis.org/A137613):

~~~spl svg=B
OeisEntry('A137613').then { :e |
	e.bFileData
	.first(250)
	.log
	.scatterPlot
}
~~~

![](sw/spl/Help/Image/rowlandsSequence-B.svg)

Plot terms of
OEIS [A221869](https://oeis.org/A221869):

~~~spl svg=C
OeisEntry('A221869').then { :e |
	e.bFileData
	.first(250)
	.log
	.scatterPlot
}
~~~

![](sw/spl/Help/Image/rowlandsSequence-C.svg)

Step plot of least primes,
OEIS [A230504](https://oeis.org/A230504):

~~~spl svg=D
1:75.collect { :m |
 	m.rowlandsSequence(13)
	.detect(isPrime:/1)
}.stepPlot
~~~

![](sw/spl/Help/Image/rowlandsSequence-D.svg)

Scatter plot of least primes,
OEIS [A230504](https://oeis.org/A230504):

~~~spl svg=E
1:100.collect { :m |
 	m.rowlandsSequence(13)
	.detect(isPrime:/1)
}.scatterPlot
~~~

![](sw/spl/Help/Image/rowlandsSequence-E.svg)

Plot _a(n)/n_,
values are in _(2,3)_:

~~~spl svg=F
let n = 200;
let r = 7.rowlandsSequence(n);
(r / 1:n).
allButFirst(2)
.scatterPlot
~~~

![](sw/spl/Help/Image/rowlandsSequence-F.svg)

Plot delayed divison of the Cloitre sequence,
OEIS [A135506](https://oeis.org/A135506):

~~~spl svg=G
1L.rowlandsSequence(150, lcm:/2)
.adjacentPairsCollect(/.swap)
.scatterPlot
~~~

![](sw/spl/Help/Image/rowlandsSequence-G.svg)

Plot `gcd` of the Cloitre sequence and offset indices,
OEIS [A361470](https://oeis.org/A361470):

~~~spl svg=H
let k = 100;
1L.rowlandsSequence(k - 1, lcm:/2)
.gcd(2:k)
.log
.scatterPlot
~~~

![](sw/spl/Help/Image/rowlandsSequence-H.svg)

Plot _A135506(n)%4=3_,
OEIS [A361463](https://oeis.org/A361463):

~~~spl svg=I
let a = 1L.rowlandsSequence(200, lcm:/2);
let b = a.adjacentPairsCollect(/.swap) - 1;
((b % 4) =.each 3).boole.discretePlot
~~~

![](sw/spl/Help/Image/rowlandsSequence-I.svg)

* * *

See also: gcd, recurrenceTable

Further Reading: Rowland 2008, Cloitre 2025
