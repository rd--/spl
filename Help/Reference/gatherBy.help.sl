# gatherBy

- _gatherBy(l, f:/1)_

Gather the elements of the list _l_ into sublists of elements that give the same _key_ according to _f_.

Gather data in odd and even lists:

```
>>> [1 2 3 4 5].gatherBy(isOdd:/1)
[1 3 5; 2 4]
```

Gather by the first part:

```
>>> ['a' 1; 'b' 1; 'a' 2; 'd' 1; 'b' 3]
>>> .gatherBy(first:/1)
[
	'a' 1; 'a' 2:;
	'b' 1; 'b' 3:;
	'd' 1
]
```

Gather by remainder:

```
>>> [1 .. 10].gatherBy { :n |
>>> 	n % 3
>>> }
[
	1 4 7 10;
	2 5 8;
	3 6 9
]
```

* * *

See also: gather, groupBy, select, splitBy, sortOn

Guides: List Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/GatherBy.html)

Categories: Enumerating
