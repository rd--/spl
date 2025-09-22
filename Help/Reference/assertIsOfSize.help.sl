# assertIsOfSize

- _assertIsOfSize(c, n)_

Identity if the collection _c_ is of size _n_, else signal an `error`.
Answers _c_.

```
>>> 1:4.assertIsOfSize(4)
1:4

>>> {
>>> 	1:4.assertIsOfSize(3)
>>> }.hasError
true
```

* * *

See also: assert, assertIsString

Categories: Asserting
