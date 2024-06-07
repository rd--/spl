# toDo

- _toDo(start, stop, aBlock:/1)_ ≡ _to(start, stop).do(aBlock:/1)_

Iterate over the range from _start_ to _stop_ counting by one.

```
>>> let l = [];
>>> 1.toDo(9) { :each | l.add(each) };
>>> l
[1 2 3 4 5 6 7 8 9]
```

If _stop_ is less than _start_ the range is empty and there are no values to iterate over.

```
>>> let l = [];
>>> 9.toDo(1) { :each | l.add(each) };
>>> l
[]
```

* * *

See also: do, downToDo, Range, to, toByDo

References:
_Smalltalk_
5.6.2.40

Categories: Enumeration, Range
