# isSequenceable

- _isSequenceable(x)_

Answers `true` if the object _x_ implements the `Sequenceable` trait.

At `List` answers `true`:

```
>>> List().isSequenceable
true
```

At `Range` answers `true`:

```
>>> Range(0, 9, 1).isSequenceable
true
```

At `Tuple`, which is not a proper sequence:

```
>>> (1, 2, 3).isSequenceable
false
```

At `IdentityMultiset` answers false:

```
>>> IdentityMultiset().isSequenceable
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

See also: isCollection, isDictionary, isIndexable, Sequenceable

Categories: Testing
