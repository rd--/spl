# includesExactly

- _includesExactly(c₁, c₂)_

Answer `true` if the distinct elements of the collections _c₁_ and _c₂_ are the same.

At `List`:

```
>>> [2 1 2 3].includesExactly([1 2 3])
true

>>> [2 1 4 4].includesExactly([1 2 3])
false
```

At `Record`:

```
>>> (x: 1, y: 2).includesExactly(
>>> 	[|'x' -> 2, 'y' -> 1|]
>>> )
true

>>> (x: 1, y: 2, z: 3).includesExactly(
>>> 	[3 2 1 2 3]
>>> )
true
```

* * *

See also: includes, includesAll, includesAny, includesOnly

Guides: List Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/ContainsExactly.html)

Categories: Testing
