# Collection -- collection trait

_Collection_ is a trait holding behaviours common to collections.

	system.traitDictionary['Collection'].isTrait = true
	system.traitTypes('Collection').includes('Array') = true

_size_ and _do_ are the basic methods of a collection.

- do(self, aBlock:/1): Evaluate aBlock with each of the receiver's elements as the argument.
- size(self): Answer how many elements the receiver contains.

For mutable collections:

- add(self, newObject): Include newObject as one of the receiver's elements. Answer newObject.
- remove(self, oldObject): Remove oldObject from the receiver's elements. Answer oldObject unless no element is equal to oldObject, in which case, raise an error.

* * *

See also: _Dictionary_, _SequenceableCollection_
