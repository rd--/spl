 linearRecurrence

- _linearRecurrence(k, i, n)_

Answer the sequence of length _n_ obtained by iterating the linear recurrence with kernel _k_ starting with initial values _i_.

Solve an initial-value problem for a first-order difference equation with kernel _(-3, 1)_:

```
>>> linearRecurrence([-3 1], [7 2], 10)
[7 2 1 -1 4 -13 43 -142 469 -1549]
```

Find the first few Fibonacci numbers,
also Erv Wilson’s Meru 1,
OEIS [A000045](https://oeis.org/A000045):

```
>>> linearRecurrence([1 1], [1 1], 13)
[1 1 2 3 5 8 13 21 34 55 89 144 233]
```

`linearRecurrence` works if _i_ is a matrix:

```
>>> linearRecurrence([1 1], [1 2; 2 1], 10)
[
	1 2; 2 1; 3 3; 5 4; 8 7; 13 11;
	21 18; 34 29; 55 47; 89 76
]
```

`linearRecurrence` works if _k_ and _i_ are both matrices:

```
>>> linearRecurrence(
>>> 	[1 1; 0 1:; 1 0; -1 1],
>>> 	[1 2; 2 1],
>>> 	6
>>> )
[1 2; 2 1; 4 2; 8 1; 13 -1; 20 -8]
```

Padovan sequence,
OEIS [A000931](http://oeis.org/A000931):

```
>>> linearRecurrence([0 1 1], [1 1 1], 10)
[1 1 1 2 2 3 4 5 7 9]
```

Lucas numbers,
OEIS [A000204](http://oeis.org/A000204):

```
>>> linearRecurrence([1 1], [1 3], 10)
[1 3 4 7 11 18 29 47 76 123]
```

Pell numbers,
OEIS [A000129](http://oeis.org/A000129):

```
>>> linearRecurrence([2 1], [0 1], 10)
[0 1 2 5 12 29 70 169 408 985]
```

Pell–Lucas numbers,
OEIS [A002203](http://oeis.org/A002203):

```
>>> linearRecurrence([2 1], [2 2], 10)
[2 2 6 14 34 82 198 478 1154 2786]
```

Perrin sequence,
OEIS [A001608](http://oeis.org/A001608):

```
>>> linearRecurrence([0 1 1], [3 0 2], 10)
[3 0 2 3 2 5 5 7 10 12]
```

Jacobsthal sequence,
OEIS [A001045](https://oeis.org/A001045):

```
>>> linearRecurrence([1 2], [0 1], 36)
[
	0 1 1
	3 5 11
	21 43 85
	171 341 683
	1365 2731 5461
	10923 21845 43691
	87381 174763 349525
	699051 1398101 2796203
	5592405 11184811 22369621
	44739243 89478485 178956971
	357913941 715827883 1431655765
	2863311531 5726623061 11453246123
]
```

Lichtenberg sequence,
OEIS [A000975](https://oeis.org/A000975):

```
>>> linearRecurrence([2 1 -2], [0 1 2], 36)
[
	0 1 2
	5 10 21
	42 85 170
	341 682 1365
	2730 5461 10922
	21845 43690 87381
	174762 349525 699050
	1398101 2796202 5592405
	11184810 22369621 44739242
	89478485 178956970 357913941
	715827882 1431655765 2863311530
	5726623061 11453246122 22906492245
]
```

Arima sequence,
OEIS [A005578](https://oeis.org/A005578):

```
>>> linearRecurrence([2 1 -2], [1 1 2], 36)
[
	1 1 2
	3 6 11
	22 43 86
	171 342 683
	1366 2731 5462
	10923 21846 43691
	87382 174763 349526
	699051 1398102 2796203
	5592406 11184811 22369622
	44739243 89478486 178956971
	357913942 715827883 1431655766
	2863311531 5726623062 11453246123
]
```

Eulerian numbers,
OEIS [A000295](https://oeis.org/A000295):

```
>>> linearRecurrence([4 -5 2], [0 0 1], 34)
[
	0 0 1
	4 11 26
	57 120 247
	502 1013 2036
	4083 8178 16369
	32752 65519 131054
	262125 524268 1048555
	2097130 4194281 8388584
	16777191 33554406 67108837
	134217700 268435427 536870882
	1073741793 2147483616 4294967263
	8589934558
]
```

Mersenne numbers,
OEIS [A000225](https://oeis.org/A000225):

```
>>> linearRecurrence([3 -2], [1 3], 20)
[
	1 3 7 15 31
	63 127 255 511 1023
	2047 4095 8191 16383 32767
	65535 131071 262143 524287 1048575
]
```

Purkiss sequence,
OEIS [A051049](https://oeis.org/A051049):

```
>>> linearRecurrence([2 1 -2], [1 1 4], 31)
[
	1 1 4
	7 16 31
	64 127 256
	511 1024 2047
	4096 8191 16384
	32767 65536 131071
	262144 524287 1048576
	2097151 4194304 8388607
	16777216 33554431 67108864
	134217727 268435456 536870911
	1073741824
]
```

The tribonacci numbers,
OEIS [A001590](https://oeis.org/A001590):

```
>>> linearRecurrence([1 1 1], [0 1 0], 13)
[0 1 0 1 2 3 6 11 20 37 68 125 230]
```

The Narayana sequence,
also Erv Wilson’s Meru 2,
OEIS [A000930](https://oeis.org/A000930):

```
>>> linearRecurrence([1 0 1], [1 1 1], 17)
[
	  1   1   1   2   3
	  4   6   9  13  19
	 28  41  60  88 129
	189 277
]
```

The third, fourth and fifth sequences in the series beginning Fibonacci sequence, Padovan sequence,
OEIS [A079398](https://oeis.org/A079398) &
OEIS[A103372](https://oeis.org/A103372) &
:

```
>>> linearRecurrence([0 0 1 1], [0 1 1 1], 30)
[
	 0  1  1  1  1  2   2   2   3   4
	 4  5  7  8  9 12  15  17  21  27
	32 38 48 59 70 86 107 129 156 193
]

>>> linearRecurrence([0 0 0 1 1], [1 1 1 1 1], 30)
[
	 1  1  1  1  1  2  2  2  2  3
	 4  4  4  5  7  8  8  9 12 15
	16 17 21 27 31 33 38 48 58 64
]

>>> linearRecurrence(
>>>	[0 0 0 0 1 1], [1 1 1 1 1 1], 39
>>> )
[
	 1  1  1  1  1  1  2  2  2  2
	 2  3  4  4  4  4  5  7  8  8
	 8  9 12 15 16 16 17 21 27 31
	32 33 38 48 58 63 65 71 86
]
```

A kind of Lucas sequence,
OEIS [A001076](https://oeis.org/A001076):

```
>>> linearRecurrence([4 1], [0 1], 20)
[
	0 1 4
	17 72 305
	1292 5473 23184
	98209 416020 1762289
	7465176 31622993 133957148
	567451585 2403763488 10182505537
	43133785636 182717648081
]

>>> 5.sqrt
>>> .continuedFraction(13)
>>> .convergents
>>> .denominator
[
	1 4
	17 72 305
	1292 5473 23184
	98209 416020 1762289
	7465176 31622993
]
```

Padovan’s spiral numbers,
also Erv Wilson’s Meru 3,
OEIS [A134816](https://oeis.org/A134816):

```
>>> linearRecurrence([0 1 1], [1 1 1], 30)
[
	  1    1    1    2    2
	  3    4    5    7    9
	 12   16   21   28   37
	 49   65   86  114  151
	200  265  351  465  616
	816 1081 1432 1897 2513
]
```

Erv Wilson’s Meru 4,
OEIS [A003269](https://oeis.org/A003269):

```
>>> linearRecurrence([1 0 0 1], [0 1 1 1], 30)
[
	   0    1    1    1    1
	   2    3    4    5    7
	  10   14   19   26   36
	  50   69   95  131  181
	 250  345  476  657  907
	1252 1728 2385 3292 4544
]
```

Erv Wilson’s Meru 5,
OEIS [A017817](https://oeis.org/A017817):

```
>>> linearRecurrence([0 0 1 1], [1 0 0 1], 30)
[
	 1  0  0  1  1  0  1  2  1  1
	 3  3  2  4  6  5  6 10 11 11
	16 21 22 27 37 43 49 64 80 92
]
```

Erv Wilson’s Meru 6,
OEIS [A003520](https://oeis.org/A003520):

```
>>> linearRecurrence([1 0 0 0 1], [1 1 1 1 1], 30)
[
	  1    1    1    1    1
	  2    3    4    5    6
	  8   11   15   20   26
	 34   45   60   80  106
	140  185  245  325  431
	571  756 1001 1326 1757
]
```

Erv Wilson’s Meru 7,
OEIS [A001687](https://oeis.org/A001687):

```
>>> linearRecurrence([0 1 0 0 1], [0 1 0 1 0], 30)
[
	 0  1  0  1  0  1  1  1   2   1
	 3  2  4  4  5  7  7 11  11  16
	18 23 29 34 45 52 68 81 102 126
]
```

Erv Wilson’s Meru 8,
OEIS [A052920](https://oeis.org/A052920):

```
>>> linearRecurrence(
>>> 	[0 0 1 0 1], [1 0 0 1 0], 30
>>> )
[
	1  0  0  1  0  1  1  0  2  1
	1  3  1  3  4  2  6  5  5 10
	7 11 15 12 21 22 23 36 34 44
]
```

Erv Wilson’s Meru 9,
OEIS [A017827](https://oeis.org/A017827):

```
>>> linearRecurrence([0 0 0 1 1], [1 0 0 0 1], 40)
[
	 1  0  0  0  1  1  0  0  1  2
	 1  0  1  3  3  1  1  4  6  4
	 2  5 10 10  6  7 15 20 16 13
	22 35 36 29 35 57 71 65 64 92
]
```

Odd indexed Pell numbers,
OEIS [A001653](https://oeis.org/A001653):

```
>>> linearRecurrence([6 -1], [1 5], 9)
[
	1 5 29 169 985
	5741 33461 195025 1136689
]

>>> (1, 3 .. 17).pellNumber
[
	1 5 29 169 985
	5741 33461 195025 1136689
]
```

Odd indexed Fibonacci numbers,
OEIS [A001519](https://oeis.org/A001519):

```
>>> linearRecurrence([3 -1], [1 1], 9)
[1 1 2 5 13 34 89 233 610]

>>> (-1, 1 .. 15).fibonacci
[1 1 2 5 13 34 89 233 610]
```

Draw spiral:

~~~spl svg=A
let k = [(1.pi.i / 2.sqrt).exp, 1.i] / 1.1;
let i = [1, 1];
linearRecurrence(k, i, 100)
.collect(realImaginary:/1)
.Line
~~~

![](sw/spl/Help/Image/linearRecurrence-A.svg)

* * *

See also: shiftRegisterSequence

Guides: Integer Sequences

References:
_Mathematica_
[1](https://mathworld.wolfram.com/LinearRecurrenceEquation.html)
[2](https://reference.wolfram.com/language/ref/LinearRecurrence.html),
_OEIS_
[1](http://oeis.org/A000931)
[2](http://oeis.org/A000204)
[3](http://oeis.org/A000129)
[4](http://oeis.org/A002203)
[5](http://oeis.org/A001608),
_W_
[1](https://en.wikipedia.org/wiki/Recurrence_relation)

Categories: Math, Sequence
