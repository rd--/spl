# replaceFromToWithStartingAt!

- _replaceFromToWithStartingAt!(a, i, j, b, k)_

Destructively replace elements from start index _i_ to stop index _j_ in the sequence _a_ with _b_,
starting at index _k_.
Answer _a_.
Use `copyReplaceFromToWith` for insertion or deletion that may alter the size of the answer.

```
>>> let list = [1 .. 7];
>>> list
>>> .replaceFromToWithStartingAt!(
>>> 	3, 5, [-3 -4 -5], 1
>>> );
>>> list
[1 2 -3 -4 -5 6 7]
```

* * *

See also: copyReplaceFromToWith, replaceFromToWith

Guides: Copying Functions

References:
_Smalltalk_
5.7.12.5
