# isMagicSquare

- _isMagicSquare(m, c=⊤)_

Answer `true` if the matrix _m_ is a magic square.
If _c_ is true requires the sums be equal to the magic constant.

The Jupiter square:

```
>>> [
>>> 	4 14 15 1;
>>> 	9 7 6 12;
>>> 	5 11 10 8;
>>> 	16 2 3 13
>>> ].isMagicSquare
true
```

The square of Mercury:

```
>>> [
>>> 	8 58 59 5 4 62 63 1;
>>> 	49 15 14 52 53 11 10 56;
>>> 	41 23 22 44 45 19 18 48;
>>> 	32 34 35 29 28 38 39 25;
>>> 	40 26 27 37 36 30 31 33;
>>> 	17 47 46 20 21 43 42 24;
>>> 	9 55 54 12 13 51 50 16;
>>> 	64 2 3 61 60 6 7 57
>>> ].isMagicSquare
true
```

The `iota` function does not answer a magic square:

```
>>> [3 3].iota.isMagicSquare
false
```

The `magicSquare` function answers magic squares:

```
>>> 3:7.allSatisfy { :n |
>>> 	n.magicSquare.isMagicSquare
>>> }
true
```

A Latin square need not be a magic square:

```
>>> [
>>> 	1 2 3;
>>> 	2 3 1;
>>> 	3 1 2
>>> ].isMagicSquare
false
```

Magic squares of squares by Euler in 1770,
the sums are not the magic constant:

```
[
	68 29 41 37;
	17 31 79 32;
	59 28 23 61;
	11 77  8 49
].square.isMagicSquare(false)
```

A multimagic square,
where both _m_ and _m^2_ are magic squares,
by Pfeffermann in 1890:

```
>>> let m = [
>>> 	56 34 8 57 18 47 9 31;
>>> 	33 20 54 48 7 29 59 10;
>>> 	26 43 13 23 64 38 4 49;
>>> 	19 5 35 30 53 12 46 60;
>>> 	15 25 63 2 41 24 50 40;
>>> 	6 55 17 11 36 58 32 45;
>>> 	61 16 42 52 27 1 39 22;
>>> 	44 62 28 37 14 51 21 3
>>> ];
>>> (
>>> 	m.isMagicSquare,
>>> 	(m ^ 2).isMagicSquare(false)
>>> )
(true, true)
```

* * *

See also: isLatinSquare, magicSquare, magicSquareSummary

Guides: Magic Square Functions, Matrix Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/MagicSquare.html)
[2](https://mathworld.wolfram.com/MagicConstant.html),
_W_
[1](https://en.wikipedia.org/wiki/Magic_square)
[2](https://en.wikipedia.org/wiki/Magic_square_of_squares)

Categories: Testing
