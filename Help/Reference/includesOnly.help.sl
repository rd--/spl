# includesOnly

- _includesOnly(c₁, c₂)_

Answer whether the collection _c₁_ includes only elements of the collection _c₂_.

At `List`:

```
>>> let a = [3 .. 7];
>>> let b = [1 .. 9];
>>> (
>>> 	a.includesOnly(b),
>>> 	b.includesAll(a),
>>> 	a.isSubset(b)
>>> )
(true, true, true)
```

At `Range`:

```
>>> 5:3.includesOnly(3:7)
true

>>> 3:7.includesOnly(5:3)
false
```

The empty list does not include any items:

```
>>> [].includesOnly([3 .. 7])
true

>>> [].includesOnly([])
true
```

Every list includes only elements of itself:

```
>>> [1 2 3].includesOnly([1 2 3])
true
```

The first list contains only elements of the second list:

```
>>> ['b' 'a' 'a'].includesOnly(['a' 'b' 'c'])
true
```

The first list contains elements not in the second list:

```
>>> ['b' 'a' 'd'].includesOnly(['a' 'b' 'c'])
false
```

* * *

See also: includes, includesAll, includesAny, includesNone

Guides: List Functions, Set Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/ContainsOnly.html)

Categories: Testing
