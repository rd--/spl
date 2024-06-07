# toByDo

- _toByDo(start, stop, step, aBlock:/1)_

Iterate over the range from _start_ to _stop_ counting by _step_.

```
>>> let l = [];
>>> 9.toByDo(1, -2) { :each | l.add(each) };
>>> l
[9 7 5 3 1]
```

If the range is empty there are no values to iterate over.

```
>>> let l = [];
>>> 9.toByDo(1, 2) { :each | l.add(each) };
>>> l
[]
```

* * *

See also: do, downToDo, Range, to, toDo, upToDo

References:
_Smalltalk_
5.6.2.39

Categories: Enumeration, Iteration
