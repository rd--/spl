# isSequenceable -- testing

- _isSequenceable(aCollection)_

Answers true if the elements of _aCollection_ can be accessed using an integral index between one and the size of the collection.

	Array().isSequenceable = true
	Bag().isSequenceable = false
	Map().isSequenceable = false
	Record().isSequenceable = false
	Set().isSequenceable = false

* * *

See also: isCollection, isDictionary, isIndexable
