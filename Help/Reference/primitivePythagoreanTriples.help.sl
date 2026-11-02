# primitivePythagoreanTriples

- _primitivePythagoreanTriples(k)_

Answer the primitive pythagorean triples _(a,b,c)_ up to _a<2k+1_:

First few terms,
OEIS
_a_=[A020884](https://oeis.org/A020884),
_b_=[A156678](https://oeis.org/A156678),
_c_=[A156679](https://oeis.org/A156679):

```
>>> let k = 20;
>>> .primitivePythagoreanTriples
>>> .transpose
[
	 3  5  7  8  9
	11 12 13 15 16
	17 19 20 20 21
	23 24 25 27 28
	28 29 31 32 33
	33 35 36 36 37
	39 39 40;
	  4  12  24  15  40
	 60  35  84 112  63
	144 180  21  99 220
	264 143 312 364  45
	195 420 480 255  56
	544 612  77 323 684
	 80 760 399;
	  5  13  25  17  41
	 61  37  85 113  65
	145 181  29 101 221
	265 145 313 365  53
	197 421 481 257  65
	545 613  85 325 685
	 89 761 401
]
```

First few _b_-terms,
OEIS [A156678](https://oeis.org/A156678):

~~~spl svg=A oeis=A156678
25.primitivePythagoreanTriples
.column(2)
.discretePlot
~~~

![](Help/Image/primitivePythagoreanTriples-A.svg)

* * *

See also: isPrimitivePythagoreanTriple

Guides: Integer Functions
