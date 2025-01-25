# blend

- _blend(y1, y2, mu)_
- _blend(y1, y2, mu, aBlock:/3)_

At `SmallFloat`:

```
>>> 1.blend(9, 0.4)
4.2
```

At `SmallFloat` with `List` of _mu_:

```
>>> 1.blend(9, [0 0.2 0.4 0.5 1])
[1 2.6 4.2 5 9]
```

At `SmallFloat` with nested `List` of _mu_:

```
>>> 1.blend(9, [0 0.2 0.4; 0.5 0.75 1])
[
	1.0 2.6 4.2;
	5.0 7.0 9.0
]
```

At `List`:

```
>>> [1 2 3].blend([4 4 4], 0.4)
[2.2 2.8 3.4]
```

At `List` with `List` of _mu_:

```
>>> let y1 = [1 2 3 4];
>>> let y2 = [5 5 5 0];
>>> let mu = [0 0.2 0.4 0.5 1];
>>> y1.blend(y2, mu)
[
	1.0 2.0 3.0 4.0;
	1.8 2.6 3.4 3.2;
	2.6 3.2 3.8 2.4;
	3.0 3.5 4.0 2.0;
	5.0 5.0 5.0 0.0
]
```

* * *

See also: atBlend, linearInterpolation, listInterpolation

Guides: Interpolation Functions

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/Object.html#-blend)
