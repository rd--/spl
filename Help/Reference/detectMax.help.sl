# detectMax

- _detectMax(aCollection, aBlock:/1)_

Evaluate _aBlock_ with each of the elements of _aCollection_ as the argument.
Answer the element for which _aBlock_ evaluates to the highest magnitude.
If _aCollection_ is empty, answer `nil`.

```
>>> [3; 2 3; 1 2 3].detectMax(size:/1)
[1 2 3]

>>> [1 3 5 3 1].detectMax(identity:/1)
5

>>> [].detectMax(identity:/1)
nil
```

* * *

See also: detect, detectMin

Categories: Enumerating
