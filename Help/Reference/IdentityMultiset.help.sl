# IdentityMultiset

- _IdentityMultiset([c₁: i₁, c₂: i₂, …])_

A `Type` holding an unordered collection of possibly duplicated elements,
also called a _multiset_.

At `Map`:

```
>>> [1: 3, 2: 1, 3: 5]
>>> .IdentityMultiset
>>> .sortedCounts
[5 -> 3, 3 -> 1, 1 -> 2]
```

`IdentityMultiset` collates elements according `==` not `=`,
i.e. `IdentityMultiset` is an identity bag, not an equality bag.

To convert a `List` to an `IdentityMultiset` use `asIdentityMultiset`,
to convert a `IdentityMultiset` to an `IdentitySet` use `asIdentitySet`,
to convert a `IdentityMultiset` to a `List` use `asList`:

```
>>> let a = [1 1 1 3 3 5];
>>> let b = a.asIdentityMultiset;
>>> let c = b.asIdentitySet;
>>> (
>>> 	a.size,
>>> 	b.size,
>>> 	c.size,
>>> 	b.asList
>>> )
(6, 6, 3, a)
```

To get the elements as a `List` of `Association`s use `sortedCounts` or `sortedElements`.

```
>>> let a = [1 1 1 3 3 5].asIdentityMultiset;
>>> (
>>> 	a.sortedCounts,
>>> 	a.sortedElements
>>> )
(
	[3 -> 1, 2 -> 3, 1 -> 5],
	[1 -> 3, 3 -> 2, 5 -> 1]
)
```

To get the elements as a `Map` use `valuesAndCounts`:

```
>>> [1 1 1 3 3 5]
>>> .asIdentityMultiset
>>> .valuesAndCounts
[1: 3, 3: 2, 5: 1]
```

To count the occurences of an item, also called the _multiplicity_, use `occurrencesOf`:

```
>>> [1 1 1 3 3 5].asIdentityMultiset
>>> .occurrencesOf(3)
2
```

The `size`, also called the _cardinality_, of a `IdentityMultiset` is the `sum` of the counts:

```
>>> [1 1 1 3 3 5].asIdentityMultiset
>>> .size
3 + 2 + 1
```

To add an element to an `IdentityMultiset` use `add` or `addWithOccurrences`:

```
>>> let a = [1 1 1].asIdentityMultiset;
>>> a.addWithOccurrences(3, 2);
>>> a.add(5);
>>> a.sortedElements
[1 -> 3, 3 -> 2, 5 -> 1]
```

To remove an element from an `IdentityMultiset` use `remove`:

```
>>> let a = [1 1 1 3 3 5].asIdentityMultiset;
>>> a.remove(1);
>>> a.remove(3);
>>> a.remove(5);
>>> a.sortedElements
[1 -> 2, 3 -> 1]
```

Compare instances:

```
>>> let a = [1 2 3].asIdentityMultiset;
>>> let b = [1 2 3].asIdentityMultiset;
>>> a = b
true
```

* * *

See also: add, addWithOccurrences, asIdentityMultiset, Multiset, IdentitySet, isImmediate, remove, sortedCounts, sortedElements, Set, valuesAndCounts

Guides: Set Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Multiset.html),
_Smalltalk_
5.7.6,
_W_
[1](https://en.wikipedia.org/wiki/Multiset)

Categories: Collection, Type
