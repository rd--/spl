# Error Handling

There are different ways of indicating an error.

In one form an exceptional value, often `nil`, is answered in the ordinary way.

For instance `indexOf` at `List` answers `zero`,
which is not a valid index,
to indicate that the item was not found:

```
>>> [1 3 5 7 9].indexOf(6)
0
```

In another form an _exception_ is signaled, often by calling `error`.

For instance `at` at `Record` signals an error if the key does not exist.
In this case the exception can be _caught_ using `ifError`:

```
>>> { (x: 1, y: 2).at('z') }.ifError { 'z is not a valid key' }
'z is not a valid key'
```

* * *

See also: ensure, Error, error, ifError, nil, signal

Categories: Error, Exception
