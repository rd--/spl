# fromToIndicesAndValuesDo

- _fromToIndicesAndValuesDo(c, i, j, f:/2)_

Evaluate the block _f_ for all elements of the sequence _c_ between start index _i_ and stop index _j_ (inclusive).

At `List`:

```
>>> let list = 1:9.collect(printString:/1);
>>> let answer = [];
>>> list
>>> .fromToIndicesAndValuesDo(
>>> 	3, 7
>>> ) { :key :value |
>>> 	answer.add([key.negate, value])
>>> };
>>> answer
[-3 '3'; -4 '4'; -5 '5'; -6 '6'; -7 '7']
```

* * *

See also: do, fromToDo, keysAndValuesDo, toDo

Guides: Iteration Functions

References:
_Smalltalk_
5.7.8.19

Categories: Enumerating
