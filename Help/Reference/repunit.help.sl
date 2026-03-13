# repunit

- _repunit(n, b=10)_

Answer the _n_-th repunit in base _b_.

Calculate the table of the first five repunits in bases two through twelve,
threads over lists:

```
>>> 2:12.collect { :b |
>>> 	1:5.repunit(b)
>>> }
[
	1 3 7 15 31;
	1 4 13 40 121;
	1 5 21 85 341;
	1 6 31 156 781;
	1 7 43 259 1555;
	1 8 57 400 2801;
	1 9 73 585 4681;
	1 10 91 820 7381;
	1 11 111 1111 11111;
	1 12 133 1464 16105;
	1 13 157 1885 22621
]
```

Repunits in base ten,
OEIS [A002275](https://oeis.org/A002275):

```
>>> 0:7.repunit(10)
[0 1 11 111 1111 11111 111111 1111111]

>>> (10 ^ 0:7 - 1) / 9
[0 1 11 111 1111 11111 111111 1111111]

>>> [11 -10].linearRecurrence([0 1], 8)
[0 1 11 111 1111 11111 111111 1111111]
```

Twice base ten repunits,
OEIS [A002276](https://oeis.org/A002276):

```
>>> 0:7.repunit(10) * 2
[0 2 22 222 2222 22222 222222 2222222]

>>> 2 * (10 ^ 0:7 - 1) / 9
[0 2 22 222 2222 22222 222222 2222222]

>>> [11 -10].linearRecurrence([0 2], 8)
[0 2 22 222 2222 22222 222222 2222222]
```

Thrice base ten repunits,
OEIS [A002277](https://oeis.org/A002277):

```
>>> 0:7.repunit(10) * 3
[0 3 33 333 3333 33333 333333 3333333]

>>> 3 * (10 ^ 0:7 - 1) / 9
[0 3 33 333 3333 33333 333333 3333333]

>>> [11 -10].linearRecurrence([0 3], 8)
[0 3 33 333 3333 33333 333333 3333333]
```

_(4^n-1)/3_,
OEIS [A002450](https://oeis.org/A002450):

```
>>> (4 ^ 0:9 - 1) / 3
[0 1 5 21 85 341 1365 5461 21845 87381]
```

* * *

See also: ^, /

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Repunit.html),
_OEIS_
[1](https://oeis.org/A000225)
[2](https://oeis.org/A003462)
[3](https://oeis.org/A002450)
[4](https://oeis.org/A003463)
[5](https://oeis.org/A003464)
[6](https://oeis.org/A023000)
[7](https://oeis.org/A023001)
[8](https://oeis.org/A002452)
[9](https://oeis.org/A002275)
[10](https://oeis.org/A016123)
[11](https://oeis.org/A016125),
_W_
[1](https://en.wikipedia.org/wiki/Repunit)
