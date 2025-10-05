# addAfterIndex

- _addAfterIndex([x₁ x₂ …], y, i)_

Add the new object _y_ as an element of the sequence _x_.
Put it in the sequence just after the index _i_,
so that afterwards is it accessible at _i+1_.
Answer _y_.

```
>>> let l = ['w' 'x' 'z'];
>>> let r = l.addAfterIndex('y', 2);
>>> (r, l, l[2 + 1])
('y', ['w' 'x' 'y' 'z'], 'y')
```

To add to the start of a `List` specify the index to be `zero`:

```
>>> let l = [2 3 4];
>>> (l.addAfterIndex(1, 0), l)
(1, [1 2 3 4])
```

To add to the end of a `List` specify the index to be the `size` of the list:

```
>>> let l = [1 2 3];
>>> (l.addAfterIndex(4, 3), l)
(4, [1 2 3 4])
```

* * *

See also: add, addAfter, addBefore, addBeforeIndex, insertAt

Guides: List Functions

References:
_Smalltalk_
5.7.18.3

Categories: Adding
