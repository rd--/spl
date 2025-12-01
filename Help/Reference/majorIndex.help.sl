# majorIndex

- _majorIndex(p)_

Answer the major index of the permutation index _p_.

Equal to the sum of the descents:

```
>>> let p = Permutation([3 5 1 6 2 4]);
>>> (p.majorIndex, p.descents)
(6, [2 4])
```

Table of Mahonian numbers,
OEIS [A008302](https://oeis.org/A008302):

```
>>> let mahonianNumber = { :n :k |
>>> 	[1 .. n].permutations.count { :p |
>>> 		p.majorIndex = k
>>> 	}
>>> };
>>> 1:5.collect { :n |
>>> 	let m = (n - 1).triangularNumber;
>>> 	0:m.collect { :k |
>>> 		mahonianNumber(n, k)
>>> 	}
>>> }
[
	1;
	1 1;
	1 2 2 1;
	1 3 5 6 5 3 1;
	1 4 9 15 20 22 20 15 9 4 1
]
```

* * *

See also: descents, Permutation

Guides: Permutation Functions

References:
_OEIS_
[1](https://oeis.org/A008302),
_W_
[1](https://en.wikipedia.org/wiki/Major_index)
