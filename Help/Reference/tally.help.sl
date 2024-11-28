# tally

- _tally(aCollection, aBlock:/2)_

Answer all distinct elements of _aCollection_ together with their multiplicities.

```
>>> 'aabacba'.contents.tally(=)
[
	'a' -> 4,
	'b' -> 2,
	'c' -> 1
]
```

Count the instances of randomly generated integers:

```
>>> Sfc32(41805).randomInteger(1, 9, 23).tally(=)
[
	9 -> 2,
	7 -> 3,
	6 -> 2,
	1 -> 4,
	3 -> 1,
	4 -> 4,
	8 -> 3,
	5 -> 3,
	2 -> 1
]
```

Count odd and even numbers in a list:

```
>>> [1 2 3 2 1 1].tally { :p :q |
>>> 	p.isEven = q.isEven
>>> }
[
	1 -> 4,
	2 -> 2
]
```

* * *

See also: commonest, counts, entropy, mean, median, sort, sortBy, union

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Tally.html)
