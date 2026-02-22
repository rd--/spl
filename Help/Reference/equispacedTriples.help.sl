# equispacedTriples

- _equispacedTriples(n)_
- _equispacedTriples([x₁ x₂ …])_

Answer a list of all of the equispaced three element subsequences of either the range _1:n_,
or the sequence _x_.

At integer:

```
>>> 3:7.collect(equispacedTriples:/1)
[
	1 2 3
	:;
	1 2 3; 2 3 4
	:;
	1 2 3; 2 3 4; 3 4 5;
	1 3 5
	:;
	1 2 3; 2 3 4; 3 4 5; 4 5 6;
	1 3 5; 2 4 6
	:;
	1 2 3; 2 3 4; 3 4 5; 4 5 6; 5 6 7;
	1 3 5; 2 4 6; 3 5 7;
	1 4 7
]
```

At `List`:

```
>>> [-3 .. 3].equispacedTriples
[
	-3 -2 -1; -2 -1 0; -1 0 1; 0 1 2; 1 2 3;
	-3 -1  1; -2  0 2; -1 1 3;
	-3  0  3
]
```

The number of triples is given by the quarter-squares sequence,
OEIS [A002620](https://oeis.org/A002620):

```
>>> 1:30.collect { :n |
>>> 	n.equispacedTriples.size
>>> }
0:29.collect { :n |
	(n.square / 4).floor
}

>>> [2 0 -2 1].linearRecurrence(
>>> 	[0 0 1 2], 16
>>> )
[0 0 1 2 4 6 9 12 16 20 25 30 36 42 49 56]
```

* * *

See also: adjacentPairs, detectEquispacedTriple, partition, subsequences

References:
_OEIS_
[1](https://oeis.org/A002620)
