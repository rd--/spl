# toDo

- _toDo(i, j, f:/1)_

Iterate over the range from the start index _i_ to the stop index _j_ counting by one.

```
>>> let l = [];
>>> 1.toDo(9) { :each | l.add(each) };
>>> l
[1 2 3 4 5 6 7 8 9]
```

If _j_ is less than _i_ the range is empty and there are no values to iterate over:

```
>>> let l = [];
>>> 9.toDo(1) { :each | l.add(each) };
>>> l
[]
```

* * *

See also: do, downToDo, Range, to, toByDo

Guides: Iteration Functions

References:
_Smalltalk_
5.6.2.40

Categories: Enumeration, Range
