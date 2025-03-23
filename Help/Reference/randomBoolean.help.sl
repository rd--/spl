# randomBoolean

- _randomBoolean(r, p, ⍴)_

Answer either `false` or `true` at random,
with probablity _p_,
in an array of shape ⍴,
utilising the random number generator _r_.

A random 3×3 matrix of boolean values,
with equal probablity of being `zero` or `one`:

```
>>> let rng = Sfc32(194783);
>>> rng.randomBoolean(0.5, [3 3])
[
	false true true;
	true false false;
	false false true
]
```

A random 4×4 matrix of boolean values,
biased towards `true` values:

```
>>> let rng = Sfc32(380142);
>>> rng.randomBoolean(0.85, [4 4])
[
	true true true false;
	false true false false;
	true false true true;
	true true true true
]
```

* * *

See also: atRandom, randomBit, randomComplex, randomInteger, randomReal, seedRandom

Guides: Random Number Generators

Categories: Random
