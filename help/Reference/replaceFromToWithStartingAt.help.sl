# replaceFromToWithStartingAt

- _replaceFromToWithStartingAt(aSequence, start, stop, anotherSequence, index)_

Destructively replace elements from _start_ to _stop_ in _aSequence_ with _anotherSequence_ starting at _index_.
Answer _aSequence_ itself.
Use copyReplaceFromToWith for insertion or deletion that may alter the size of the answer.

```
>>> let list = [1 .. 7];
>>> list.replaceFromToWithStartingAt(3, 5, [-3 -4 -5], 1);
>>> list
[1 2 -3 -4 -5 6 7]
```

* * *

See also: copyReplaceFromToWith

References:
_Smalltalk_
5.7.12.5

Categories: Accessing
