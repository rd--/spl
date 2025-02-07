# fromToKeysAndValuesDo

- _fromToKeysAndValuesDo(aSequence, start, stop, aBlock:/2)_

Evaluate _aBlock_ for all elements of _aSequence_ between indices start and stop (inclusive).

At `List`:

```
>>> let list = 1:9.collect(printString:/1);
>>> let answer = [];
>>> list
>>> .fromToKeysAndValuesDo(3, 7) { :key :value |
>>> 	answer.add([key.negated, value])
>>> };
>>> answer
[-3 '3'; -4 '4'; -5 '5'; -6 '6'; -7 '7']
```

* * *

See also: do, fromToDo, keysAndValuesDo, toDo

References:
_Smalltalk_
5.7.8.19

Categories: Enumerating
