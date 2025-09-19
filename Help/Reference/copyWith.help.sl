# copyWith

- _copyWith(c, x)_

Answer a copy of the collection _c_ with new element _x_ added (as the last element if _c_ is sequenceable).

At `List`:

```
>>> let l = [1 2 3];
>>> (l, l.copyWith(4))
([1 2 3], [1 2 3 4])
```

At `Set`:

```
>>> {|1, 2, 3|}.copyWith(4)
{|1, 2, 3, 4|}
```

At `Bag`:

```
>>> Bag([|'x' -> 2, 'y' -> 1|])
>>> .copyWith('y')
Bag([|'x' -> 2, 'y' -> 2|])
```

* * *

See also: copy, copyFromTo, copyWithout

Guides: Copying Functions

Categories: Copying
