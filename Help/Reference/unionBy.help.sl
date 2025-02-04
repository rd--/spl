# unionBy

- _unionBy(aCollection, anotherCollection, aBlock:/2)_

Answer a `Set` holding the set theoretic union of two collections,
equality is decided by _aBlock_.

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
