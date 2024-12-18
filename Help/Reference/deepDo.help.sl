# deepDo

- _deepDo(anIterable, aBlock:/1)_

Run `do` over _anIterable_,
descending into elements that are of the same type as _anIterable_,
else applying _aBlock_.

At `List`:

```
>>> let l = [];
>>> ['a', ['b', ['c', ['d']]]].deepDo { :each |
>>> 	l.add(each)
>>> };
>>> l
['a' 'b' 'c' 'd']
```

At `Tuple`:

```
>>> let l = [];
>>> ('a', ('b', ('c', 'd'))).deepDo { :each |
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

See also: deepCollect, deepIndices, do

Categories: Enumerating
