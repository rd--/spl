# fromToKeysAndValuesDo

- _fromToKeysAndValuesDo(aSequence, start, stop, aBlock:/2)_

Evaluate _aBlock_ for all elements of _aSequence_ between indices start and stop (inclusive).

```
>>> let list = [];
>>> 1:9.fromToKeysAndValuesDo(3, 7) { :each :index | list.add([each.-, index]) };
>>> list
[-3 3; -4 4; -5 5; -6 6; -7 7]
```

* * *

See also: do, fromToDo, toDo

References:
_Smalltalk_
5.7.8.19

Categories: Enumerating
