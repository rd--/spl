# Collection

_Collection_ is a trait holding behaviours common to collections.

	system.traitDictionary['Collection'].isTrait = true
	system.traitTypes('Collection').includes('Array') = true

Methods for testing: isEmpty, occurrencesOf, anySatisfy, allSatisfy, includes, includesAllOf, includesAnyOf

Methods for accessing: anyOne

Methods for enumerating: do, doSeparatedBy, select, reject, collect, detect, detectIfNone, injectInto, collectThenSelect, selectThenCollect, count

Methods for set logic: difference

_size_ and _do_ are the basic methods of a collection.

- do(aCollection, aBlock:/1): Evaluate _aBlock_ with each element of _aCollection_ as the argument.
- size(aCollection): Answer how many elements _aCollection_ contains.

* * *

See also: Dictionary, do, SequenceableCollection, size

Categories: Collection, Trait
