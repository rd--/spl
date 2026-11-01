# copyWith

- _copyWith(c, x)_

Answer a copy of the collection _c_ with new element _x_ added
(as the last element if _c_ is sequenceable).

At `List`:

```
>>> let l = [1 2 3];
>>> (l, l.copyWith(4))
([1 2 3], [1 2 3 4])
```

At `Set`:

```
>>> Set([1 2 3], ==).copyWith(4)
Set([1 2 3 4], ==)
```

At `Multiset`:

```
>>> Multiset['x' 'x' 'y']
>>> .copyWith('y')
Multiset['x' 'x' 'y' 'y']
```

* * *

See also: copy, copyFromTo, copyWithout

Guides: Copying Functions

Categories: Copying
