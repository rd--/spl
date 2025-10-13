# toothpickSequence

- _toothpickSequence(n)_

Answer the first _n_ terms of the toothpick sequence.

First few terms,
OEIS [A139250](https://oeis.org/A139250):

```
>>> 35.toothpickSequence
[
	  0   1   3   7  11
	 15  23  35  43  47
	 55  67  79  95 123
	155 171 175 183 195
	207 223 251 283 303
	319 347 383 423 483
	571 651 683 687 695
]
```

Plot first few terms:

~~~spl svg=A
200.toothpickSequence.scatterPlot
~~~

![](sw/spl/Help/Image/toothpickSequence-A.svg)

* * *

See also: integerDigits, memoize

Guides: Integer Sequence Functions

References:
_OEIS_
[1](https://oeis.org/A139250),
_W_
[1](https://en.wikipedia.org/wiki/Toothpick_sequence)
