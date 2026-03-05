# implies

- _implies(p, q:/0)_

The logical implication _p→q_,
equivalent to _¬p∨q_.

Truth table for `implies`,

```
>>> { :a :b |
>>> 	a.implies { b }
>>> }.table([true false], [true false])
[
	true false;
	true true
]
```

* * *

See also: bitImplies, not, or

Guides: Boolean Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Implies.html)
[2](https://reference.wolfram.com/language/ref/Implies.html),
_W_
[1](https://en.wikipedia.org/wiki/Logical_consequence)
