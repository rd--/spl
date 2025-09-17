# % (percentSign)

- _m % n_

The modulus operator.

At integer _m_ and _n_:

```
>>> (5 % 3, 5.mod(3))
(2, 2)

>>> (17 % 5, 17.mod(5))
2
```

A number modulo itself is `zero`:

```
>>> (5 % 5, 5.mod(5))
0
```

Zero modulo any number is `zero`:

```
>>> 0 % 5
0
```

_m%n_ is _m-qn_, where _q_ is the quotient of _m/n_, rounded toward zero to an integer:

```
>>> let [m, n] = [5, 3];
>>> m - ((m / n).floor * n)
2
```

At negative _m_:

```
>>> (-5 % 3, -5 % 4, -1 % 3)
(1, 3, 2)
```

At negative _n_, relation to `\\`:

```
>>> (19 % 12, 19 % -12)
(7, -5)

>>> (19 \\ 12, 19 \\ -12)
(7, 7)
```

Rational numbers:

```
>>> 5/2 % 2
1/2
```

Real numbers,
for positive _n_ answer the floating-point remainder of dividing _m_ by _n_:

```
>>> 28.sqrt % 3
(-3 + (2 * 7.sqrt))

>>> 1.pi % 2
(-2 + 1.pi)

>>> (1.pi % 2, 1.pi % -2)
(1.1416, -0.8584)

>>> 1.5 % 1
0.5

>>> -0.5 % 1
0.5
```

`%` threads over lists:

```
>>> [1 2 3 4 5] % 3
[1 2 0 1 2]

>>> [-2 -1 0 1 2 3 4 5] % 2
[0 1 0 1 0 1 0 1]

>>> [5 10 14] % 3.5
[1.5 3 0]
```

For integers,
_a % m_ answers the _common residue_ of _a_ modulo _m_,
i.e. non-negative and smaller than _m_:

```
>>> [-2 -1 12 13] % 12
[10 11 0 1]
```

Fermats little theorem:

```
>>> 7.gcd(11)
1

>>> 7 ^ (11 - 1) % 12
1
```

Eulers theorem:

```
>>> 7.gcd(12)
1

>>> 7 ^ 12.eulerPhi % 12
1
```

`%` is transitive:

```
>>> (5 % 3) = (2 % 3)
true

>>> (2 % 3) = (8 % 3)
true

>>> (8 % 3) = (5 % 3)
true
```

If _n_ divides _m_ then _m % n = 0_:

```
>>> 8.divisible(2)
true

>>> 8 % 2
0
```

For positive _n_,
the second part of the `quotientRemainder` is the same as `%`:

```
>>> 17.quotientRemainder(6)
[2 5]

>>> 17 % 6
5

>>> 17.quotientRemainder(-6)
[-2 5]

>>> 17 % -6
-1
```

The answers have the same sign as the modulus:

```
>>> [5 -5] % 3
[2 1]

>>> [5 -5] % -3
[-1 -2]
```

For a positive real number _x_, _x % 1_ gives the fractional part of _x_:

```
>>> 3.141 % 1
0.141

>>> 3.141.fractionalPart
0.141
```

Modulo of negative number with negative operand:

```
>>> [-5 -4 -3 -2 -1 0] % -5
[0, -4, -3, -2, -1, 0]

>>> [-5.1 -4.1 -3.1 -2.1 -1.1 -0.1] % -5
[-0.1 -4.1 -3.1 -2.1 -1.1 -0.1]
```

At `Symbol`:

```
>> `m` % `n`
(% m n)
```

Plot an integer sequence modulo an integer,
i.e. with a fixed modulus:

~~~spl svg=A
(1:50 % 8).linePlot
~~~

![](sw/spl/Help/Image/percentSign-A.svg)

Plot an integer modulo an integer, i.e. varying the modulus:

~~~spl svg=B
(100 % 1:50).linePlot
~~~

![](sw/spl/Help/Image/percentSign-B.svg)

Binomial coefficients modulo two:

~~~spl png=C
let k = (0L .. 64L);
{ :i :j |
	(i >= j).if {
		i.binomial(j) % 2
	} {
		0
	}
}.table(k, k).Bitmap
~~~

![](sw/spl/Help/Image/percentSign-C.png)

Plot of a spiral matrix where numbers are colored based on their congruence:

~~~spl png=D
(109.spiralMatrix % 109 / 109)
.Graymap
~~~

![](sw/spl/Help/Image/percentSign-D.png)

Modular addition tables:

~~~spl svg=E
{ :a :b |
	a + b % 4
}.table(0:8, 0:8).matrixPlot
~~~

![](sw/spl/Help/Image/percentSign-E.svg)

Modulo sum pattern:

~~~spl svg=F
let m = 7;
let n = 2;
{ :i :j |
	((i % m) + (j % m)) = n
}.table(0:25, 0:25).boole.matrixPlot
~~~

![](sw/spl/Help/Image/percentSign-F.svg)

Simulate a particle bouncing in a noncommensurate box:

~~~spl svg=G
(0, 0.01 .. 15).collect { :t |
	t % [2.sqrt 1]
}.Line
~~~

![](sw/spl/Help/Image/percentSign-G.svg)

The name of this operator is `percentSign`.

* * *

See also: /, //, \\, divisible, minimalResidue, mod, quotient, quotientRemainder, remainder

Guides: Binary Operators

References:
_Apl_
[1](https://aplwiki.com/wiki/Residue),
_Mathematica_
[1](https://mathworld.wolfram.com/Mod.html)
[2](https://mathworld.wolfram.com/Congruence.html)
[3](https://mathworld.wolfram.com/CommonResidue.html)
[4](https://reference.wolfram.com/language/ref/Mod.html),
_W_
[1](https://en.wikipedia.org/wiki/Modulo)

Categories: Math, Operator
