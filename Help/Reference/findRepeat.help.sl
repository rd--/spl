# findRepeat

- _findRepeat(aList)_

Answer the minimal sublist that repeats to give _aList_.

Find the sublist that repeats to form a list:

```
>>> [1 2 3 4 1 2 3 4 1 2 3 4].findRepeat
[1 2 3 4]
```

The last sublist does not need to be complete:

```
>>> [1 2 3 4 1 2 3 4 1 2 3].findRepeat
[1 2 3 4]
```

Find the period of a continuous function,
using `~` to compare items:

~~~spl svg=A
[0, 1/6.pi .. 8.pi].cos
.findRepeatBy(~)
.discretePlot
~~~

![](sw/spl/Help/Image/findRepeat-A.svg)

* * *

See also: repeat, table

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/FindRepeat.html)
