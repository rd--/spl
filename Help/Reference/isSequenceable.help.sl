# isSequenceable

- _isSequenceable(anObject)_

Answers `true` if _anObject_ implements the `Sequenceable` trait.

At `List`:

```
>>> List().isSequenceable
true
```

At `IdentityBag`:

```
>>> IdentityBag().isSequenceable
false
```

At `Map`:

```
>>> Map().isSequenceable
false
```

At `Record`:

```
>>> Record().isSequenceable
false
```

At `IdentitySet`:

```
>>> IdentitySet().isSequenceable
false
```

At `String`:

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
