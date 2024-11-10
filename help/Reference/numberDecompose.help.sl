# numberDecompose

- _numberDecompose(aNumber, aSequence)_

Answer a list of coefficients of a decomposition of _aNumber_ in the basis _aSequence_.

The basis must be of non-increasing positive numbers.
The result has the same length of the basis, even if the initial coefficients are zero.
The initial coefficients are integers, but the last may or may not be exact.

Decompose an amount of money in different denominations:

```
>>> 598.32.numberDecompose([100 50 20 10 5 2 1])
[5 1 2 0 1 1 1.32]
```

Decompose an amount of seconds in days, hours, minutes, and seconds:

```
>>> 100000.numberDecompose([86400 3600 60 1])
[1 3 46 40]
```

Decompose an exact number using a basis of exact numbers:

```
>>> 99.numberDecompose([10 5 2 1])
[9 1 2 0]

>>> 99/2.numberDecompose([10 5 2 1])
[4 1 2 1/2]
```

Use inexact numbers:

```
>>> 10.pi.numberDecompose([e 1])
[11 1.51483]
```

Decompose a negative number:

```
>>> -99.numberDecompose([10 5 2 1])
[-9, -1, -2, 0]
```

This is equivalent to the negative of the decomposition of its absolute value:

```
>>> 99.numberDecompose([10 5 2 1]).-
[-9, -1, -2, 0]
```

Decompose an amount of United States dollars in the available banknote denominations:

```
>>> let denominations = [100 50 20 10 5 2 1];
>>> 672.numberDecompose(denominations)
[6 1 1 0 0 1 0]
```

Decompose an amount of Bahamian dollars in the available banknote denominations:

```
>>> let denominations = [100 50 20 10 5 3 2 1 1/2];
>>> 598.50.numberDecompose(denominations)
[5 1 2 0 1 1 0 0 1]
```

`numberCompose` is the inverse:

```
>>> let units = [86400 3600 60 1];
>>> 513134.numberDecompose(units)
[5 22 32 14]

>>> let units = [86400 3600 60 1];
>>> [5 22 32 14].numberCompose(units)
513134
```

`integerDigits` is equivalent to `numberDecompose` for an adequate choice of basis of units:

```
>>> 54321.integerDigits(10)
[5 4 3 2 1]

>>> 54321.numberDecompose(1E4.powerRange(1, 1/10))
[5 4 3 2 1]
```

`mixedRadixEncode` performs a `numberDecompose` operation:

```
>>> 1E4.mixedRadixEncode([24 60 60])
[2 46 40]

>>> 1E4.numberDecompose([60 * 60, 60, 1])
[2 46 40]
```

* * *

See also: numberCompose, quotientRemainder, integerPartitions, integerDigits, mixedRadixEncode
