# quadraticNonresidues

- _quadraticNonresidues(p)_

Answer the list of quadratic nonresidues modulo _p_.

Quadratic nonresidues of twenty-three:

```
>>> 23.quadraticNonresidues
[5 7 10 11 14 15 17 19 20 21 22]
```

Quadratic residues of seventy-three:

```
>>> 73.quadraticResidues
[
	 1  2  3  4  6  8  9 12 16 18
	19 23 24 25 27 32 35 36 37 38
	41 46 48 49 50 54 55 57 61 64
	65 67 69 70 71 72
]
```

Smallest positive quadratic nonresidue modulo _p_,
where p is the n-th prime,
OEIS [A053760](https://oeis.org/A053760):

```
>>> 1:40.collect { :n |
>>> 	n.prime.quadraticNonresidues.first
>>> }
[
	2 2 2 3 2 2 3 2 5 2 3 2 3 2 5 2 2 2 2 7
	5 3 2 3 5 2 3 2 2 3 3 2 3 2 2 3 2 2 5 2
]
```

Calculate using `jacobiSymbol`:

```
>>> 2:40.collect { :n |
>>> 	let p = n.prime;
>>> 	1:p.select { :x |
>>> 		jacobiSymbol(x, p) != 1
>>> 	}.first
>>> }
[
	  2 2 3 2 2 3 2 5 2 3 2 3 2 5 2 2 2 2 7
	5 3 2 3 5 2 3 2 2 3 3 2 3 2 2 3 2 2 5 2
]
```

* * *

See also: isQuadraticResidues, jacobiSymbol, quadraticResidues

Guides: Integer Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/QuadraticResidue.html),
_OEIS_
[1](https://oeis.org/A053760),
_W_
[1](https://en.wikipedia.org/wiki/Quadratic_residue)
