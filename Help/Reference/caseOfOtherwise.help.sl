# caseOfOtherwise

- _caseOfOtherwise(anObject, aCollection, otherwiseBlock:/1)_

The elements of _aCollection_ are associations between blocks.
Answer the evaluated value of the first association whose evaluated key equals _anObject_.

With evaluated cases:

```
>>> let c = ['a' -> 1, 'b' -> 2, 'c' -> 3];
>>> 'b'.caseOfOtherwise(c, identity:/1)
2
```

With un-evaluated cases:

```
>>> let c = [
>>> 	{ 'a' } -> { 1 * 1 },
>>> 	{ 'b' } -> { 2 * 2 },
>>> 	{ 'c' } -> { 3 * 3 }
>>> ];
>>> 'b'.caseOfOtherwise(c, identity:/1)
4
```

If no match is found, answer the result of evaluating _otherwiseBlock(anObject)_:

```
>>> let c = ['a' -> 1, 'b' -> 2, 'c' -> 3];
>>> 'd'.caseOfOtherwise(c, identity:/1)
'd'
```

* * *

See also: =, caseOf, if, value, which

Categories: Casing
