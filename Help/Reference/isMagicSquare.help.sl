# isMagicSquare

- _isMagicSquare(m)_

Answer `true` if the matrix _m_ is a magic square.

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

* * *

See also: isLatinSquare, magicSquare, magicSquareSummary

Guides: Magic Square Functions, Matrix Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/MagicSquare.html),
_W_
[1](https://en.wikipedia.org/wiki/Magic_square)

Categories: Testing
