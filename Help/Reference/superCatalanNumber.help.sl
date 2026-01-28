# superCatalanNumber

- _superCatalanNumber(n)_

The super Catalan numbers count the number of lattice paths with diagonal steps from _(n,n)_ to _(0,0)_,
which do not touch the diagonal line _x=y_.
Also called the Schröder–Hipparchus numbers.

The first ten super Catalan numbers,
OEIS [A001003](https://oeis.org/A001003):

```
>>> 1:10.collect(superCatalanNumber:/1)
[1 1 3 11 45 197 903 4279 20793 103049]
```

The twenty-fourth super Catalan number:

```
>>> 24.superCatalanNumber
1416461675464871
```

The super-Catalan triangle,
OEIS [A144944](https://oeis.org/A144944):

```
>>> let t = { :p :q |
>>> 	(q = 0).if {
>>> 		1
>>> 	} {
>>> 		(p = q).if {
>>> 			t(p, q - 1)
>>> 		} {
>>> 			t(p, q - 1)
>>> 			+
>>> 			t(p - 1, q)
>>> 			+
>>> 			t(p - 1, q - 1)
>>> 		}
>>> 	}
>>> };
>>> 0:7.collect { :p |
>>> 	0:p.collect { :q |
>>> 		t(p, q)
>>> 	}
>>> }
[
	1;
	1 1;
	1 3 3;
	1 5 11 11;
	1 7 23 45 45;
	1 9 39 107 197 197;
	1 11 59 205 509 903 903;
	1 13 83 347 1061 2473 4279 4279
]
```

* * *

See also: catalanNumber, memoize

Guides: Integer Sequence Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/SuperCatalanNumber.html),
_OEIS_
[1](https://oeis.org/A001003)
[2](https://oeis.org/A006318)
[3](https://oeis.org/A144944),
_W_
[1](https://en.wikipedia.org/wiki/Schr%C3%B6der%E2%80%93Hipparchus_number)
