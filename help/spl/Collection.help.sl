# Collection -- collection trait

_Collection_ is a trait holding behaviours common to collections.

	system.traitDictionary['Collection'].isTrait = true
	system.traitTypes('Collection').includes('Array') = true

Methods for testing: isEmpty, occurrencesOf, anySatisfy, allSatisfy, includes, includesAllOf, includesAnyOf

Methods for accessing: anyOne

Methods for adding and removing: add, addAll, remove removeIfAbsent, removeAll, removeAllFoundIn, removeAllSuchThat

Methods for enumerating: do, doSeparatedBy, select, reject, collect, detect, detectIfNone, injectInto, collectThenSelect, selectThenCollect, count

Methods for set logic: difference

_size_ and _do_ are the basic methods of a collection.

- do(aCollection, aBlock:/1): Evaluate _aBlock_ with each element of _aCollection_ as the argument.
- size(aCollection): Answer how many elements _aCollection_ contains.

For mutable collections:

- add(aCollection, newObject): Include _newObject_ as one of the elements of _aCollection_. Answer _newObject_.
- remove(aCollection, oldObject): Remove _oldObject_ from _aCollection_. Answer _oldObject_, or raise an error.

* * *

See also: Dictionary, do, SequenceableCollection, size
