# downToDo

- _downToDo(i, j, f:/1)_

Iterate over the range from the start index _i_ to the stop index _j_ counting by negative one.

```
>>> let l = [];
>>> 9.downToDo(1) { :each | l.add(each) };
>>> l
[9 8 7 6 5 4 3 2 1]
```

If the interval is empty there are no values to iterate over:

```
>>> let l = [];
>>> 1.downToDo(9) { :each | l.add(each) };
>>> l
[]
```

* * *

See also: do, Range, to, toByDo, toDo

Guides: Iteration Functions

References:
_Smalltalk_
5.6.2.39

Categories: Enumeration, Iteration
