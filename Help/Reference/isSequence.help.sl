# isSequence

- _isSequence(aCollection)_

Answers `true` if the elements of _aCollection_ can be accessed using an integral index between one and the size of the collection.

At `List`:

```
>>> List().isSequence
true
```

At `IdentityBag`:

```
>>> IdentityBag().isSequence
false
```

At `Map`:

```
>>> Map().isSequence
false
```

At `Record`:

```
>>> Record().isSequence
false
```

At `IdentitySet`:

```
>>> IdentitySet().isSequence
false
```

At `String`:

```
>>> ''.isSequence
true
```

`Object` answers false:

```
>>> nil.isSequence
false
```

* * *

See also: isCollection, isDictionary, isIndexable

Categories: Testing
