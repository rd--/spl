# withDo

- _withDo(aSequence, anotherSequence, aBlock:/2)_

Evaluate _aBlock_ with corresponding elements from _aSequence_ and _anotherSequence_,
which must have the same `size`.

```
>>> let x = [];
>>> 2:5.withDo(7:4) { :i :j |
>>> 	x.add([i, j, i - j])
>>> };
>>> x
[2 7 -5; 3 6 -3; 4 5 -1; 5 4 1]
```

* * *

See also: do, reverseWithDo, withCollect, withIndexDo

References:
_Smalltalk_
5.7.8.28

Categories: Enumerating
