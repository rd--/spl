# union

- _union(c₁, c₂)_

Answer a collection holding the set theoretic union of the two collections _c₁_ and _c₂_.

At `List`, equality is decided by `=`:

```
>>> [1 2 3].union([2 3 4])
[1 2 3 4]

>>> [1 1 2 2 3 3].union([2 2 3 3 4 4])
[1 2 3 4]

>>> [1 1 2 2 3 3].union([])
[1 2 3]

>>> ['a' 'b' 'c'].union(['b' 'c' 'd'])
['a' 'b' 'c' 'd']
```

At `IdentitySet`:

```
>>> [1 2 3].asIdentitySet.union([2 3 4])
1:4.asIdentitySet
```

Find divisors that occur in any of 10, 12, and 20:

```
>>> 10.divisors.union(
>>> 	12.divisors.union(
>>> 		20.divisors
>>> 	)
>>> )
[1 2 5 10 3 4 6 12 20]
```

At `Interval`:

```
>>> (1 -- 3).union(3 -- 7)
(1 -- 7)
```

Where supported `union` is displayed as ∪.

* * *

See also: ++, difference, IdentitySet, intersection, Set, unionBy

Guides: Set Functions

References:
_Haskell_
[1](https://hackage.haskell.org/package/base/docs/Data-List.html#v:union),
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Union.html)
[2](https://reference.wolfram.com/language/ref/IntervalUnion.html)

Unicode: U+222A ∪ Union

Categories: Enumerating
