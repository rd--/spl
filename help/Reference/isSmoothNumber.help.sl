# isSmoothNumber

- _isSmoothNumber(anInteger)_

An integer is _k_-smooth if it has no prime factors _> k_.
The following table the first few k-smooth numbers for small k.

```
>>> 1:512.select { :n | n.isSmoothNumber(2) }
[1 2 4 8 16 32 64 128 256 512]

>>> 1:24.select { :n | n.isSmoothNumber(3) }
[1 2 3 4 6 8 9 12 16 18 24]

>>> 1:15.select { :n | n.isSmoothNumber(7) }
[1 2 3 4 5 6 7 8 9 10 12 14 15]

>>> 1:14.select { :n | n.isSmoothNumber(11) }
[1 2 3 4 5 6 7 8 9 10 11 12 14]
```

The 5-smooth numbers are also called regular numbers:

```
>>> 1:60.select { :n | n.isSmoothNumber(5) }
[
	1 2 3 4 5 6 8 9 10 12 15 16 18 20 24
	25 27 30 32 36 40 45 48 50 54 60
]
```

The largest consecutive 19-smooth numbers:

```
>>> let n = 11859210;
>>> [n, n + 1].collect { :each | each.isSmoothNumber(19) }
[true, true]
```

* * *

See also: primeFactors, primeLimit

References:
_Mathematica_
[1](https://mathworld.wolfram.com/SmoothNumber.html)
