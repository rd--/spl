# clip

- _clip(x, min, max, vMin, vMax)_
- _clip(alpha, beta, gamma)_ => _clip(alpha, beta, gamma, beta, gamma)_
- _clip(alpha)_ => _clip(alpha, -1, 1, -1, 1)_

Answers _x_ for _min ≤ x ≤ max_, _vMin_ for _x < min_ and _vMax_ for _x > max_.

Values of clip at fixed points:

```
>>> 8.5.clip
1

>>> -5/2.clip(-2, 2)
-2

>>> 0.clip(-1, 1)
0

>>> pi.clip(-9, 7, 11, 28)
pi

>>> -3:3.clip(-2, 2)
[-2 -2 -1 0 1 2 2]
```

Plot the unit clip function over a subset of the reals:

```
>>> (-3, -2.9 .. 3).clip.plot
```

Plot the composition of clip with a periodic function:

```
>>> ((-1, -0.99 .. 1) * 2 * pi).sin.clip(-0.5, 1).plot
```

* * *

See also: clamp

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Clip.html)
