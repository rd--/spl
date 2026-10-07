# assertIsSmallInteger

- _assertIsSmallInteger(x, m='')_

Require that the object _x_ be a small integer:

```
>>> 23.assertIsSmallInteger
23
```

Raise an error if value is not a small integer:

```
>>> {
>>> 	3.141.assertIsSmallInteger
>>> }.hasError
true
```

* * *

See also: assert, error, isSmallInteger

Guides: Type Assertion Functions

Categories: Asserting
