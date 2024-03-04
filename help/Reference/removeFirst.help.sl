# removeFirst

- _removeFirst(aSequence)_
- _removeFirst(aSequence, anInteger)_

Remove the first _anInteger_ element of _aSequence_ and answer it.
If the sequence is empty it is an error.

```
>>> let l = [1 .. 9];
>>> l.removeFirst = 1 & { l = [2 .. 9] }
true

>>> let l = [1 .. 9];
>>> l.removeFirst(3) = [1 .. 3] & { l = [4 .. 9] }
true
```

* * *

See also: remove, removeLast

References:
_Smalltalk_
5.7.16.2

Categories: Removing
