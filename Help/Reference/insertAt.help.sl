# insertAt

- _insertAt(c, x, n)_

Inserts the object _x_ at integer index (position) _n_ in the sequential collection _c_,
so that afterwards it is accessible at the specified index.
Answer _x_.

Insert _x_ to be at position three:

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

Guides: List Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Insert.html)
