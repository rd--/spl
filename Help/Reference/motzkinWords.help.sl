# motzkinWords

- _motzkinWords(t, s)_

Answer the _t,s_ Motzkin words.
Each word contains _t_ ones,
_s_ zeroes,
and _s_ twos.

The one valid Motzkin word of length zero:

```
>>> motzkinWords(0, 0)
[[]]

>>> 1.motzkinNumber
1
```

The one valid Motzkin word of length one:

```
>>> motzkinWords(1, 0)
[[1]]

>>> 2.motzkinNumber
1
```

The two valid Motzkin words of length two:

```
>>> motzkinWords(2, 0)
[[1 1]]

>>> motzkinWords(0, 1)
[[2 0]]

>>> 3.motzkinNumber
2
```

The four valid Motzkin words of length three:

```
>>> motzkinWords(3, 0)
[[1 1 1]]

>>> motzkinWords(1, 1)
[2 1 0; 2 0 1; 1 2 0]

>>> 4.motzkinNumber
4
```

The nine valid Motzkin words of length four:

```
>>> motzkinWords(4, 0)
[
	[1 1 1 1]
]

>>> motzkinWords(2, 1)
[
	2 1 1 0;
	2 0 1 1;
	1 2 0 1;
	2 1 0 1;
	1 2 1 0;
	1 1 2 0
]

>>> motzkinWords(0, 2)
[
	2 2 0 0;
	2 0 2 0
]

>>> 5.motzkinNumber
9
```

* * *

See also: dyckWords, motzkinNumber

Guides: Combinatorial Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/MotzkinNumber.html)
_W_
[1](https://en.wikipedia.org/wiki/Motzkin_number)

Further Reading: Donaghey 1977, Lapey 2022

Categories: Enumerating
