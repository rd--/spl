# replaceFromToWith!

- _replaceFromToWith!(a, i, j, b)_

Replace the elements of the sequence _a_ between start position _i_ and stop position _j_,
inclusive,
with the elements of _b_ in their original order.
Answer _a_.

```
>>> let a = [1 .. 7];
>>> let b = [-3 -4 -5];
>>> let c = a.replaceFromToWith!(3, 5, b);
>>> (a, a == c)
([1 2 -3 -4 -5 6 7], true)
```

* * *

See also: fromToDo, put, replaceAllWith

Guides: Copying Functions

References:
_Smalltalk_
5.7.12.4
