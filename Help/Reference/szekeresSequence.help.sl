# szekeresSequence

- _szekeresSequence(n)_

Answer the first _n_ terms of the Szekeres sequence,
which begins _1,2_ and avoids three-term arithmetic progressions.

First few terms:

```
>>> 58.szekeresSequence
[
	  1   2   4   5  10
	 11  13  14  28  29
	 31  32  37  38  40
	 41  82  83  85  86
	 91  92  94  95 109
	110 112 113 118 119
	121 122 244 245 247
	248 253 254 256 257
	271 272 274 275 280
	281 283 284 325 326
	328 329 334 335 337
	338 352 353
]
```

Plot first few terms:

~~~spl svg=A
192.szekeresSequence.scatterPlot
~~~

![](sw/spl/Help/Image/szekeresSequence-A.svg)

* * *

See also: fromDigits, integerDigits, stanleySequence

Guides: Integer Sequence Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/SmarandacheSequences.html),
_OEIS_
[1](https://oeis.org/A003278)
