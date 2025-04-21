# hyperfactorial

- _hyperfactorial(anInteger)_

Answer the hyperfactorial of _anInteger_.

```
>>> 5.hyperfactorial
([1 .. 5] ^ [1 .. 5]).product

>>> 10L.hyperfactorial
215779412229418562091680268288L * 1E15

>>> (0 .. 7).collect(hyperfactorial:/1)
[
	1
	1
	4
	108
	27648
	86400000
	4031078400000
	3319766398771200000
]
```

* * *

See also: factorial

Guides: Combinatorial Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Hyperfactorial.html)
[2](https://reference.wolfram.com/language/ref/Hyperfactorial.html)
