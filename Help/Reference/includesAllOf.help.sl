# includesAllOf

- _includesAllOf(aCollection, anotherCollection)_

Answer whether all elements of _anotherCollection_ are elements of _aCollection_.

At `List`:

```
>>> [9 .. 1].includesAllOf([3 .. 7])
true
```

At `Range`:

```
>>> 5:3.includesAllOf(3:7)
false
```

The empty list does not include any items:

```
>>> [].includesAllOf([3 .. 7])
false
```

The empty list is a subset of every list:

```
>>> [1 2 3].includesAllOf([])
true

>>> [].includesAllOf([])
true
```

Every list is a subset of itself:

```
>>> [1 2 3].includesAllOf([1 2 3])
true
```

The first list contains all elements of the second list:

```
>>> ['b' 'a' 'b' 'c'].includesAllOf(['a' 'b'])
true
```

The first list does not contain all elements of the second list:

```
>>> ['b' 'a' 'b' 'c'].includesAllOf(['a' 'b' 'd'])
false
```

A short French word containing all five vowels:

```
>>> 'oiseau'.characters.includesAllOf('aeiou'.characters)
true
```

* * *

See also: includes, includesAnyOf

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/ContainsAll.html)
[2](https://reference.wolfram.com/language/ref/SubsetQ.html)

Categories: Testing
