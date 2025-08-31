# detectMax

- _detectMax(c, f:/1)_

Evaluate the block _f_ with each of the elements of the collection _c_ as the argument.
Answer the first element for which _f_ evaluates to the highest magnitude.
If the collection _c_ is empty, answer `nil`.

```
>>> [3; 2 3; 1 2 3].detectMax(size:/1)
[1 2 3]

>>> [1 3 5 3 1 5].detectMax(identity:/1)
5

>>> [].detectMax(identity:/1)
nil
```

`maximalBy` answer all maxima:

```
>>> [1 3 5 3 1 5].maximalBy(identity:/1)
[5 5]
```

* * *

See also: detect, detectMin, maximalBy

Categories: Enumerating
