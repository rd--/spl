# isMagicSquare

- _isMagicSquare(m)_

Answer `true` if the matrix _m_ is a magic square.

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

* * *

See also: isLatinSquare, magicSquare, magicSquareSummary

Guides: Magic Square Functions, Matrix Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/MagicSquare.html),
_W_
[1](https://en.wikipedia.org/wiki/Magic_square)

Categories: Testing
