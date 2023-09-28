# asCollection -- converting

- _asCollection(aCollection)_ ⟹ _aCollection_
- _asCollection(anObject)_ ⟹ _[anObject]_

If the argument is a collection, answer the collection,
else answer a single element array containing the argument.

	1.asCollection = [1]
	[1].asCollection = [1]
	| a = [1]; | a.asCollection == a

* * *

See also: Array, asArray, assertIsCollection
