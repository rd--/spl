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

Plot first few terms:

~~~spl svg=A
0:200.collect { :i |
	i.integerDigits(2)
	.reverse
	.fromDigits(2)
}.scatterPlot
~~~

![](sw/spl/Help/Image/fromDigits-A.svg)

* * *

See also: digitCount, fromContinuedFraction, integerDigits, powerRange, rationalize

Guides: Bitwise Functions, Integer Functions, Integer Sequence Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/FromDigits.html),
_OEIS_
[1](https://oeis.org/A019518)
[2](https://oeis.org/A007088)
[3](https://oeis.org/A030101)

Categories: Converting
