# unionBy

- _unionBy(c₁, c₂, f:/2)_

Answer the set theoretic union of the two collections _c₁_ and _c₂_.
Equality is decided by the block _f_.

```
>>> [1 2 3].unionBy([2 3 4], ==)
1:4.asIdentitySet

>>> ['a' 'b' 'c'].unionBy(['b' 'c' 'd'], ==)
['a' 'b' 'c' 'd'].asIdentitySet

>>> [1 1 2 2 3 3].unionBy([2 2 3 3 4 4], ==)
1:4.asIdentitySet
```

Find divisors that occur in any of 10, 12, and 20:

```
>>> 10.divisors.unionBy(
>>> 	12.divisors.unionBy(
>>> 		20.divisors, ==
>>> 	), ==
>>> )
[1 2 3 4 5 6 10 12 20].asIdentitySet
```

* * *

See also: ++, difference, IdentitySet, intersection, Set, union

Categories: Enumerating
