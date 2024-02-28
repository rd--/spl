# Bag

An unordered collection of possibly duplicated elements.

Bag collates elements according to identity, ie. `==`.

To convert a collection to a `Bag` use `asBag`.

To add an element to a `Bag` use `add`.

To get the elements as a `List` of `Association`s use `sortedCounts` or `sortedElements`.

The `size` of a `Bag` is the sum of the counts:

```
>>> [1 2 2 3 3 3].asBag.size
6
```
* * *

See also: add, asBag, sortedCounts, sortedElements, Set

Smalltalk: IdentityBag

Categories: Collection, Type
