# selfClassify

- _selfClassify([x₁ x₂ …])_

For each unique item in _x_,
in the order it occurs,
indicate in a row where the item occurs in _x_.

```
>>> 'abracadabra'.codePoints
>>> .selfClassify.boole
[
	1 0 0 1 0 1 0 1 0 0 1;
	0 1 0 0 0 0 0 0 1 0 0;
	0 0 1 0 0 0 0 0 0 1 0;
	0 0 0 0 1 0 0 0 0 0 0;
	0 0 0 0 0 0 1 0 0 0 0
]
```

Compare to collecting indices of each item:

```
>>> let a = 'abracadabra'.codePoints;
>>> a.nub.collect { :x | a.indicesOf(x) }
[
	1 4 6 8 11;
	2 9;
	3 10;
	5;
	7
]
```

* * *

See also: equal, nub, unique

Guides: List Functions

References:
_J_
[1](https://code.jsoftware.com/wiki/Vocabulary/eq)
