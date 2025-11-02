# includesAll

- _includesAll(c₁, c₂)_

Answer whether all elements of the collection _c₂_ are elements of the collection _c₁_.

At `List`:

```
>>> [9, 8 .. 1].includesAll([3 .. 7])
true

>>> [3 .. 7].isSubset([9, 8 .. 1])
true
```

At `Range`:

```
>>> 5:3.includesAll(3:7)
false
```

The empty list does not include any items:

```
>>> [].includesAll([3 .. 7])
false
```

The empty list is a subset of every list:

```
>>> [1 2 3].includesAll([])
true

>>> [].includesAll([])
true
```

Every list is a subset of itself:

```
>>> [1 2 3].includesAll([1 2 3])
true
```

The first list contains all elements of the second list:

```
>>> ['b' 'a' 'b' 'c'].includesAll(['a' 'b'])
true
```

The first list does not contain all elements of the second list:

```
>>> ['b' 'a' 'b' 'c'].includesAll(
>>> 	['a' 'b' 'd']
>>> )
false
```

A short French word containing all five vowels:

```
>>> 'oiseau'.contents.includesAll(
>>> 	'aeiou'.contents
>>> )
true
```

* * *

See also: includes, includesAny

Guides: List Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/ContainsAll.html)
[2](https://reference.wolfram.com/language/ref/SubsetQ.html)

Categories: Testing
