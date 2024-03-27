# powerSetDo

- _powerSetDo(aCollection, aBlock:/1)_

Apply _aBlock_ to each element of the power set of _aCollection_.

Visit all subsets of the `List` _[1 2 3]_:

```
>>> let l = [];
>>> [1 2 3].powerSetDo { :each | l.add(each) };
>>> l
[; 1; 2; 1 2; 3; 1 3; 2 3; 1 2 3]
```

At `Set`:

```
>>> let l = [];
>>> [1 2 3].asSet.powerSetDo { :each | l.add(each) };
>>> l
[; 1; 2; 1 2; 3; 1 3; 2 3; 1 2 3].collect(asSet:/1)
```

* * *

See also: powerSet, subsets, tuples
