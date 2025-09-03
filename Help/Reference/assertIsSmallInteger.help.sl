# assertIsSmallInteger

- _assertIsSmallInteger(x)_

Require that the object _x_ be a small integer:

```
>>> 23.assertIsSmallInteger
23
```

Raise an error if value is not a small integer:

```
>>> {
>>> 	3.141.assertIsSmallInteger
>>> }.ifError { true }
true
```

* * *

See also: assert, error, isSmallInteger

Categories: Asserting
