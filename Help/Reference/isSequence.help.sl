# isSequence

- _isSequence(x)_

Answers `true` if the object _x_ implements the `Sequence` trait.

At `List` answers `true`:

```
>>> List().isSequence
true
```

At `Range` answers `true`:

```
>>> Range(0, 9, 1).isSequence
true
```

At `Tuple`, which is not a proper sequence:

```
>>> (1, 2, 3).isSequence
false
```

At `IdentityMultiset` answers false:

```
>>> IdentityMultiset().isSequence
false
```

At `Map` answers false:

```
>>> Map().isSequence
false
```

At `Record` answers false:

```
>>> Record().isSequence
false
```

At `IdentitySet` answers false:

```
>>> IdentitySet().isSequence
false
```

At `String` answers false:

```
>>> 'x'.isSequence
false
```

`Object` answers false:

```
>>> nil.isSequence
false
```

* * *

See also: isCollection, isDictionary, isIndexable, Sequence

Categories: Testing
