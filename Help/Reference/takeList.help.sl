# takeList

- _takeList(aSequence, counts)_

Answer the `List` of results obtained by successively taking _counts[i]_ elements from _aSequence_.

At `List`:

```
>>> [1 .. 10].takeList([1 2 3 4])
[1; 2 3; 4 5 6; 7 8 9 10]
```

At `Range`:

```
>>> 1:9.takeList([3 3 3])
[1:3 4:6 7:9]
```

Subdivide a list in sublists of different lengths using `takeList`:

```
>>> 1:10.takeList([4 2 3 1])
[1:4 5:6 7:9 10:10]
```

The original list can be reconstructed using flatten:

```
>>> let l = [1 .. 10];
>>> let t = l.takeList([4 2 3 1]);
>>> t.flatten
l
```

* * *

See also: drop, partition, take

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/TakeList.html)
