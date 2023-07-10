# toArray -- converting

- _toArray(aCollection)_ ≡ _asArray(aCollection)
- _toArray(anObject)_ ≡ _[anObject]_

If the argument is not a collection answer a single element array,
else answer the collection as an array.

	1.toArray = [1].toArray
	| a = [1]; | a.toArray == a

* * *

See also: Array asArray
