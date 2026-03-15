# fromDigits

- _fromDigits([x₁ x₂ …], b)_

Constructs an integer from the sequence _x_ of digits in radix _b_.

Construct a number from its base-10 digits:

```
>>> [5 1 2 8].fromDigits(10)
5128
```

Base-2 digits:

```
>>> [1 0 1 1 0 1 1].fromDigits(2)
91
```

Digits larger than the base are "carried":

```
>>> [7 11 0 0 0 122].fromDigits(10)
810122
```

Calculate the first few decimal Smarandache–Wellin numbers,
OEIS [A019518](https://oeis.org/A019518):

```
>>> 1:9.collect { :n |
>>> 	n.primesList.collect(
>>> 		integerDigits:/1
>>> 	).flatten.fromDigits(10)
>>> }
[
	2
	23
	235
	2357
	235711
	23571113
	2357111317
	235711131719
	23571113171923
]
```

If _b_ is a large integer, so is the answer:

```
>>> [1 2 3].fromDigits(10L)
123L
```

Decimal expansion of the SI unit c,
the speed of light in vacuum,
_c=299792458m/s_,
OEIS [A003678](https://oeis.org/A003678):

```
>>> [2 9 9 7 9 2 4 5 8].fromDigits
299792458
```

Binary expansions as decimal numbers,
OEIS [A007088](https://oeis.org/A007088):

```
>>> 0:15.collect { :i |
>>> 	i.integerDigits(2)
>>> 	.fromDigits(10)
>>> }
[
	0 1 10 11 100 101 110 111 1000 1001
	1010 1011 1100 1101 1110 1111
]
```

Restricted growth string for the decimal expansion of the number _n_,
OEIS [A123895](https://oeis.org/A123895):

```
>>> 0:68.collect { :n |
>>> 	let d = [0] ++ n.integerDigits;
>>> 	let b = d.deleteDuplicates;
>>> 	let a = [0 .. b.size];
>>> 	d.collect { :i |
>>> 		let j = b.indexOf(i);
>>> 		a[j]
>>> 	}.withoutLeadingZeroes
>>> }.collect(fromDigits:/1)
[
	 0  1  1  1  1  1  1  1  1  1
	10 11 12 12 12 12 12 12 12 12
	10 12 11 12 12 12 12 12 12 12
	10 12 12 11 12 12 12 12 12 12
	10 12 12 12 11 12 12 12 12 12
	10 12 12 12 12 11 12 12 12 12
	10 12 12 12 12 12 11 12 12
]
```

Reverse binary digits,
OEIS [A030101](https://oeis.org/A030101):

```
>>> 0:78.collect { :i |
>>> 	i.integerDigits(2)
>>> 	.reverse
>>> 	.fromDigits(2)
>>> }
[
	  0   1   1   3   1
	  5   3   7   1   9
	  5  13   3  11   7
	 15   1  17   9  25
	  5  21  13  29   3
	 19  11  27   7  23
	 15  31   1  33  17
	 49   9  41  25  57
	  5  37  21  53  13
	 45  29  61   3  35
	 19  51  11  43  27
	 59   7  39  23  55
	 15  47  31  63   1
	 65  33  97  17  81
	 49 113   9  73  41
	105  25  89  57
]
```

At empty list answers `zero`:

```
>>> [].fromDigits(10)
0

>>> [].fromDigits(2)
0
```

Convert from balanced ternary:

```
>>> [
>>> 	1  -1 -1  0 -1  1  0 -1  0  1
>>> 	-1 -1  1  1  1 -1  1 -1  1  0
>>> ].fromDigits(3)
635639340
```

Numbers in base three,
OEIS [A007089](https://oeis.org/A007089):

```
>>> 0:26.collect { :n |
>>> 	n.integerDigits(3)
>>> 	.fromDigits(10)
>>> }
[
	0 1 2
	10 11 12 20 21 22
	100 101 102 110 111 112 120 121 122
	200 201 202 210 211 212 220 221 222
]
```

Numbers in base four,
OEIS [A007090](https://oeis.org/A007090):

```
>>> 0:15.collect { :n |
>>> 	n.integerDigits(4)
>>> 	.fromDigits(10)
>>> }
[
	00 01 02 03
	10 11 12 13
	20 21 22 23
	30 31 32 33
]
```

Nine written in base _10-n_,
OEIS [A001731](https://oeis.org/A001731):

```
>>> 10:1:-1.collect { :n |
>>> 	9.integerDigits(n)
>>> 	.fromDigits
>>> }
[9 10 11 12 13 14 21 100 1001 111111111]
```

Eight written in base _9-n_,
OEIS [A001732](https://oeis.org/A001732):

```
>>> 10:1:-1.collect { :n |
>>> 	8.integerDigits(n)
>>> 	.fromDigits
>>> }
[8 8 10 11 12 13 20 22 1000 11111111]
```

Seven written in base _9-n_,
OEIS [A001733](https://oeis.org/A001733):

```
>>> 10:1:-1.collect { :n |
>>> 	7.integerDigits(n)
>>> 	.fromDigits
>>> }
[7 7 7 10 11 12 13 21 111 1111111]
```

Binary reversal,
OEIS [A030101](https://oeis.org/A030101):

~~~spl svg=A oeis=A030101
0:200.collect { :i |
	i.integerDigits(2)
	.reverse
	.fromDigits(2)
}.scatterPlot
~~~

![](sw/spl/Help/Image/fromDigits-A.svg)

Sum of digits in ascending and descending sequence,
OEIS [A052008](https://oeis.org/A052008):

~~~spl svg=B oeis=A052008
0:200.collect { :n |
	let d = n.integerDigits.sort;
	d.fromDigits + d.reverse.fromDigits
}.scatterPlot
~~~

![](sw/spl/Help/Image/fromDigits-B.svg)

Write _n_ and _3n_ in ternary and add all digits modulo three,
OEIS [A242399](https://oeis.org/A242399):

~~~spl svg=C oeis=A242399
0:80.collect { :n |
	let a = n.integerDigits(3);
	let b = (n * 3).integerDigits(3);
	let c = a.padLeft([b.size], 0);
	(b + c % 3).fromDigits(3)
}.scatterPlot
~~~

![](sw/spl/Help/Image/fromDigits-C.svg)

Difference between _4n_ and _n_ and _3n_ written in ternary and all digits summed modulo three,
OEIS [A242400](https://oeis.org/A242400):

~~~spl svg=D oeis=A242400
0:80.collect { :n |
	let a = n.integerDigits(3);
	let b = (n * 3).integerDigits(3);
	let c = a.padLeft([b.size], 0);
	(n * 4) - (b + c % 3).fromDigits(3)
}.scatterPlot
~~~

![](sw/spl/Help/Image/fromDigits-D.svg)

Tersum _n+n_,
OEIS [A004488](https://oeis.org/A004488):

~~~spl svg=E oeis=A004488
0:80.collect { :n |
	let d = n.integerDigits(3);
	(3 - d % 3).fromDigits(3)
}.scatterPlot
~~~

![](sw/spl/Help/Image/fromDigits-E.svg)

Write _n_ in quaternary and swap digits one and three,
OEIS [A048647](https://oeis.org/A048647):

~~~spl svg=F oeis=A048647
0:255.collect { :n |
	let d = n.integerDigits(4);
	let e = d.collect { :i |
		(i = 0).if { 0 } { 4 - i }
	};
	e.fromDigits(4)
}.scatterPlot
~~~

![](sw/spl/Help/Image/fromDigits-F.svg)

Rebase _n_ from four to two,
OEIS [A065362](https://oeis.org/A065362):

~~~spl svg=G oeis=A065362
1:115.integerDigits(4).fromDigits(2)
.scatterPlot
~~~

![](sw/spl/Help/Image/fromDigits-G.svg)

* * *

See also: digitCount, fromContinuedFraction, integerDigits, powerRange, rationalize

Guides: Bitwise Functions, Integer Functions, Integer Sequence Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Ternary.html),
_OEIS_
[1](https://oeis.org/A019518)
[2](https://oeis.org/A007088)
[3](https://oeis.org/A030101)

Categories: Converting
