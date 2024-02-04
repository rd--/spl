# isIndexable -- testing

- _isIndexable(anObject)_

Answers true if _anObject_ is a Collection where the elements can be accessed using an index.
The index may be of any type, so that Lists and Maps and Records all answer true.

	List().isIndexable = true
	Bag().isIndexable = false
	Map().isIndexable = true
	Record().isIndexable = true
	Set().isIndexable = false

* * *

See also: isCollection, isDictionary, isSequenceable
