# isSequence

_isSequence(aCollection)_

Answers true if the elements of _aCollection_ can be accessed using an integral index between one and the size of the collection.

```
>>> List().isSequence
true

>>> Bag().isSequence
false

>>> Map().isSequence
false

>>> Record().isSequence
false

>>> Set().isSequence
false
```

Object answers false:

```
>>> nil.isSequence
false
```

* * *

See also: isCollection, isDictionary, isIndexable

Categories: Testing
