# assertIsValidIndex

- _assertIsValidIndex(aCollection, index)_

If `includesIndex` answers `true`,
answer _index_,
else signal an `Error`.

Valid index at `Range`:

```
>>> 1:9.assertIsValidIndex(7)
7
```

Invalid index at `Range`:

```
>>> {
>>> 	1:5.assertIsValidIndex(7)
>>> }.ifError { true }
true
```

Invalid index at at `List`:

```
>>> {
>>> 	[1 2 3 4 5].assertIsValidIndex(-1)
>>> }.ifError { true }
true

* * *

See also: includesIndex

Categories: Asserting
