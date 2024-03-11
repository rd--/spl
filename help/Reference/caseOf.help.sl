# caseOf

- _caseOf(anObject, aCollection)_

The elements of _aCollection_ are associations between blocks.
Answer the evaluated value of the first association whose evaluated key equals _anObject_.

```
>>> let c = ['a' -> 1, 'b' -> 2, 'c' -> 3];
>>> 'b'.caseOf(c)
2

>>> let c = [{ 'a' } -> { 1 * 1 }, { 'b' } -> { 2 * 2 }, { 'c' } -> { 3 * 3 }];
>>> 'b'.caseOf(c)
4
```

If no match is found, report an error:

```
>>> let c = ['a' -> 1, 'b' -> 2, 'c' -> 3];
>>> { 'd'.caseOf(c) }.ifError { true }
true
```

* * *

See also: caseOfOtherwise

Categories: Casing
