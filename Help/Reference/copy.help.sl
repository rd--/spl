# copy

- _copy(x)_

Answer another object just like the object _x_.

For simple immutable instrinsic types, the copy is identical:

```
>>> 1.copy == 1
true

>>> 2.3.copy == 2.3
true

>>> 4L.copy == 4L
true

>>> 'five'.copy == 'five'
true

>>> false.copy == false
true

>>> nil.copy == nil
true
```

For collection types makes a shallow copy,
at `List`:

```
>>> [1 .. 5].copy
[1 .. 5]

>>> let a = [1 .. 5];
>>> a !== a.copy
true

>>> let a = [1 .. 5];
>>> let b = a.copy;
>>> a[1] := -1;
>>> (a, b)
([-1 2 3 4 5], [1 .. 5])
```

* * *

See also: copyFromTo, copyReplaceFromToWith, copyWith, copyWithout, deepCopy

Guides: Copying Functions

References:
_Smalltalk_
5.3.1.6

Categories: Copying
