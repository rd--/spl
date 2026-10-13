# assertIsCollection

- _assertIsCollection(x)_

Answer _x_ if _x_ is a `FiniteCollection`, else signal an `error`.

```
>>> 1:4.assertIsCollection
1:4
```

A `String` is not a `FiniteCollection`:

```
>>> {
>>> 	'1 to 4'.assertIsCollection
>>> }.hasError
true
```

* * *

See also: assert, assertIsString

Categories: Asserting
