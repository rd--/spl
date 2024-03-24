# withIndexDo

- _withIndexDo(aSequence, elementAndIndexBlock:/2)_

Like `withDo` except that the iteration index supplies the second argument to the block.

At `Range`, iterate over indices and values:

```
>>> let l = [];
>>> 3:1.withIndexDo { :each :index |
>>> 	l.add(each -> index)
>>> };
>>> l
[3 -> 1, 2 -> 2, 1 -> 3]
```

At `Record`, iterate over keys and values:

```
>>> let n = 0;
>>> (x: 1, y: 2, z: 3).withIndexDo { :value :key |
>>> 	n := n + value
>>> };
>>> n
6
```

* * *

See also: do, withDo, withIndexCollect, withIndexReplace

Categories: Enumerating
