# union

- _union(α, β)_ ⟹ _unionBy(α, β, =)_

Answer a `Set` holding the set theoretic union of two collections,
equality is decided by `=`.

```
>>> [1 2 3].union([2 3 4])
1:4.asSet(=)

>>> ['a' 'b' 'c'].union(['b' 'c' 'd'])
['a' 'b' 'c' 'd'].asSet(=)

>>> [1 1 2 2 3 3].union([2 2 3 3 4 4])
1:4.asSet(=)
```

Find divisors that occur in any of 10, 12, and 20:

```
>>> 10.divisors.union(
>>> 	12.divisors.union(
>>> 		20.divisors
>>> 	)
>>> )
[1 2 3 4 5 6 10 12 20].asSet(=)
```

Where supported `union` is displayed as ∪.

* * *

See also: ++, difference, IdentitySet, intersection, Set, unionBy

References:
_Haskell_
[1](https://hackage.haskell.org/package/base/docs/Data-List.html#v:union),
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Union.html)

Unicode: U+222A ∪ Union

Categories: Enumerating
