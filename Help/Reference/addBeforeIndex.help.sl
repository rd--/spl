# addBeforeIndex!

- _addBeforeIndex!([x₁ x₂ …], y, i)_

Add a new object _y_ as an element of the sequence _x_ in-place.
Put it in the sequence just before the index _i_,
so that afterwards it is accessible at _i_.
Answer _y_.

```
>>> let l = [1 2 3 4 6];
>>> l.addBeforeIndex!(0, 1);
>>> l.addBeforeIndex!(5, 6);
>>> (l, l[1], l [6])
([0 1 2 3 4 5 6], 0, 5)
```

Add before the first index,
and then after the last index:

```
>>> let l = ['x' 'y'];
>>> l.addBeforeIndex!('w', 1);
>>> l.addBeforeIndex!('z', 4);
>>> l
['w' 'x' 'y' 'z']
```

* * *

See also: add, addAfterIndex, addBefore, copyReplaceFromToWith, insertAt

References:
_Smalltalk_
5.7.18.5

Categories: Adding
