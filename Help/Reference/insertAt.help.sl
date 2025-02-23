# insertAt

- _insertAt(aSequence, anObject, anInteger)_

Inserts _anObject_ at position _anInteger_ in _aSequence_,
so that afterwards it is accessible at the specified index.
Answer _anObject_.

At `List` of `String`:

```
>>> let l = 'abcde'.contents;
>>> let r = l.insertAt('x', 3);
>>> (r, l, l[3])
('x', ['a' 'b' 'x' 'c' 'd' 'e'], 'x')
```

Equivalent to `addBeforeIndex`:

```
>>> let l = [1 2 4 5 6];
>>> let r = l.addBeforeIndex(3, 3);
>>> (r, l, l[3])
(3, [1 2 3 4 5 6], 3)
```

* * *

See also: addAfter, addAfterIndex, addBeforeIndex, at, copyReplaceFromToWith, removeAt
