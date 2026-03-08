# figurateNumber

- _figurateNumber(n, k)_

Answer the _n_-th figurate number of kind _k_.

Tetrahedral numbers,
OEIS [A000292](https://oeis.org/A000292):

```
>>> 0:9.figurateNumber(
>>> 	'Tetrahedral'
>>> )
[0 1 4 10 20 35 56 84 120 165]

>>> 0:9.tetrahedralNumber
[0 1 4 10 20 35 56 84 120 165]
```

Heptagonal numbers,
OEIS [A000566](https://oeis.org/A000566):

```
>>> 0:9.figurateNumber(
>>> 	'Heptagonal'
>>> )
[0 1 7 18 34 55 81 112 148 189]

>>> 7.polygonalNumber(0:9)
[0 1 7 18 34 55 81 112 148 189]

>>> [3 -3 1].linearRecurrence(
>>> 	[0 1 7], 10
>>> )
[0 1 7 18 34 55 81 112 148 189]

>>> 1:45:5.prefixSum
[1 7 18 34 55 81 112 148 189]
```

Octahedral numbers,
OEIS [A005900](https://oeis.org/A005900):

```
>>> 0:9.figurateNumber(
>>> 	'Octahedral'
>>> )
[0 1 6 19 44 85 146 231 344 489]

>>> [4 -6 4 -1].linearRecurrence(
>>> 	[0 1 6 19], 10
>>> )
[0 1 6 19 44 85 146 231 344 489]
```

Icosahedral numbers,
OEIS [A006564](https://oeis.org/A006564):

```
>>> 0:9.figurateNumber(
>>> 	'Icosahedral'
>>> )
[0 1 12 48 124 255 456 742 1128 1629]

>>> [4 -6 4 -1].linearRecurrence(
>>> 	[0 1 12 48], 10
>>> )
[0 1 12 48 124 255 456 742 1128 1629]
```

Dodecahedral numbers,
OEIS [A006566](https://oeis.org/A006566):

```
>>> 0:9.figurateNumber(
>>> 	'Dodecahedral'
>>> )
[0 1 20 84 220 455 816 1330 2024 2925]

>>> [4 -6 4 -1].linearRecurrence(
>>> 	[0 1 20 84], 10
>>> )
[0 1 20 84 220 455 816 1330 2024 2925]
```

Rhombic dodecahedral numbers,
OEIS [A005917](https://oeis.org/A005917):

```
>>> 1:9.figurateNumber(
>>> 	'RhombicDodecahedral'
>>> )
[1 15 65 175 369 671 1105 1695 2465]

>>> (0:9 ^ 4).differences
[1 15 65 175 369 671 1105 1695 2465]

>>> [4 -6 4 -1].linearRecurrence(
>>> 	[1 15 65 175], 9
>>> )
[1 15 65 175 369 671 1105 1695 2465]
```

Centered octahedral numbers
OEIS [A001845](https://oeis.org/A001845):

```
>>> 1:10.figurateNumber(
>>> 	'CenteredOctahedral'
>>> )
[1 7 25 63 129 231 377 575 833 1159]

>>> [4 -6 4 -1].linearRecurrence(
>>> 	[1 7 25 63], 10
>>> )
[1 7 25 63 129 231 377 575 833 1159]
```

Centered dodecahedral numbers,
OEIS [A005904](https://oeis.org/A005904):

```
>>> 0:8.figurateNumber(
>>> 	'CenteredDodecahedral'
>>> )
[1 33 155 427 909 1661 2743 4215 6137]

>>> [4 -6 4 -1].linearRecurrence(
>>> 	[1 33 155 427], 9
>>> )
[1 33 155 427 909 1661 2743 4215 6137]
```

Truncated octahedral numbers,
OEIS [A005910](https://oeis.org/A005910):

```
>>> 1:9.figurateNumber(
>>> 	'TruncatedOctahedral'
>>> )
[1 38 201 586 1289 2406 4033 6266 9201]

>>> [4 -6 4 -1].linearRecurrence(
>>> 	[1 38 201 586], 9
>>> )
[1 38 201 586 1289 2406 4033 6266 9201]
```

* * *

See also: linearRecurrence, polygonalNumber, tetrahedralNumber

Guides: Integer Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/FigurateNumber.html)
[2](https://mathworld.wolfram.com/OctahedralNumber.html)
[3](https://mathworld.wolfram.com/RhombicDodecahedralNumber.html),
_W_
[1](https://en.wikipedia.org/wiki/Figurate_number)
