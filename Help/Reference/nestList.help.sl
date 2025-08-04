# nestList

- _nestList(aBlock:/1, anObject, count)_

Answer a _count + 1_ element `List` of repeated applications of _aBlock_ to _anObject_.

```
>>> cos:/1.nestList(1, 10)
[
	1.0000 0.5403 0.8576 0.6543 0.7935
	0.7014 0.7640 0.7221 0.7504 0.7314
	0.7442
]

>>> sqrt:/1.nestList(100, 4)
[100 10 3.16228 1.77828 1.33352]
```

Successive integers:

```
>>> { :x | x + 1 }.nestList(0, 10)
[0 .. 10]
```

Growth of annually compounded capital:

```
>>> { :x | x * 1.05}.nestList(1000, 10)
[
	1000.00 1050.00 1102.50 1157.625
	1215.51 1276.28 1340.10 1407.10
	1477.46 1551.33 1628.89
]
```

Newton iterations for 2.sqrt:

```
>>> { :x |
>>> 	(x + (2 / x)) / 2
>>> }.nestList(1, 5)
[1 1.5 1.41667 1.41422 1.41421 1.41421]
```

Iterated map:

```
>>> { :x |
>>> 	4 * x * (1 - x)
>>> }.nestList(1/3, 5)
[
	1/3
	8/9
	32/81
	6272/6561
	7250432/43046721
	1038154236987392/1853020188851841
]
```

Iterates in the _3 n + 1_ problem:

```
>>> { :x |
>>> 	x.isEven.if {
>>> 		x / 2
>>> 	} {
>>> 		(3 * x + 1) / 2
>>> 	}
>>> }.nestList(100, 20)
[
	100 50 25 38 19 29 44 22 11 17
	26 13 20 10 5 8 4 2 1 2
	1
]
```

Linear congruential pseudo-random generator:

```
>>> { :x |
>>> 	(59 * x) % 101
>>> }.nestList(1, 15)
[
	1 59 47 46 88 41 96 8 68 73
	65 98 25 61 64 39
]
```

Random walk:

```
>>> let r = Sfc32(671431);
>>> { :x |
>>> 	x + [-1 1].randomChoice(r, [])
>>> }.nestList(0, 9)
[0 -1 -2 -1 0 1 2 3 2 1]
```

Successively append to a string:

```
>>> { :x | x ++ 'x' }.nestList('a', 5)
['a' 'ax' 'axx' 'axxx' 'axxxx' 'axxxxx']
```

Successively rotate a list:

```
>>> rotatedLeft:/1.nestList([1 2 3 4], 4)
[
	1 2 3 4;
	2 3 4 1;
	3 4 1 2;
	4 1 2 3;
	1 2 3 4
]
```

The orbit of 4 under the mapping _5 x mod 7_:

```
>>> { :x |
>>> 	(5 * x) % 7
>>> }.nestList(4, 6)
[4 6 2 3 1 5 4]
```

The first ten items in an integer sequence:

```
>>> { :x |
>>> 	(11 * x.primePi) + 1
>>> }.nestList(2, 10)
[
	2 12 56 177 441 936 1739
	2971 4720 6986 9879
]
```

A prime-representing constant:

```
>>> let k = 2.920050977316135;
>>> { :n |
>>> 	let m = n.floor;
>>> 	m * (n - m + 1) }
>>> .nestList(k, 13).floor
[2 3 5 7 11 13 17 19 23 29 31 37 41 43]

>>> 14.primesList
[2 3 5 7 11 13 17 19 23 29 31 37 41 43]
```

Plot the first few terms of the `dyadicMap`:

~~~spl svg=A
{ :x |
	(2 * x) % 1
}.nestList(0.11111, 50).linePlot
~~~

![](sw/spl/Help/Image/nestList-A.svg)

* * *

See also: foldLeft, iterate, reduce, scan

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/NestList.html)

Categories: Enumerating
