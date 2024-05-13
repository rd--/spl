# thueMorseSequence

- _thueMorseSequence(anInteger)_

Answer the first _anInteger_ elements of the Thue-Morse sequence.

```
>>> (2 ^ 0:6).collect { :k |
>>> 	k.thueMorseSequence.stringJoin
>>> }
[
	'0'
	'01'
	'0110'
	'01101001'
	'0110100110010110'
	'01101001100101101001011001101001'
	'0110100110010110100101100110100110010110011010010110100110010110'
]
```

* * *

See also: integerDigits, thueMorse

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Thue-MorseSequence.html),
_W_
[1](https://en.wikipedia.org/wiki/Thue%E2%80%93Morse_sequence)
