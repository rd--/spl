# aliquotSequence

- _aliquotSequence(n, k=21)_

Answer the aliquot sequence starting at _n_,
to at most _k_ places.

A sequence that ends at `one`:

```
>>> 10.aliquotSequence
[10 8 7 1]
```

A perfect number has a repeating aliquot sequence of period one:

```
>>> 6.aliquotSequence
[6]
```

An amicable number has a repeating aliquot sequence of period two:

```
>>> 220.aliquotSequence
[220 284]
```

Aspiring numbers are eventually periodic:

```
>>> 95.aliquotSequence
[95 25 6]
```

A sociable number has a periodic sequence,
the only two sociable numbers below one million have periods five and twenty-eight,
OEIS [A072891](https://oeis.org/A072891) and
OEIS [A072890](https://oeis.org/A072890):

```
>>> 12496.aliquotSequence
[12496 14288 15472 14536 14264]

>>> 14316.aliquotSequence(5)
[14316 19116 31704 47616 83328]
```

Aliquot sequences that do not reach one,
threads over lists:

```
>>> [6 25 28].aliquotSequence
[6; 25 6; 28]
```

Aliquot sequences that reach one,
OEIS [A032451](https://oeis.org/A032451):

```
>>> 1:32.aliquotSequence
>>> .select { :x | x.last = 1 }
[
	1;
	2 1;
	3 1;
	4 3 1;
	5 1;
	7 1;
	8 7 1;
	9 4 3 1;
	10 8 7 1;
	11 1;
	12 16 15 9 4 3 1;
	13 1;
	14 10 8 7 1;
	15 9 4 3 1;
	16 15 9 4 3 1;
	17 1;
	18 21 11 1;
	19 1;
	20 22 14 10 8 7 1;
	21 11 1;
	22 14 10 8 7 1;
	23 1;
	24 36 55 17 1;
	26 16 15 9 4 3 1;
	27 13 1;
	29 1;
	30 42 54 66 78 90 144 259 45 33
		15 9 4 3 1;
	31 1;
	32 31 1
]
```

The length of the aliquot sequences,
OEIS [A044050](https://oeis.org/A044050):

```
>>> 1:50.collect { :n |
>>> 	n.aliquotSequence.size
>>> }
[
	1 2 2 3 2 1 2 3 4 4
	2 7 2 5 5 6 2 4 2 7
	3 6 2 5 2 7 3 1 2 15
	2 3 6 8 3 4 2 7 3 4
	2 14 2 5 7 8 2 6 4 3
]
```

The Aliquot sequence starting at 12,
OEIS [A143090](https://oeis.org/A143090):

```
>>> 12.aliquotSequence
[12 16 15 9 4 3 1]
```

The Aliquot sequence starting at 30,
OEIS [A008885](https://oeis.org/A008885):

```
>>> 30.aliquotSequence
[
	30 42 54 66 78 90 144 259 45 33
	15 9 4 3 1
]
```

The Aliquot sequence starting at 38,
OEIS [A143721](https://oeis.org/A143721):

```
>>> 38.aliquotSequence
[38 22 14 10 8 7 1]
```

The Aliquot sequence starting at 62,
OEIS [A143733](https://oeis.org/A143733):

```
>>> 62.aliquotSequence
[62 34 20 22 14 10 8 7 1]
```

Numbers whose aliquot sequence terminates in a perfect number,
OEIS [A063769](https://oeis.org/A063769):

```
>>> [
>>> 	25 95 119 143 417
>>> 	445 565 608 650 652
>>> 	675 685 783 790 909
>>> 	913
>>> ].collect(aliquotSequence:/1)
[
	25 6;
	95 25 6;
	119 25 6;
	143 25 6;
	417 143 25 6;
	445 95 25 6;
	565 119 25 6;
	608 652 496;
	650 652 496;
	652 496;
	675 565 119 25 6;
	685 143 25 6;
	783 417 143 25 6;
	790 650 652 496;
	909 417 143 25 6;
	913 95 25 6
]

>>> 496.isPerfectNumber
true
```

It not known if some aliquot sequences terminate,
the Aliquot sequence starting at 276,
OEIS [A008892](https://oeis.org/A008892):

```
>>> 276.aliquotSequence(11)
[
	 276  396  696 1104 1872
	3770 3790 3050 2716 2772
	5964
]
```

The length of the aliquot sequences,
OEIS [A044050](https://oeis.org/A044050):

~~~spl svg=A oeis=A044050
1:85.collect { :n |
 	n.aliquotSequence.size
}.discretePlot
~~~

![](Help/Image/aliquotSequence-A.svg)

The Aliquot sequence starting at 276,
OEIS [A008892](https://oeis.org/A008892):

~~~spl svg=B oeis=A008892
276.aliquotSequence(23).log.stepPlot
~~~

![](Help/Image/aliquotSequence-B.svg)

The aliquot sequences up to twenty three that reach one,
OEIS [A032451](https://oeis.org/A032451):

~~~spl svg=C oeis=A032451
1:23.aliquotSequence
.select { :x | x.last = 1 }
.catenate.discretePlot
~~~

![](Help/Image/aliquotSequence-C.svg)

The aliquot sequences up to sixty that reach one,
OEIS [A032451](https://oeis.org/A032451):

~~~spl svg=D oeis=A032451
1:60.aliquotSequence
.select { :x | x.last = 1 }
.catenate.log.scatterPlot
~~~

![](Help/Image/aliquotSequence-D.svg)

* * *

See also: aliquotSum

Guides: Integer Sequence Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/AliquotSequence.html),
_OEIS_
[1](https://oeis.org/A044050)
[2](https://oeis.org/A072890)
[3](https://oeis.org/A008892),
_W_
[1](https://en.wikipedia.org/wiki/Aliquot_sequence)
[2](https://en.wikipedia.org/wiki/Sociable_number)
