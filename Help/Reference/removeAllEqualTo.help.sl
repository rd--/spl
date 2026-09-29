# removeAllEqualTo!

- _removeAllEqualTo!(c, x)_

Remove every element of the collection _c_ that compares equal to the object _x_ in-place.

```
>>> let x = [1 2 2 3 3 3];
>>> let y = x.removeAllEqualTo!(3);
>>> (x, y)
([1 2 2], nil)
```

* * *

See also: removeAllSuchThat, without

Categories: Removing
