# reducedResidueSystem

- _reducedResidueSystem(anInteger)_

Answer the residue classes relatively prime to _anInteger_.

```
>>> 12.reducedResidueSystem
[1 5 7 11]
```

The cardinality of this set can be calculated using `eulerPhi`:

```
>>> 12.eulerPhi
4
```

Every number in a reduced residue system modulo _n_ is a generator for the additive group of integers modulo _n_:

```
>>> let m = 12;
>>> let r = m.reducedResidueSystem;
>>> let f = { :n |
>>> 	{ :each |
>>> 		(each + n) % m
>>> 	}.iterate(0).next(m)
>>> };
>>> r.collect(f:/1)
[
	0  1  2  3  4  5  6  7  8  9 10 11;
	0  5 10  3  8  1  6 11  4  9  2  7;
	0  7  2  9  4 11  6  1  8  3 10  5;
	0 11 10  9  8  7  6  5  4  3  2  1
]
```

A reduced residue system modulo _n_ is a group under multiplication modulo _n_.

```
>>> let m = 12;
>>> let r = m.reducedResidueSystem;
>>> r.tuples(2).collect(product:/1) % m
[1 5 7 11 5 1 11 7 7 11 1 5 11 7 5 1]
```

* * *

See also: eulerPhi, isCoprime

References:
_Mathematica_
[1](https://mathworld.wolfram.com/ReducedResidueSystem.html).
_W_
[1](https://en.wikipedia.org/wiki/Reduced_residue_system)
