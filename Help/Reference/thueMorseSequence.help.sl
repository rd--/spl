# thueMorseSequence

- _thueMorseSequence(n)_

Answer the first _n_ elements of the Thue-Morse sequence.

First few terms,
OEIS [A010060](http://oeis.org/A010060):

```
>>> (2 ^ 0:5).collect { :k |
>>> 	k.thueMorseSequence.stringJoin
>>> }
[
	'0'
	'01'
	'0110'
	'01101001'
	'0110100110010110'
	'01101001100101101001011001101001'
]
```

Prefix sum,
OEIS [A115384](https://oeis.org/A115384):

```
>>> 23.thueMorseSequence.prefixSum.stepPlot
[
	 0  1  2  2  3  3  3  4  5  5
	 5  6  6  7  8  8  9  9  9 10
	10 11 12
]
```

With values _1,2_,
OEIS [A001285](https://oeis.org/A001285):

```
>>> (2 ^ 0:5).collect { :k |
>>> 	(k.thueMorseSequence + 1)
>>> 	.stringJoin
>>> }
[
	'1'
	'12'
	'1221'
	'12212112'
	'1221211221121221'
	'12212112211212212112122112212112'
]
```

Prefix sum of the _1,2_ sequence,
OEIS [A026430](https://oeis.org/A026430):

```
>>> (23.thueMorseSequence + 1)
>>> .prefixSum
[
	 1  3  5  6  8  9 10 12 14 15
	16 18 19 21 23 24 26 27	28 30
	31 33 35
]
```

Plot first few terms of
OEIS [A010060](http://oeis.org/A010060):

~~~spl svg=A
99.thueMorseSequence
.discretePlot
~~~

![](sw/spl/Help/Image/thueMorseSequence-A.svg)

The first differences of the Thue–Morse sequence form an infinite square-free word over an alphabet of size three,
OEIS [A029883](https://oeis.org/A029883):

```
>>> 24.thueMorseSequence.differences
[
	1  0 -1  1 -1  0  1  0 -1
	0  1 -1  1  0 -1  1 -1  0
	1 -1  1  0 -1
]
```

Plot first few terms of
OEIS [A029883](https://oeis.org/A029883):

~~~spl svg=B
99.thueMorseSequence
.differences
.discretePlot
~~~

![](sw/spl/Help/Image/thueMorseSequence-B.svg)

Plot sequence as series of turns:

~~~spl svg=C
(67.thueMorseSequence * 1/3.pi)
.anglePath
.Line
~~~

![](sw/spl/Help/Image/thueMorseSequence-C.svg)

Plot prefix sum,
OEIS [A115384](https://oeis.org/A115384):

~~~spl svg=D
35.thueMorseSequence.prefixSum.stepPlot
~~~

![](sw/spl/Help/Image/thueMorseSequence-D.svg)

* * *

See also: grayDecode, hammingWeight, integerDigits, thueMorse

Guides: Integer Sequence Functions, Mathematical Sequences

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Thue-MorseSequence.html),
_OEIS_
[1](http://oeis.org/A010060)
[2](https://oeis.org/A029883),
_W_
[1](https://en.wikipedia.org/wiki/Thue%E2%80%93Morse_sequence)
[2](https://en.wikipedia.org/wiki/Square-free_word)
[3](https://en.wikipedia.org/wiki/K-regular_sequence)

Categories: Math, Sequence
