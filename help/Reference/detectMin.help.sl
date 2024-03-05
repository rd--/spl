# detectMin

- _detectMin(aCollection, aBlock:/1)_

Evaluate _aBlock_ with each of the elements of _aCollection_ as the argument.
Answer the element for which _aBlock_ evaluates to the lowest magnitude.
If _aCollection_ is empty, return nil.

```
>>> [3; 2 3; 1 2 3].detectMin(size:/1)
[3]
```

* * *

See also: detect, detectMax

Categories: Enumerating
