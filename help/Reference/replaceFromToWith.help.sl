# replaceFromToWith

- _replaceFromToWith(aSequence, start, stop, replacementElements)_

Replace the elements of _aSequence_ between positions start and stop inclusive with the elements of _replacementElements_ in their original order.
Answer _aSequence_.

```
>>> let l = [1 .. 7];
>>> (l.replaceFromToWith(3, 5, [-3 -4 -5]) == l, l)
(true, [1 2 -3 -4 -5 6 7])
```

* * *

See also: atPut, fromToDo

References:
_Smalltalk_
5.7.12.4
