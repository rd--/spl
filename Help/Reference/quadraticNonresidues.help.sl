# quadraticNonresidues

- _quadraticNonresidues(p)_

Answer the list of quadratic nonresidues modulo _p_.

Quadratic nonresidues of twenty-three,
OEIS [A028736](https://oeis.org/A028736):

```
>>> 23.quadraticNonresidues
[5 7 10 11 14 15 17 19 20 21 22]
```

Quadratic nonresidues of seventy-three,
OEIS [A028786](https://oeis.org/A028786):

```
>>> 73.quadraticNonresidues
[
	 5  7 10 11 13 14 15 17 20 21
	22 26 28 29 30 31 33 34 39 40
	42 43 44 45 47 51 52 53 56 58
	59 60 62 63 66 68
]
```

Smallest positive quadratic nonresidue modulo _p_,
where p is the n-th prime,
OEIS [A053760](https://oeis.org/A053760):

```
>>> 2:40.collect { :n |
>>> 	n.prime.quadraticNonresidues.first
>>> }
[
	  2 2 3 2 2 3 2 5 2 3 2 3 2 5 2 2 2 2 7
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
[1](https://oeis.org/A053760)
[2](https://oeis.org/A028786)
[3](https://oeis.org/A028736),
_W_
[1](https://en.wikipedia.org/wiki/Quadratic_residue)
