# fromToDo

- _fromToDo(aSequence, start, stop, aBlock:/1)_

Evaluate _aBlock_ for all elements of _aSequence_ between indices start and stop (inclusive).

```
>>> let list = [];
>>> 1:9.fromToDo(3, 7) { :each | list.add(each) };
>>> list
[3 .. 7]
```

* * *

See also: do, toDo

Categories: Enumerating
