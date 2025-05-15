# deepMin

- _deepMin(aCollection)_

Answer `deepReduce` of `min`.

At a `List`, equivalent to `min`:

```
>>> [8 1 6 3 5 7 4 9 2].deepMin
1

>>> [8 1 6 3 5 7 4 9 2].min
1
```

At a 3×3 matrix:

```
>>> [8 1 6; 3 5 7; 4 9 2].deepMin
1

>>> [8 1 6; 3 5 7; 4 9 2].deepReduce(min:/2)
1

>>> [8 1 6; 3 5 7; 4 9 2].deepInjectInto(Infinity, min:/2)
1
```

* * *

See also: deepMax, deepMinMax, deepInjectInto, deepReduce, min, max, floor, minBy

Categories: Testing
