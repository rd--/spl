# instill (instill!)

- _instill(c, i, x, y)_

Ensure the list _c_ has at least _i_ places,
adding _y_ as required,
and set the value at index _i_ to _x_.
There are both in-place and copying forms.

```
>>> [10 20 30 40].instill!(3, -30, nil)
[10 20 -30 40]

>>> [10 20].instill!(3, -30, nil)
[10 20 -30]

>>> let a = [10];
>>> let b = a.instill!(3, -30, 20);
>>> (a, a == b)
([10 20 -30], true)

>>> let a = [10];
>>> let b = a.instill(3, -30, 20);
>>> (a, b)
([10], [10 20 -30])
```

Combine with `nest` to instill into a value that may not be a list:

```
>>> let x = 10;
>>> x.nest.instill!(3, -30, 20)
[10 20 -30]
```

* * *

See also: nest

Guides: List Functions

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/SequenceableCollection.html#-instill)
