# clip

- _clip(x, min, max, vMin, vMax)_
- _clip(alpha, beta, gamma)_ ⟹ _clip(alpha, beta, gamma, beta, gamma)_
- _clip(alpha)_ ⟹ _clip(alpha, -1, 1, -1, 1)_

Answers _x_ for _min ≤ x ≤ max_, _vMin_ for _x < min_ and _vMax_ for _x > max_.

Clip number to (-1, 1):

```
>>> 8.5.clip
1
```

Clip number to indicated range:

```
>>> -5/2.clip(-2, 2)
-2
```

Clip number that is already in range:

```
>>> 0.clip(-1, 1)
0
```

Specify replacement values for clipping:

```
>>> pi.-.clip(-1, 1, 0, 0)
0
```

Clip threads over lists and arrays:

```
>>> -3:3.clip(-2, 2)
[-2 -2 -1 0 1 2 2]

>>> 1:7.clip(3, 6)
[3 3 3 4 5 6 6]
```

To clip values only to an upper bound specify the lower bound as negative infinity:

```
>>> -6:6.clip(inf.-, 0)
[-6 -5 -4 -3 -2 -1 0 0 0 0 0 0 0]
```

Plot the unit clip function over a subset of the reals:

~~~
(-3 -- 3).functionPlot(clip:/1)
~~~

Plot the composition of clip with a periodic function:

~~~
(0 -- 2.pi).functionPlot { :x |
	x.sin.clip(-0.5, 1)
}
~~~

* * *

See also: max, min, piecewise, rescale, round, tanh, threshold, unitize

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Clip.html),
_Mathworks_
[1](https://mathworks.com/help/matlab/ref/clip.html)
