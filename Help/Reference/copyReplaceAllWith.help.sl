# copyReplaceAllWith

- _copyReplaceAllWith(aSequence, oldSequence, newSequence)_

Answer a copy of _aSequence_ in which all occurrences of _oldSequence_ have been replaced by _newSequence_.

If the old and new sequences are the same size,
the answer is the same size as the initial sequence:

```
>>> let l = [1 2 3 1 2 3 1];
>>> l.copyReplaceAllWith([2 3], [-2 -3])
[1 -2 -3 1 -2 -3 1]
```

Replace with shorter sequence:

```
>>> let l = [1 2 3 1 2 3 1];
>>> l.copyReplaceAllWith([2 3], [0])
[1 0 1 0 1]
```

Replace with longer sequence:

```
>>> let l = [1 2 3 1 2 3 1];
>>> l.copyReplaceAllWith([2 3], [2 3 4])
[1 2 3 4 1 2 3 4 1]
```

Replace singular item with list:

```
>>> [1 2 3 1 2 1]
>>> .copyReplaceAllWith([2], [-2, 2])
[1 -2 2 3 1 -2 2 1]
```

* * *

See also: copy

References:
_Smalltalk_
5.7.8.8

Categories: Copying
