# quadraticResidues

- _quadraticResidues(p)_

Answer the list of positive quadratic residues modulo _p_.

Quadratic residues of twenty-three:

```
>>> 23.quadraticResidues
[1 2 3 4 6 8 9 12 13 16 18]
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

Table of nonzero quadratic residues modulo _p_,
OEIS [A046071](https://oeis.org/A046071):

```
>>> 2:22.collect(
>>> 	quadraticResidues:/1
>>> )
[
	1;
	1;
	1;
	1 4;
	1 3 4;
	1 2 4;
	1 4;
	1 4 7;
	1 4 5 6 9;
	1 3 4 5 9;
	1 4 9;
	1 3 4 9 10 12;
	1 2 4 7 8 9 11;
	1 4 6 9 10;
	1 4 9;
	1 2 4 8 9 13 15 16;
	1 4 7 9 10 13 16;
	1 4 5 6 7 9 11 16 17;
	1 4 5 9 16;
	1 4 7 9 15 18;
	1 3 4 5 9 11 12 14 15 16 20
]
```

The table above is the list of sets of the following triangular array,
OEIS [A048152](https://oeis.org/A048152):

```
>>> 1:12.triangularArray { :q :p |
>>> 	(p ^ 2) % q
>>> }
[
	0;
	1 0;
	1 1 0;
	1 0 1 0;
	1 4 4 1 0;
	1 4 3 4 1 0;
	1 4 2 2 4 1 0;
	1 4 1 0 1 4 1 0;
	1 4 0 7 7 0 4 1 0;
	1 4 9 6 5 6 9 4 1 0;
	1 4 9 5 3 3 5 9 4 1 0;
	1 4 9 4 1 0 1 4 9 4 1 0
]
```

Table,
read by rows,
where _n_-th row contains all quadratic residues,
including zero,
modulo _n_,
OEIS [A096008](https://oeis.org/A096008):

```
>>> 1:20.collect { :n |
>>> 	(0 .. n - 1).collect { :k |
>>> 		powerMod(k, 2, n)
>>> 	}.nub.sort
>>> }
[
	0;
	0 1;
	0 1;
	0 1;
	0 1 4;
	0 1 3 4;
	0 1 2 4;
	0 1 4;
	0 1 4 7;
	0 1 4 5 6 9;
	0 1 3 4 5 9;
	0 1 4 9;
	0 1 3 4 9 10 12;
	0 1 2 4 7 8 9 11;
	0 1 4 6 9 10;
	0 1 4 9;
	0 1 2 4 8 9 13 15 16;
	0 1 4 7 9 10 13 16;
	0 1 4 5 6 7 9 11 16 17;
	0 1 4 5 9 16
]
```

The quadratic residues modulo _p_ which are coprime to _p_,
OEIS [A096103](https://oeis.org/A096103):

```
>>> 2:17.collect { :p |
>>> 	p.quadraticResidues.select { :q |
>>> 		q.isCoprime(p)
>>> 	}
>>> }
[
	1;
	1;
	1;
	1 4;
	1;
	1 2 4;
	1;
	1 4 7;
	1 9;
	1 3 4 5 9;
	1;
	1 3 4 9 10 12;
	1 9 11;
	1 4;
	1 9;
	1 2 4 8 9 13 15 16
]
```

Number of nonzero quadratic residues,
OEIS [A105612](https://oeis.org/A105612):

~~~spl svg=A
2:75.collect { :p |
	p.quadraticResidues.size
}.stepPlot
~~~

![](sw/spl/Help/Image/quadraticResidues-A.svg)

Largest quadratic residues,
OEIS [A047210](https://oeis.org/A047210):

~~~spl svg=B
2:75.collect { :p |
	p.quadraticResidues.last
}.stepPlot
~~~

![](sw/spl/Help/Image/quadraticResidues-B.svg)

The quadratic residues modulo _p_ which are coprime to _p_,
OEIS [A096103](https://oeis.org/A096103):

~~~spl svg=C
2:30.collect { :p |
	p.quadraticResidues.select { :q |
		q.isCoprime(p)
	}
}.catenate.scatterPlot
~~~

![](sw/spl/Help/Image/quadraticResidues-C.svg)

* * *

See also: isQuadraticResidue, quadraticNonresidues

Guides: Integer Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/QuadraticResidue.html),
_OEIS_
[1](https://oeis.org/A046071)
[2](https://oeis.org/A096008)
[3](https://oeis.org/A105612)
[4](https://oeis.org/A047210)
[5](https://oeis.org/A096103)
[6](https://oeis.org/A048152),
_W_
[1](https://en.wikipedia.org/wiki/Quadratic_residue)
