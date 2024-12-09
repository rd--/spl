# thueMorseSequence

- _thueMorseSequence(anInteger)_

Answer the first _anInteger_ elements of the Thue-Morse sequence.

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

~~~
99.thueMorseSequence.discretePlot
~~~

![](sw/spl/Help/Image/thueMorseSequence-A.svg)

* * *

See also: integerDigits, thueMorse

Guides: Mathematical Sequences

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Thue-MorseSequence.html),
_OEIS_
[1](http://oeis.org/A010060),
_W_
[1](https://en.wikipedia.org/wiki/Thue%E2%80%93Morse_sequence)

Categories: Math, Sequence
