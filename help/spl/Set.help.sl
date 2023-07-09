# Set -- collection type

- _Set()_
- _Set(aCollection)_

A collection of objects without duplicates.
The comparison operator is ==, not =, i.e. Set is an identity set, not an equality set.

	Set().isSet
	Set().size = 0
	[1, 1, 2, 1, 2, 3].Set.size = 3

* * *

See also: Bag

Smalltalk: _IdentitySet_

* * *

- add(self, newObject): Include newObject as one of the receivers elements, but only if not already present. Answer newObject.
- ifAbsentAdd(self, anObject): Ensure anObject is part of the receiver.  Answer whether its membership was newly acquired.
