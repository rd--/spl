# deBruijnSequenceCount

- _deBruijnSequenceCount(k, n)_

Count the number of de Bruijn sequences of order _n_ on an alphabet of _k_ places.

For a binary alphabet,
OEIS [A016031](https://oeis.org/A016031):

```
>>> let k = 2;
>>> 1:7.collect { :n |
>>> 	deBruijnSequenceCount(k, n)
>>> }
[
	1 1 2 16 2048
	67108864 144115188075855870
]
```

* * *

See also: deBruijnSequence

Guides: Combinatorial Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/deBruijnSequence.html),
_W_
[1](https://en.wikipedia.org/wiki/De_Bruijn_sequence)
