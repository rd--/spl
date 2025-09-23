# asSet

- _asSet(c)_

Answer a `Set` of the elements of the collection _c_.

At `List`:

```
>>> [1 1 2 1 2 3]
>>> .asSet
{|1, 2, 3|}
```

At `Multiset`:

```
>>> [1 1 2 1 2 3]
>>> .asMultiset
>>> .asSet
{|1, 2, 3|}
```

At `String`:

```
>>> 'abracadabra'
>>> .asSet
{|'a', 'b', 'r', 'c', 'd'|}
```

At a list of lists:

```
>>> [1 1; 1 1].asSet
{|[1, 1]|}
```

* * *

See also: asIdentitySet, Collection, IdentitySet, nub, Set

References:
_Smalltalk_
5.7.1.7

Categories: Converting
