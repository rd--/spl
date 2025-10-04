# uniqueElements

- _uniqueElements([x₁ x₂ …], f:/2)_

Answer the elements for each list _x_ that are not in any other list,
according to the comparison block _f_.

Remove from each list those elements that occur in the other lists:

```
>>> [
>>> 	1 2 2 'b' 'b' 'a';
>>> 	4 3 2 1
>>> ].uniqueElements
[
	'b' 'a';
	4 3
]
```

`uniqueElements` returns a list of the same length as the input:

```
>>> [1 2 3 4; 2 3 4 5; 3 4 5 6].uniqueElements
[1; ; 6]
```

`uniqueElements` of the empty list is the empty list:

```
>>> [].uniqueElements(=)
[]
```

`uniqueElements` effectively complements each list with all other lists:

```
>>> [
>>> 	'c' 'b' 'a' 'b' 'd';
>>> 	'g' 'f' 'd' 'g' 'f';
>>> 	'd' 'c' 'b' 'd' 'e'
>>> ].uniqueElements
[
	'a';
	'g' 'f';
	'e'
]
```

* * *

See also: difference, intersection, select, symmetricDifference, union, without, withoutAll

Guides: Set Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/UniqueElements.html)
