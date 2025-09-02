# combinationsAtATimeDo

- _combinationsAtATimeDo(c, k, f:/1)_

Take the items in the sequence _c_,
_k_ at a time,
and evaluate the block _f_ for each combination.
Provide a list of elements of _c_ as the block argument.
Each combination only occurs once, and the order of the elements does not matter.
There are _binomial(n, k)_ combinations where _n_ is the `size` of _c_.

```
>>> let l = [];
>>> 0:4.combinationsAtATimeDo(3) { :each |
>>> 	l.add(each.copy)
>>> };
>>> l
[
	0 1 2; 0 1 3; 0 1 4; 0 2 3; 0 2 4; 0 3 4;
	1 2 3; 1 2 4; 1 3 4;
	2 3 4
]
```

All Pythagorean triples with elements between 1 and _n_:

```
>>> let answer = [];
>>> 1:20.combinationsAtATimeDo(3) { :each |
>>> 	let [a, b, c] = each;
>>> 	((a * a) + (b * b) = (c * c)).ifTrue {
>>> 		answer.add(each.copy)
>>> 	}
>>> };
>>> answer
[
	3 4 5; 5 12 13; 6 8 10;
	8 15 17; 9 12 15; 12 16 20
]
```

* * *

See also: combinations, subsets

Guides: Iteration Functions

Categories: Enumerating
