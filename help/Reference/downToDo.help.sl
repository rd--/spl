# downToDo

- _downToDo(start, stop, aBlock:/1)_

Iterate over the range from _start_ to _stop_ counting by negative one.

```
>>> let l = [];
>>> 9.downToDo(1) { :each | l.add(each) };
>>> l
[9 8 7 6 5 4 3 2 1]
```

If the interval is empty there are no values to iterate over.

```
>>> let l = [];
>>> 1.downToDo(9) { :each | l.add(each) };
>>> l
[]
```

* * *

See also: do, downToDo, Range, to, toByDo, toDo

References:
_Smalltalk_
5.6.2.39

Categories: Enumeration, Iteration
