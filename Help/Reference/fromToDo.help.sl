# fromToDo

- _fromToDo([x₁ x₂ …], i, j, f/1)_

Evaluate the block _f_ for all elements of the sequence _x_ between indices _i_ and _j_ (inclusive).
Answers `nil`.

```
>>> let list = [];
>>> 1:9.fromToDo(3, 7) { :each | list.add(each) };
>>> list
[3 .. 7]
```

* * *

See also: do, toDo

Guides: Iteration Functions

References:
_Smalltalk_
5.7.8.18

Categories: Enumerating
