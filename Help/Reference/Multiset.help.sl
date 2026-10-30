# Multiset

- _Multiset([x₁ x₂ …], =)_
- _Multiset([c₁→i₁, c₂→i₂, …])_

A `Type` and associated `Trait` holding an unordered collection of possibly duplicated elements,
also called a _bag_.

At a `List` of associations:

```
>>> Multiset[1 -> 3, 2 -> 2, 3 -> 1]
>>> .sortedElements
[1 -> 3, 2 -> 2, 3 -> 1]
```

At a `List`:

```
>>> Multiset([1 1 1 2 2 3], ==)
>>> .sortedElements
[1 -> 3, 2 -> 2, 3 -> 1]

>>> Multiset([1 1 1 3 3 5], ==)
>>> .sortedCounts
[3 -> 1, 2 -> 3, 1 -> 5]
```

At `Map`:

```
>>> Multiset(
>>> 	Map[1 -> 3, 2 -> 1, 3 -> 5]
>>> ).sortedCounts
[5 -> 3, 3 -> 1, 1 -> 2]
```

At a `Dictionary`:

```
>>> Multiset(
>>> 	Dictionary[1 -> 3, 2 -> 2, 3 -> 1]
>>> ).sortedElements
[1 -> 3, 2 -> 2, 3 -> 1]
```

The type `Multiset` collates elements according the provided comparator:

```
>>> let a = [1 1 1 3 3 5];
>>> let b = Multiset(a, ==);
>>> let c = Set(b, ==);
>>> (
>>> 	a.size,
>>> 	b.size,
>>> 	c.size,
>>> 	b.List
>>> )
(6, 6, 3, a)
```

To get the elements as a `List` of `Association`s use `sortedCounts` or `sortedElements`.

```
>>> let a = Multiset([1 1 1 3 3 5], ==);
>>> (
>>> 	a.sortedCounts,
>>> 	a.sortedElements
>>> )
(
	[3 -> 1, 2 -> 3, 1 -> 5],
	[1 -> 3, 3 -> 2, 5 -> 1]
)
```

To get the elements as a `Map` or `Dictionary` use `valuesAndCounts`:

```
>>> Multiset([1 1 1 3 3 5], ==)
>>> .valuesAndCounts
Map[1 -> 3, 3 -> 2, 5 -> 1]

>>> Multiset([1 1 1 3 3 5], =)
>>> .valuesAndCounts
Dictionary[1 -> 3, 3 -> 2, 5 -> 1]
```

To get the elements as a two column matrix use `elementsAndCounts`:

```
>>> Multiset([1 1 1 3 3 5], ==)
>>> .elementsAndCounts
[1 3; 3 2; 5 1]
```

To count the occurences of an item, also called the _multiplicity_, use `occurrencesOf`:

```
>>> Multiset([1 1 1 3 3 5], ==)
>>> .occurrencesOf(3)
2
```

The `size`, also called the _cardinality_, of a `Multiset` is the `sum` of the counts:

```
>>> Multiset([1 1 1 3 3 5], ==)
>>> .size
3 + 2 + 1
```

To add an element to a `Multiset` use `add` or `addWithOccurrences`:

```
>>> let a = Multiset([1 1 1], ==);
>>> a.addWithOccurrences!(3, 2);
>>> a.add!(5);
>>> a.sortedElements
[1 -> 3, 3 -> 2, 5 -> 1]
```

To remove an element from a `Multiset` use `remove`:

```
>>> let a = Multiset([1 1 1 3 3 5], ==);
>>> a.remove!(1);
>>> a.remove!(3);
>>> a.remove!(5);
>>> a.sortedElements
[1 -> 2, 3 -> 1]
```

Compare for equality:

```
>>> let a = Multiset([1 1 1 3 3 5], ==);
>>> let b = Multiset([1 3 5 1 3 1], ==);
>>> a = b
true
```

Store string:

```
>> Multiset([1 1 1 2 3 3], ==)
>> .storeString
Multiset(
	Map(
		[[1, 3], [2, 1], [3, 2]]
	)
)

>> Multiset([1 1 1 2 3 3], =)
>> .storeString
Multiset(
	Dictionary(
		[1 -> 3, 2 -> 1, 3 -> 2]
	)
)
```

Convert the list _x_ to a `Multiset`.
At a `List` of integers:

```
>>> Multiset([1 1 1 3 3 5], ==)
>>> .sortedElements
[1 -> 3, 3 -> 2, 5 -> 1]

>>> Multiset([1 1 1 3 3 5], ==)
>>> .sortedCounts
[3 -> 1, 2 -> 3, 1 -> 5]
```

Count occurrences of characters in a string:

```
>>> List'occurrences'
>>> .Multiset(==)
>>> .sortedCounts
[
	3 -> 'c',
	2 -> 'e', 2 -> 'r',
	1 -> 's', 1 -> 'n', 1 -> 'u', 1 -> 'o'
]
```

To convert a collection to a `Multiset` use `collectionToMultiset` (or `Multiset`),
to convert a `Multiset` to a `Set` use `multisetToSet` (or `Set`),
to convert a `Multiset` to a `List` use `multitsetToList` (or `List`).

* * *

See also: Dictionary, Set, add, addWithOccurrences, isImmediate, remove, sortedCounts, sortedElements, valuesAndCounts

Guides: Set Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Multiset.html)
[2](https://reference.wolfram.com/language/ref/Tally.html),
_Smalltalk_
5.7.1.4
5.7.6,
_W_
[1](https://en.wikipedia.org/wiki/Multiset)

Categories: Collection, Type
