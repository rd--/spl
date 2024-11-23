# Bag

A `Type` holding an unordered collection of possibly duplicated elements,
also called a _multiset_.

`Bag` collates elements according `==` not `=`,
i.e. `Bag` is an identity bag, not an equality bag.

To convert a collection to a `Bag` use `asBag`,
to convert a `Bag` to a `Set` use `asSet`,
to convert a `Bag` to a `List` use `asList`:

```
>>> let list = [1 1 1 3 3 5];
>>> let bag = list.asBag;
>>> let set = bag.asSet;
>>> (list.size, bag.size, set.size, bag.asList)
(6, 6, 3, list)
```

To get the elements as a `List` of `Association`s use `sortedCounts` or `sortedElements`.

```
>>> let bag = [1 1 1 3 3 5].asBag;
>>> (bag.sortedCounts, bag.sortedElements)
([3 -> 1, 2 -> 3, 1 -> 5], [1 -> 3, 3 -> 2, 5 -> 1])
```

To get the elements as a `Map` use `valuesAndCounts`:

```
>>> [1 1 1 3 3 5].asBag.valuesAndCounts
[1 -> 3, 3 -> 2, 5 -> 1].asMap
```

To count the occurences of an item, also called the _multiplicity_, use `occurrencesOf`:

```
>>> let bag = [1 1 1 3 3 5].asBag;
>>> bag.occurrencesOf(3)
2
```

The `size`, also called the _cardinality_, of a `Bag` is the `sum` of the counts:

```
>>> let bag = [1 1 1 3 3 5].asBag;
>>> (bag.size, 3 + 2 + 1)
(6, 6)
```

To add an element to a `Bag` use `add` or `addWithOccurrences`:

```
>>> let bag = [1 1 1].asBag;
>>> bag.addWithOccurrences(3, 2);
>>> bag.add(5);
>>> bag.sortedElements
[1 -> 3, 3 -> 2, 5 -> 1]
```

To remove an element to a `Bag` use `remove`:

```
>>> let bag = [1 1 1 3 3 5].asBag;
>>> bag.remove(1);
>>> bag.remove(3);
>>> bag.remove(5);
>>> bag.sortedElements
[1 -> 2, 3 -> 1]
```

* * *

See also: add, addWithOccurrences, asBag, remove, sortedCounts, sortedElements, Set, valuesAndCounts

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Multiset.html),
_Smalltalk_
5.7.6,
_W_
[1](https://en.wikipedia.org/wiki/Multiset)

Smalltalk: IdentityBag

Categories: Collection, Type
