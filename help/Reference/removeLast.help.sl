# removeLast

- _removeLast(alpha)_ => _removeLast(alpha, 1)_
- _removeLast(aSequence, anInteger)_

In the unary case, remove the last element of _aSequence_ and answer it.
If the collection is empty it is an error.

```
>>> let list = [1 .. 9];
>>> list.removeLast = 9 & { l.size = 8 }
true
```

In the binary case remove the last _anInteger_ items:

```
>>> let list = [1 .. 5];
>>> (list.removeLast(3), list)
([3 4 5], [1 2])
```

* * *

See also: remove, removeFirst

References:
_Smalltalk_
5.7.16.3

Categories: Removing
