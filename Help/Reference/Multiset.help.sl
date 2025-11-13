# Multiset

- _Multiset([|c₁→i₁, c₂→i₂, …|])_

A `Type` and associated `Trait` holding an unordered collection of possibly duplicated elements,
also called a _bag_.

The type `Multiset` collates elements according `=`, see also `IdentityMultiset`.

To convert a collection to a `Multiset` use `asMultiset`,
to convert a `Multiset` to a `Set` use `asSet`,
to convert a `Multiset` to a `List` use `asList`:

```
>>> let a = [1 1 1 3 3 5];
>>> let b = a.asMultiset;
>>> let c = b.asSet;
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
>>> let a = [1 1 1 3 3 5].asMultiset;
>>> (
>>> 	a.sortedCounts,
>>> 	a.sortedElements
>>> )
(
	[3 -> 1, 2 -> 3, 1 -> 5],
	[1 -> 3, 3 -> 2, 5 -> 1]
)
```

To get the elements as a `Dictionary` use `valuesAndCounts`:

```
>>> [1 1 1 3 3 5].asMultiset
>>> .valuesAndCounts
[|1 -> 3, 3 -> 2, 5 -> 1|]
```

To count the occurences of an item, also called the _multiplicity_, use `occurrencesOf`:

```
>>> [1 1 1 3 3 5].asMultiset
>>> .occurrencesOf(3)
2
```

The `size`, also called the _cardinality_, of a `IdentityMultiset` is the `sum` of the counts:

```
>>> [1 1 1 3 3 5].asMultiset
>>> .size
3 + 2 + 1
```

To add an element to a `Multiset` use `add` or `addWithOccurrences`:

```
>>> let a = [1 1 1].asMultiset;
>>> a.addWithOccurrences(3, 2);
>>> a.add(5);
>>> a.sortedElements
[1 -> 3, 3 -> 2, 5 -> 1]
```

To remove an element from a `Multiset` use `remove`:

```
>>> let a = [1 1 1 3 3 5].asMultiset;
>>> a.remove(1);
>>> a.remove(3);
>>> a.remove(5);
>>> a.sortedElements
[1 -> 2, 3 -> 1]
```

Store string:

```
>>> [1 1 1 2 3 3].asMultiset
>>> .storeString
'Multiset([|1 -> 3, 2 -> 1, 3 -> 2|])'
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
