# numberDecompose

- _numberDecompose(x, [b₁ b₂ …])_

Answer a list of coefficients of a decomposition of the number _x_ in the basis sequence _b_.

The basis must be of non-increasing positive numbers.
The result has the same length of the basis, even if the initial coefficients are zero.
The initial coefficients are integers, but the last may or may not be exact.

Decompose an amount of money in different denominations:

```
>>> let x = 598.32;
>>> let u = [100 50 20 10 5 2 1];
>>> x.numberDecompose(u)
[5 1 2 0 1 1 1.32]
```

Decompose an amount of seconds in days, hours, minutes, and seconds:

```
>>> let x = 100000;
>>> let u = [86400 3600 60 1];
>>> x.numberDecompose(u)
[1 3 46 40]
```

Decompose an exact number using a basis of exact numbers:

```
>>> let u = [10 5 2 1];
>>> 99.numberDecompose(u)
[9 1 2 0]

>>> let u = [10 5 2 1];
>>> 99/2.numberDecompose(u)
[4 1 2 1/2]
```

Use inexact numbers:

```
>>> let u = [1.e 1];
>>> 10.pi.numberDecompose(u)
[11 1.51483]
```

Decompose a negative number:

```
>>> let u = [10 5 2 1];
>>> -99.numberDecompose(u)
[-9, -1, -2, 0]
```

This is equivalent to the negative of the decomposition of its absolute value:

```
>>> let u = [10 5 2 1];
>>> 99.numberDecompose(u).-
[-9, -1, -2, 0]
```

Decompose an amount of United States dollars in the available banknote denominations:

```
>>> let u = [100 50 20 10 5 2 1];
>>> 672.numberDecompose(u)
[6 1 1 0 0 1 0]
```

Decompose an amount of Bahamian dollars in the available banknote denominations:

```
>>> let u = [100 50 20 10 5 3 2 1 1/2];
>>> 598.50.numberDecompose(u)
[5 1 2 0 1 1 0 0 1]
```

`numberCompose` is the inverse:

```
>>> let u = [86400 3600 60 1];
>>> 513134.numberDecompose(u)
[5 22 32 14]

>>> let u = [86400 3600 60 1];
>>> [5 22 32 14].numberCompose(u)
513134
```

`integerDigits` is equivalent to `numberDecompose` for an adequate choice of basis of units:

```
>>> 54321.integerDigits(10)
[5 4 3 2 1]

>>> let u = 1E4.powerRange(1, 1/10);
>>> 54321.numberDecompose(u)
[5 4 3 2 1]
```

`mixedRadixEncode` performs a `numberDecompose` operation:

```
>>> let b = [24 60 60];
>>> 1E4.mixedRadixEncode(b)
[2 46 40]

>>> let u = [60 * 60, 60, 1];
>>> 1E4.numberDecompose(u)
[2 46 40]
```

* * *

See also: numberCompose, quotientRemainder, integerPartitions, integerDigits, mixedRadixEncode

Guides: Integer Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/NumberDecompose.html)
