# isSmoothNumber

- _isSmoothNumber(n, k)_

An integer _n_ is _k_-smooth if it has no prime factors _> k_.

List the first few _k_-smooth numbers for small _k_:

```
>>> 1:512.select { :n |
>>> 	n.isSmoothNumber(2)
>>> }
[1 2 4 8 16 32 64 128 256 512]

>>> 1:24.select { :n |
>>> 	n.isSmoothNumber(3)
>>> }
[1 2 3 4 6 8 9 12 16 18 24]

>>> 1:15.select { :n |
>>> 	n.isSmoothNumber(7)
>>> }
[1 2 3 4 5 6 7 8 9 10 12 14 15]

>>> 1:14.select { :n |
>>> 	n.isSmoothNumber(11)
>>> }
[1 2 3 4 5 6 7 8 9 10 11 12 14]
```

The 5-smooth numbers are also called regular numbers:

```
>>> 1:60.select { :n |
>>> 	n.isSmoothNumber(5)
>>> }
[
	1 2 3 4 5 6 8 9 10 12 15 16 18 20 24
	25 27 30 32 36 40 45 48 50 54 60
]

>>> 30:60.select(isRegularNumber:/1)
[30 32 36 40 45 48 50 54 60]
```

There are 34 regular numbers between one and one hundred:

```
>>> 1:100.select { :n |
>>> 	n.isSmoothNumber(5)
>>> }.size
34
```

The 7-smooth numbers are also called humble numbers:

```
>>> 1:99.select { :n |
>>> 	n.isSmoothNumber(7)
>>> }
[
	 1  2  3  4  5  6  7  8  9 10
	12 14 15 16 18 20 21 24 25 27
	28 30 32 35 36 40 42 45 48 49
	50 54 56 60 63 64 70 72 75 80
	81 84 90 96 98
]
```

The largest consecutive 19-smooth numbers:

```
>>> let n = 11859210;
>>> [n, n + 1].collect { :each |
>>> 	each.isSmoothNumber(19)
>>> }
[true, true]
```

Plot sequence of regular numbers:

~~~spl svg=A
1:999.select { :n |
	n.isSmoothNumber(5)
}.linePlot
~~~

![](sw/spl/Help/Image/isSmoothNumber-A.svg)

* * *

See also: isRegularNumber, primeFactors, primeLimit

Guides: Integer Functions, Integer Sequences

References:
_Mathematica_
[1](https://mathworld.wolfram.com/SmoothNumber.html),
_OEIS_
[1](https://oeis.org/A000079)
[2](https://oeis.org/A003586)
[3](https://oeis.org/A051037)
[4](https://oeis.org/A002473)
[5](https://oeis.org/A051038)
[6](https://oeis.org/A080197)
[7](https://oeis.org/A080681)
[8](https://oeis.org/A080682)
[9](https://oeis.org/A080683),
_W_
[1](https://en.wikipedia.org/wiki/Smooth_number)
[2](https://en.wikipedia.org/wiki/Regular_number)

Further Reading: Clarke 1877

Categories: Testing
