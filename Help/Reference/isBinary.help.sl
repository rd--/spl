# isBinary

- _isBinary(anObject)_

Predicate to test if a value implements the `Binary` trait.

```
>>> 23.isBinary
true

>>> 3.141.isBinary
false

>>> 3/4.isBinary
false
```

At `SmallFloat` only 31-bit integer values answer `true`:

```
>>> 2166136261.isBinary
false

>>> 2166136261L.isBinary
true
```

* * *

See also: Binary

Categories: Testing
