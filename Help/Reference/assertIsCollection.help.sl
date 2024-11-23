# assertIsCollection

- _assertIsCollection(aCollection)_

Identity if _aCollection_ is, in fact, a collection, else signal an error.

```
>>> 1:4.assertIsCollection
1:4
```

A `String` is not a `Collection`:

```
>>> { '1 to 4'.assertIsCollection }.ifError { true }
true
```

* * *

See also: assert, assertIsString

Categories: Asserting
