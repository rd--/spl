# atAllValid

- _atAllValid(c, i)_

A variant of `atAll` that discards invalid indices:

```
>>> 1:5.atAllValid([-1 1 3 5 7 9])
[1 3 5]

>>> 1:5.atAllValid([-1 5 9])
[5]

>>> 1:5.atAllValid([-1 9])
[]
```

* * *

See also: atAll, atOrMissingAll

Guides: Indexing Functions, List Functions
