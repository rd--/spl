# clip

- _clip(x)_
- _clip(x, [⌊ ⌈])_
- _clip(x, [⌊ ⌈], [v⌊ v⌈])_

Answers _x_ for _⌊ ≤ x ≤ ⌈_, _v⌊_ for _x < ⌊_ and _v⌈_ for _x > ⌈_.
Also called clamp.

Clip number to (-1, 1):

```
>>> 8.5.clip
1

>>> Infinity.clip
1

>>> -Infinity.clip
-1
```

Clip number to indicated range:

```
>>> -5/2.clip([-2 2])
-2
```

Clip number that is already in range:

```
>>> 0.clip([-1 1])
0
```

Specify replacement values for clipping:

```
>>> -1.pi.clip([-1 1], [0 0])
0
```

Collect using unary form:

```
>>> (-2 .. 2).collect(clip:/1)
[-1 -1 0 1 1]
```

Clip threads over lists and arrays:

```
>>> (-3 .. 3).clip([-2 2])
[-2 -2 -1 0 1 2 2]

>>> 1:7.clip([3 6])
[3 3 3 4 5 6 6]
```

To clip values only to an upper bound specify the lower bound as negative infinity:

```
>>> (-6 .. 6).clip([-Infinity 0])
[-6 -5 -4 -3 -2 -1 0 0 0 0 0 0 0]
```

Boundaries are includes:

```
>>> [-1 1].clip([-1 1])
[-1 1]
```

Plot the unit clip function over a subset of the reals:

~~~spl svg=A
(-3 -- 3).functionPlot(clip:/1)
~~~

![](sw/spl/Help/Image/clip-A.svg)

Plot the composition of clip with a periodic function:

~~~spl svg=B
(0 -- 2.pi).functionPlot(
	sin:/1.clip([-0.5 1])
)
~~~

![](sw/spl/Help/Image/clip-B.svg)

* * *

See also: Clip, max, min, normalizeRange, noralizeSignal, piecewise, rescale, round, tanh, threshold, unitize

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Clip.html),
_Mathworks_
[1](https://mathworks.com/help/matlab/ref/clip.html),
_Max_
[1](https://docs.cycling74.com/reference/clip/),
_Python_
[1](https://numpy.org/doc/stable/reference/generated/numpy.clip.html),
_W_
[1](https://en.wikipedia.org/wiki/Clamp_(function))

Categories: Arithmetic
