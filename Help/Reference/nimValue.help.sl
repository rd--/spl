# nimValue

- _nimValue([n₁ n₂ …])_

Answer the Nim-value,
also called the Sprague-Grundy number,
of the Nim game position _n_.

Verify safe positions with three heaps of maximum size seven:

```
>>> [
>>> 	1 2 3;
>>> 	1 4 5;
>>> 	1 6 7;
>>> 	2 4 6;
>>> 	2 5 7;
>>> 	3 4 7;
>>> 	3 5 6
>>> ].collect(nimValue:/1)
[0 0 0 0 0 0 0]
```

Verify safe positions with four heaps of maximum size seven:

```
>>> [
>>> 	1 2 4 7;
>>> 	1 2 5 6;
>>> 	1 3 4 6;
>>> 	1 3 5 7;
>>> 	2 3 4 5;
>>> 	2 3 6 7;
>>> 	4 5 6 7
>>> ].collect(nimValue:/1)
[0 0 0 0 0 0 0]
```

All positions _x,x,x,x_ and _x,x,y,y_ are also safe:

```
>>> [1 1 1 1; 2 2 2 2; 1 1 2 2; 2 2 3 3]
>>> .collect(nimValue:/1)
[0 0 0 0]
```

Find safe positions:

```
>>> [1 .. 7].subsets { :x |
>>> 	x.size = 3
>>> }.select { :p |
>>> 	p.nimValue = 0
>>> }.lexicographicSort
[
	1 2 3;
	1 4 5;
	1 6 7;
	2 4 6;
	2 5 7;
	3 4 7;
	3 5 6
]
```

* * *


References:
_Mathematica_
[1](https://mathworld.wolfram.com/Nim-Value.html)
