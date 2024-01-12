# Bag -- collection type

An unordered collection of possibly duplicated elements.

Bag collates elements according to identity, ie. _==_.

To convert a collection to a Bag use _asBag_.

To add an element to a Bag use _add_.

To get the elements as an Array of Associations use _sortedCounts_ or _sortedElements_.

* * *

See also: add, asBag, sortedCounts, sortedElements, Set

Smalltalk: _IdentityBag_

* * *

- add(self, newObject): Include newObject as one of the receiver's elements. Answer newObject.
- sortedCounts(self): Answer with a collection of counts with elements, sorted by decreasing count.
- sortedElements(self): Answer with a collection of elements with counts, sorted by element.
