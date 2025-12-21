# unitDegree

- _unitDegree(x)_

At `Number`,
answer _x_ divided by three-hundred and sixty.
Where `degree` scales _x_ to lie in _(0,2π)_,
`unitDegree` scales _x_ to lie in _(0,1)_.

At `SmallFloat`:

```
>>> 60.unitDegree
1/6

>>> 360.unitDegree
1
```

At `Interval`:

```
>>> (0 -- 90).unitDegree
(0 -- 0.25)
```

* * *

See also: degree

Guides: Mathematical Constants

Categories: Math, Constant
