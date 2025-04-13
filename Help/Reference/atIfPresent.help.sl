# atIfPresent

- _atIfPresent(c, k, f:/1)_

Lookup the value associated with the key _k_ in the collection _c_.
If the key is present,
answer the value of evaluating the unary block _f_ with the value associated with the key.
Otherwise, answer nil.

At `Range`, squares value if index is valid:

```
>>> 1:5.atIfPresent(3) { :x |
>>> 	x * x
>>> }
9
```

If the index is not valid, answers `nil`:

```
>>> 1:5.atIfPresent(9) { :x |
>>> 	false
>>> }
nil
```

* * *

See also: at, atIfAbsent, atIfPresentIfAbsent

Categories: Accessing
