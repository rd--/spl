# takeList

_takeList(aSequence, counts)_

```
>>> [1 .. 10].takeList([1 2 3 4])
[1; 2 3; 4 5 6; 7 8 9 10]

>>> 1:9.takeList([3 3 3])
[1:3 4:6 7:9]
```

Subdivide a list in sublists of different lengths using TakeList:

```
>>> 1:10.takeList([4 2 3 1])
[1:4 5:6 7:9 10:10]
```

The original list can be reconstructed using flatten:

```
>>> let l = [1 .. 10];
>>> let t = l.takeList([4 2 3 1]);
>>> t.flattened
l
```

* * *

See also: drop, partition, take

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/TakeList.html
