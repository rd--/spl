# isKeithNumber

- _isKeithNumber(n, b=10)_

Answer `true` if the integer _n_ is a Keith number,
also called repetitive fibonacci-like digit number.

Fourteen is a Keith number:

```
>>> 14.isKeithNumber
true

>>> 1 + 4
5

>>> 4 + 5
9

>>> 5 + 9
14
```

Large Keith numbers:

```
>>> 74596893730427
>>> .isKeithNumber
true

>>> 98938191214220718050301312L
>>> .isKeithNumber
true

>>> 5752090994058710841670361653731519L
>>> .isKeithNumber
true
```

Select Keith numbers,
OEIS [A007629](https://oeis.org/A007629):

```
>>> 10:2000.select(isKeithNumber:/1)
[14 19 28 47 61 75 197 742 1104 1537]
```

Prime Keith numbers,
OEIS [A048970](https://oeis.org/A048970):

```
>>> 10:1000.select { :n |
>>> 	n.isKeithNumber & {
>>> 		n.isPrime
>>> 	}
>>> }
[19 47 61 197]
```

Binary Keith numbers,
OEIS [A162724](https://oeis.org/A162724):

```
>>> 1:512.select { :n |
>>> 	n.isKeithNumber(2)
>>> }
[1 2 3 4 8 16 32 64 128 143 256 285 512]
```

Ternary Keith numbers,
OEIS [A188195](https://oeis.org/A188195):

```
>>> 3:900.select { :n |
>>> 	n.isKeithNumber(3)
>>> }
[3 5 6 7 57 102 127 206 217 677 805 840]
```

* * *

See also: integerDigits, sum

Guides: Integer Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/KeithNumber.html)
