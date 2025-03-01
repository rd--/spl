# addLast

- _addLast(aSequence, newObject)_

Add _newObject_ to the end of _aSequence_.
Answer _newObject_.

```
>>> let l = [1];
>>> l.addLast(2);
>>> l.addLast(3) = 3 & { l = [1 2 3] }
true
```

Append a row to a matrix:

```
>>> let m = [1 2; 3 4];
>>> m.addLast([5 6]);
>>> m
[1 2; 3 4; 5 6]
```

Append to each row in a matrix:

```
>>> let m = [1 2; 3 4];
>>> m.do { :each | each.addLast(0) };
>>> m
[1 2 0; 3 4 0]
```

Append a column to a matrix:

```
>>> let m = [1 2; 3 4];
>>> let c = [-1 -2];
>>> m.withIndexDo { :r :i |
>>> 	r.addLast(c[i])
>>> };
>>> m
[1 2 -1; 3 4 -2]
```

* * *

See also: add, addFirst

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/AppendTo.html),
_Smalltalk_
5.7.18.13

Categories: Adding
