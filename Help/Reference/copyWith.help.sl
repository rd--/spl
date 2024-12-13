# copyWith

- _copyWith(aCollection, newElement)_

Answer a copy of _aCollection_ with _newElement_ added (as last	element if sequenceable).

At `List`:

```
>>> let l = [1 2 3];
>>> (l, l.copyWith(4))
([1 2 3], [1 2 3 4])
```

* * *

See also: copy, copyFromTo, copyWithout

Categories: Copying
