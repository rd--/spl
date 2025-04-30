# isSequenceable

- _isSequenceable(anObject)_

Answers `true` if _anObject_ implements the `Sequenceable` trait.

At `List`:

```
>>> List().isSequenceable
true
```

At `Range` answers true:

```
>>> Range(0, 9, 1).isSequenceable
true
```

At `Tuple`:

```
>>> (1, 2, 3).isSequenceable
true
```

At `IdentityBag` answers false:

```
>>> IdentityBag().isSequenceable
false
```

At `Map` answers false:

```
>>> Map().isSequenceable
false
```

At `Record` answers false:

```
>>> Record().isSequenceable
false
```

At `IdentitySet` answers false:

```
>>> IdentitySet().isSequenceable
false
```

At `String` answers false:

```
>>> 'x'.isSequenceable
false
```

`Object` answers false:

```
>>> nil.isSequenceable
false
```

* * *

See also: isCollection, isDictionary, isIndexable

Categories: Testing
