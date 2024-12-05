# removeFirst

- _removeFirst(aSequence)_
- _removeFirst(aSequence, anInteger)_

Remove the first _anInteger_ element of _aSequence_ and answer it.
If the sequence is empty it is an error.

The unary form removes one item:

```
>>> let l = [1 .. 9];
>>> (l.removeFirst, l)
(1, [2 .. 9])
true
```

Remove three items:

```
>>> let l = [1 .. 9];
>>> (l.removeFirst(3), l)
([1 .. 3], [4 .. 9])
```

* * *

See also: remove, removeLast

References:
_Smalltalk_
5.7.16.2

Categories: Removing
