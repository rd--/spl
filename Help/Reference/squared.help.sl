# squared

- _squared(n)_

Answer the number _n_ multiplied by itself.

```
>>> (3 * 3, 3 ^ 2, 3.squared)
(9, 9, 9)
```

At `List`:

```
>>> [1 2 3 4].squared
[1 4 9 16]
```

The inverse is `sqrt`:

```
>>> 3.squared.sqrt
3
```

Threads over lists:

```
>>> 1:9.sum.squared
2025
```

More generally, the difference of the squares of two numbers is the product of their sum and their difference:

```
>>> let a = 47;
>>> let b = 53;
>>> a.squared - b.squared
(a + b) * (a - b)
```

The sum of the n first square numbers,
the square pyramidal numbers:

```
>>> 0:15.collect { :n |
>>> 	n * (n + 1) * ((2 * n) + 1)
>>> } / 6
[
	   0    1    5   14   30
	  55   91  140  204  285
	 385  506  650  819 1015
	1240
]
```

Where supported `squared` is displayed as ².

* * *

See also: ^, *, cubed, squarePyramidalNumber, sqrt

Guides: Integer Sequences

References:
_Mathematica_
[1](https://mathworld.wolfram.com/SquareNumber.html),
_OEIS_
[1](https://oeis.org/A000290),
_Smalltalk_
5.6.2.35,
_W_
[1](https://en.wikipedia.org/wiki/Square_number)

Unicode: U+00B2 ² Superscript Two
