# josephusProblem

- _josephusProblem(n=41, k=3)_

The traditional problem:

```
>>> 41.josephusProblem(3)
31
```

With _k=2_:

```
>>> 41.josephusProblem(2)
19
```

The first few terms at _k=2_,
OEIS [A006257](https://oeis.org/A006257):

```
>>> 0:78.collect { :n |
>>> 	n.josephusProblem(2)
>>> }
[
	 0  1  1  3  1  3  5  7  1  3
	 5  7  9 11 13 15  1  3  5  7
	 9 11 13 15 17 19 21 23 25 27
	29 31  1  3  5  7  9 11 13 15
	17 19 21 23 25 27 29 31 33 35
	37 39 41 43 45 47 49 51 53 55
	57 59 61 63  1  3  5  7  9 11
	13 15 17 19 21 23 25 27 29
]
```

The first few terms at _k=3_,
OEIS [A054995](https://oeis.org/A054995):

```
>>> 1:78.collect { :n |
>>> 	n.josephusProblem(3)
>>> }
[
	 1  2  2  1  4  1  4  7  1  4
	 7 10 13 2 5 8 11 14 17 20  2
	 5  8 11 14 17 20 23 26 29  1
	 4  7 10 13 16 19 22 25 28 31
	34 37 40 43 46  2  5  8 11 14
	17 20 23 26 29 32 35 38 41 44
	47 50 53 56 59 62 65 68  1  4
	 7 10 13 16 19 22 25
]
```

Triangle of answers for _n=1-14_,
OEIS [A032434](https://oeis.org/A032434):

```
>>> 1:14.collect { :n |
>>> 	1:n.collect { :k |
>>> 		josephusProblem(n, k)
>>> 	}
>>> }
[
	1;
	2 1;
	3 3 2;
	4 1 1 2;
	5 3 4 1 2;
	6 5 1 5 1 4;
	7 7 4 2 6 3 5;
	8 1 7 6 3 1 4 4;
	9 3 1 1 8 7 2 3 8;
	10 5 4 5 3 3 9 1 7 8;
	11 7 7 9 8 9 5 9 5 7 7;
	12 9 10 1 1 3 12 5 2 5 6 11;
	13 11 13 5 6 9 6 13 11 2 4 10 8;
	14 13 2 9 11 1 13 7 6 12 1 8 7 13
]
```

* * *

See also: josephusSequence

Guides: Integer Sequences

References:
_Mathematica_
[1](https://mathworld.wolfram.com/JosephusProblem.html),
_OEIS_
[1](https://oeis.org/A006257)
[2](https://oeis.org/A054995)
[3](https://oeis.org/A032434),
_W_
[1](https://en.wikipedia.org/wiki/Josephus_problem)
