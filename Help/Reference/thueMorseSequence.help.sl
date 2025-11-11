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

Plot first few terms:

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

Plot first few terms:

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
