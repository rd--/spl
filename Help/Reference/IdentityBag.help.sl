# IdentityBag

- _IdentityBag()_
- _IdentityBag(aMap)_

A `Type` holding an unordered collection of possibly duplicated elements,
also called a _multiset_.

```
>>> [1 -> 3, 2 -> 1, 3 -> 5]
>>> .asMap
>>> .IdentityBag
>>> .sortedCounts
[5 -> 3, 3 -> 1, 1 -> 2]
```

`IdentityBag` collates elements according `==` not `=`,
i.e. `IdentityBag` is an identity bag, not an equality bag.

To convert a `List` to an `IdentityBag` use `asIdentityBag`,
to convert a `IdentityBag` to an `IdentitySet` use `asIdentitySet`,
to convert a `IdentityBag` to a `List` use `asList`:

```
>>> let list = [1 1 1 3 3 5];
>>> let bag = list.asIdentityBag;
>>> let set = bag.asIdentitySet;
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
>>> let bag = [1 1 1 3 3 5].asIdentityBag;
>>> (
>>> 	bag.sortedCounts,
>>> 	bag.sortedElements
>>> )
(
	[3 -> 1, 2 -> 3, 1 -> 5],
	[1 -> 3, 3 -> 2, 5 -> 1]
)
```

To get the elements as a `Map` use `valuesAndCounts`:

```
>>> [1 1 1 3 3 5]
>>> .asIdentityBag
>>> .valuesAndCounts
[1 -> 3, 3 -> 2, 5 -> 1].asMap
```

To count the occurences of an item, also called the _multiplicity_, use `occurrencesOf`:

```
>>> let bag = [1 1 1 3 3 5].asIdentityBag;
>>> bag.occurrencesOf(3)
2
```

The `size`, also called the _cardinality_, of a `IdentityBag` is the `sum` of the counts:

```
>>> let bag = [1 1 1 3 3 5].asIdentityBag;
>>> (bag.size, 3 + 2 + 1)
(6, 6)
```

To add an element to an `IdentityBag` use `add` or `addWithOccurrences`:

```
>>> let bag = [1 1 1].asIdentityBag;
>>> bag.addWithOccurrences(3, 2);
>>> bag.add(5);
>>> bag.sortedElements
[1 -> 3, 3 -> 2, 5 -> 1]
```

To remove an element from an `IdentityBag` use `remove`:

```
>>> let bag = [1 1 1 3 3 5].asIdentityBag;
>>> bag.remove(1);
>>> bag.remove(3);
>>> bag.remove(5);
>>> bag.sortedElements
[1 -> 2, 3 -> 1]
```

Compare instances:

```
>>> let p = [1 2 3].asIdentityBag;
>>> let q = [1 2 3].asIdentityBag;
>>> p = q
true
```

* * *

See also: add, addWithOccurrences, asIdentityBag, Bag, IdentitySet, isImmediate, remove, sortedCounts, sortedElements, Set, valuesAndCounts

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Multiset.html),
_Smalltalk_
5.7.6,
_W_
[1](https://en.wikipedia.org/wiki/Multiset)

Categories: Collection, Type
