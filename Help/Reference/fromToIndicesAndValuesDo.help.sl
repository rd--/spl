# fromToIndicesAndValuesDo

- _fromToIndicesAndValuesDo(c, i, j, f/2)_

Evaluate the block _f_ for all elements of the sequence _c_ between start index _i_ and stop index _j_ (inclusive).
Answers `nil`.

At `List`:

```
>>> let a = 1:9.collect(printString/1);
>>> let b = [];
>>> a.fromToIndicesAndValuesDo(
>>> 	3, 7
>>> ) { :i :x |
>>> 	b.add([-i x])
>>> };
>>> b
[-3 '3'; -4 '4'; -5 '5'; -6 '6'; -7 '7']
```

* * *

See also: do, fromToDo, keysAndValuesDo, toDo

Guides: Iteration Functions

References:
_Smalltalk_
5.7.8.19

Categories: Enumerating
