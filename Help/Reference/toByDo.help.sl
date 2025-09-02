# toByDo

- _toByDo(i, j, k, f:/1)_

Iterate over the range from the start index _i_ to the stop index _j_ counting by step _k_.

```
>>> let r = [];
>>> 9.toByDo(1, -2) { :each |
>>> 	r.add(each)
>>> };
>>> r
[9 7 5 3 1]
```

If the range is empty there are no values to iterate over:

```
>>> let r = [];
>>> 9.toByDo(1, 2) { :each |
>>> 	r.add(each)
>>> };
>>> r
[]
```

* * *

See also: do, downToDo, Range, to, toDo, upToDo

Guides: Iteration Functions

References:
_Smalltalk_
5.6.2.39

Categories: Enumeration, Iteration
