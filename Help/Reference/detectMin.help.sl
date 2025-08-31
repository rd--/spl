# detectMin

- _detectMin(c, f:/1)_

Evaluate the block _f_ with each of the elements of the collection _c_ as the argument.
Answer the first element for which _f_ evaluates to the lowest magnitude.
If the _c_ is empty, answer `nil`.

```
>>> [3; 2 3; 1 2 3; 4].detectMin(size:/1)
[3]
```

`minimalBy` answers all minimal items:

```
>>> [3; 2 3; 1 2 3; 4].minimalBy(size:/1)
[3; 4]
```

* * *

See also: detect, detectMax, minimalBy

Categories: Enumerating
