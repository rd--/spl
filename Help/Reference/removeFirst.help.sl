# removeFirst

- _removeFirst([x₁ x₂ …],  n)_

Remove the first _n_ element of the sequence _x_ and answer the item (or items) removed.
If the sequence is empty it is an error.

The unary form removes one item:

```
>>> let l = [1 .. 9];
>>> let a = l.removeFirst;
>>> let b = l.removeFirst(1);
>>> (a, b, l)
(1, [2], [3 .. 9])
```

Remove three items:

```
>>> let l = [1 .. 9];
>>> (l.removeFirst(3), l)
([1 .. 3], [4 .. 9])
```

* * *

See also: remove, removeLast

Guides: List Functions

References:
_Smalltalk_
5.7.16.2

Categories: Removing
