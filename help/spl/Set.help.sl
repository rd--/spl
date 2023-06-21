# Set - collection type

A collection of objects without duplicates.

* * *

See also: _Bag_

Smalltalk: _IdentitySet_

* * *

- add(self, newObject): Include newObject as one of the receivers elements, but only if not already present. Answer newObject.
- ifAbsentAdd(self, anObject): Ensure anObject is part of the receiver.  Answer whether its membership was newly acquired.
