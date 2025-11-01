# isCubicResidue

- _isCubicResidue(q, p)_

Answer `true` if _q_ is a cubic residue modulo _p_.

For _q=0_ and _q=1_ trivially true:

```
>>> isCubicResidue(0, 8)
true

>>> isCubicResidue(1, 8)
true
```

Eight is a cubic residue modulo nine:

```
>>> isCubicResidue(8, 9)
true

>>> 2.cube % 9
8
````

The complete list of cubic residues modulo nine:

```
>>> let p = 9;
>>> (0 .. p - 1).select { :q |
>>> 	isCubicResidue(q, p)
>>> }
[0 1 8]

>>> let p = 9;
>>> (0 .. p - 1).collect { :q |
>>> 	powerMod(q, 3, p)
>>> }
[0 1 8 0 1 8 0 1 8]
```

Number of distinct cubic residues modulo _n_,
OEIS [A046530](https://oeis.org/A046530):

```
>>> 1:75.collect { :p |
>>> 	1:p.select { :q |
>>> 		isCubicResidue(q, p)
>>> 	}.size
>>> }
[
	 1  2  3  3  5  6  3  5  3 10
	11  9  5  6 15 10 17  6  7 15
	 9 22 23 15 21 10  7  9 29 30
	11 19 33 34 15  9 13 14 15 25
	41 18 15 33 15 46 47 30 15 42
	51 15 53 14 55 15 21 58 59 45
	21 22  9 37 25 66 23 51 69 30
	71 15 25 26 63
]
```

Plot boolean triangle:

~~~spl png=A
1:100.triangularArray(
	isCubicResidue:/2
).boole.padLeft.Bitmap
~~~

![](sw/spl/Help/Image/isCubicResidue-A.png)

* * *

See also: quadraticNonresidues, quadraticResidues

Guides: Integer Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/CubicResidue.html),
_OEIS_
[1](https://oeis.org/A046530)
