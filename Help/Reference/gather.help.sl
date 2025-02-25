# gather

- _gather(aCollection, aBlock:/1)_

Apply _aBlock_,
which should answer a collection,
to each item in _aCollection_,
and add each item in each answer to the answer.

```
>>> [3 5 7].gather { :each |
>>> 	(1 .. each)
>>> }
[1 2 3 1 2 3 4 5 1 2 3 4 5 6 7]
```

This is equivalent to,
but more efficient than,
the `concatenation` of `collect`:

```
>>> [3 5 7].collect { :each |
>>> 	(1 .. each)
>>> }.concatenation
[1 2 3 1 2 3 4 5 1 2 3 4 5 6 7]
```

* * *

See also: collect, concatenation

Categories: Enumerating
