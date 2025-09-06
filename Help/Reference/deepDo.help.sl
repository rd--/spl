# deepDo

- _deepDo(c, f:/1)_

Run `do` over the iterable collection _c_,
descending into elements that are of the same type as _c_,
else applying the block _f_.

At `List`:

```
>>> let l = [];
>>> ['a', ['b', ['c', ['d']]]].deepDo { :each |
>>> 	l.add(each)
>>> };
>>> l
['a' 'b' 'c' 'd']
```

At `Record`:

```
>>> let l = [];
>>> (x: 'a', y: (x: 'b', y: (x: 'c')))
>>> .deepDo { :each |
>>> 	l.add(each)
>>> };
>>> l
['a' 'b' 'c']
```

* * *

See also: deepAllSatisfy, deepCollect, deepIndices, do

Guides: Iteration Functions

Categories: Enumerating
