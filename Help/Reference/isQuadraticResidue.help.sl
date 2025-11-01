# isQuadraticResidue

- _isQuadraticResidue(q, p)_

Answer `true` if _q_ is a quadratic residue modulo _p_.

For _q=0_ and _q=1_ trivially true:

```
>>> isQuadraticResidue(0, 8)
true

>>> isQuadraticResidue(1, 8)
true
```

Six is a quadratic residue modulo ten:

```
>>> isQuadraticResidue(6, 10)
true

>>> 4.square % 10
6
````

The complete list of quadratic residues modulo ten:

```
>>> 1:9.select { :q |
>>> 	isQuadraticResidue(q, 10)
>>> }
[1 4 5 6 9]

>>> 1:9.collect { :q |
>>> 	powerMod(q, 2, 10)
>>> }
[1 4 9 6 5 6 9 4 1]
```

Plot boolean triangle:

~~~spl png=A
1:100.triangularArray(
	isQuadraticResidue:/2
).boole.padLeft.Bitmap
~~~

![](sw/spl/Help/Image/isQuadraticResidue-A.png)

* * *

See also: quadraticNonresidues, quadraticResidues

Guides: Integer Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/QuadraticResidue.html),
_W_
[1](https://en.wikipedia.org/wiki/Quadratic_residue)
