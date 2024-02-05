# assertIsOfSize

_assertIsOfSize(aCollection, anInteger)_

Identity if _aCollection_ is of size _anInteger_, else signal an error.
Answers _aCollection_.

```
>>> 1:4.assertIsOfSize(4)
1:4

>>> { 1:4.assertIsOfSize(3) }.ifError { true }
true
```

* * *

See also: assert, assertIsString

Categories: Asserting
