# asCollection -- converting

- _asCollection(aCollection)_ ⟹ _aCollection_
- _asCollection(anObject)_ ⟹ _[anObject]_

If the argument is not a collection answer a single element array,
else answer the collection.

	1.asCollection = [1]
	[1].asCollection = [1]
	| a = [1]; | a.asCollection == a

* * *

See also: Array, asArray, assertIsCollection
