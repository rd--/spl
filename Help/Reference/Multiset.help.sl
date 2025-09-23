# Multiset

- _Multiset([|c₁→i₁, c₂→i₂, …|])_

A `Type` and associated `Trait` holding an unordered collection of possibly duplicated elements,
also called a _bag_.

The type `Multiset` collates elements according `=`, see also `IdentityMultiset`.

To convert a collection to a `Multiset` use `asMultiset`,
to convert a `Multiset` to a `Set` use `asSet`,
to convert a `Multiset` to a `List` use `asList`:

```
>>> let list = [1 1 1 3 3 5];
>>> let bag = list.asMultiset;
>>> let set = bag.asSet;
>>> (
>>> 	list.size,
>>> 	bag.size,
>>> 	set.size,
>>> 	bag.asList
>>> )
(6, 6, 3, list)
```

To get the elements as a `List` of `Association`s use `sortedCounts` or `sortedElements`.

```
>>> let bag = [1 1 1 3 3 5].asMultiset;
>>> (
>>> 	bag.sortedCounts,
>>> 	bag.sortedElements
>>> )
(
	[3 -> 1, 2 -> 3, 1 -> 5],
	[1 -> 3, 3 -> 2, 5 -> 1]
)
```

To get the elements as a `Dictionary` use `valuesAndCounts`:

```
>>> [1 1 1 3 3 5].asMultiset.valuesAndCounts
[|1 -> 3, 3 -> 2, 5 -> 1|]
```

To count the occurences of an item, also called the _multiplicity_, use `occurrencesOf`:

```
>>> let bag = [1 1 1 3 3 5].asMultiset;
>>> bag.occurrencesOf(3)
2
```

The `size`, also called the _cardinality_, of a `IdentityMultiset` is the `sum` of the counts:

```
>>> let bag = [1 1 1 3 3 5].asMultiset;
>>> (bag.size, 3 + 2 + 1)
(6, 6)
```

To add an element to a `Multiset` use `add` or `addWithOccurrences`:

```
>>> let bag = [1 1 1].asMultiset;
>>> bag.addWithOccurrences(3, 2);
>>> bag.add(5);
>>> bag.sortedElements
[1 -> 3, 3 -> 2, 5 -> 1]
```

To remove an element from a `Multiset` use `remove`:

```
>>> let bag = [1 1 1 3 3 5].asMultiset;
>>> bag.remove(1);
>>> bag.remove(3);
>>> bag.remove(5);
>>> bag.sortedElements
[1 -> 2, 3 -> 1]
```

* * *

See also: add, addWithOccurrences, asIdentityMultiset, Dictionary, IdentityMultiset, IdentitySet, isImmediate, remove, sortedCounts, sortedElements, Set, valuesAndCounts

Guides: Set Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Multiset.html),
_Smalltalk_
5.7.6,
_W_
[1](https://en.wikipedia.org/wiki/Multiset)

Categories: Collection, Type
