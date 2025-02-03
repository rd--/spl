# isIndexable

- _isIndexable(anObject)_

Answers `true` if _anObject_ is a `Collection` where the elements can be accessed using an index.
The index may be of any type, so that `List` and `Map` and `Record` all answer `true`.

At `List`:

```
>>> List().isIndexable
true
```

At `IdentityBag`:

```
>>> IdentityBag().isIndexable
false
```

At `Map`:

```
>>> Map().isIndexable
true
```

At `Record`:

```
>>> Record().isIndexable
true
```

At `IdentitySet`:

```
>>> IdentitySet().isIndexable
false
```

* * *

See also: isCollection, isDictionary, isSequence, List, Map, Record

Categories: Testing
