# combinations

- _combinations([x₁ x₂ …], k)_
- _combinations(n, k)_

The combinations of _x_,
or of the set _1:n_,
taken _k_ at a time,
in lexicographic order.

All combinations of four numbers taken three at a time:

```
>>> 4.combinations(3)
[
	1 2 3;
	1 2 4;
	1 3 4;
	2 3 4
]

>>> binomial(4, 3)
4
```

All combinations of five numbers taken three at a time:

```
>>> 5.combinations(3)
[
	1 2 3;
	1 2 4;
	1 2 5;
	1 3 4;
	1 3 5;
	1 4 5;
	2 3 4;
	2 3 5;
	2 4 5;
	3 4 5
]
```

All combinations of a list of three items taken two at a time:

```
>>> [10 20 30].combinations(2)
[
	10 20;
	10 30;
	20 30
]
```

All combinations of a list of five items taken four at a time:

```
>>> (2, 4 .. 10).combinations(4)
[
	2 4 6 8;
	2 4 6 10;
	2 4 8 10;
	2 6 8 10;
	4 6 8 10
]
```

The number of such combinations is given by `binomial`:

```
>>> 4.binomial(3)
4

>>> 5.binomial(3)
10

>>> 3.binomial(2)
3

>>> 5.binomial(4)
5
```

* * *

See also: binaryCombinations, binomial, combinationsAtATimeDo, subsets, tuples

Guides: Combinatorial Functions

References:
_Mathworks_
[1](https://mathworks.com/help/matlab/ref/nchoosek.html)

Categories: Enumerating
