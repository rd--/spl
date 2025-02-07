# linearInterpolation

- _linearInterpolation(y1, y2, mu)_

Calculate an interpolated point that lies between _y1_ and _y2_ at _mu_,
where _mu_ of `zero` answers _y1_,
and _mu_ of `one` answers _y2_.

At `SmallFloat`:

```
>>> (0, 0.2 .. 1).collect { :x |
>>> 	1.linearInterpolation(3, x)
>>> }
[1 1.4 1.8 2.2 2.6 3]
```

At `List`:

```
>>> (0, 0.2 .. 1).collect { :x |
>>> 	[1 3].linearInterpolation([3 -1], x)
>>> }
[1 3; 1.4 2.2; 1.8 1.4; 2.2 0.6; 2.6 -0.2; 3 -1]
```

In the `List` case _mu_ may be a list:

```
>>> let [y1, y2, mu] = [1 3; 3 7; 0.2 0.75];
>>> y1.linearInterpolation(y2, mu)
[1.4 6]
```

Plot the line that interpolates from _1_ to _3_:

~~~spl svg=A
(0 -- 1).functionPlot { :x |
	1.linearInterpolation(3, x)
}
~~~

![](sw/spl/Help/Image/linearInterpolation-A.svg)

Plot the line that interpolates from _(1,3)_ to _(3,-1)_:

~~~spl svg=B
(0 -- 1).functionPlot { :x |
	[1 3].linearInterpolation([3 -1], x)
}
~~~

![](sw/spl/Help/Image/linearInterpolation-B.svg)

Linear impulse response:

~~~spl svg=C
(1 -- 5).functionPlot(
	[0 0 1 0 0]
	.listInterpolation(
		linearInterpolation:/3
	)
)
~~~

![](sw/spl/Help/Image/linearInterpolation-C.svg)

* * *

See also: catmullRomInterpolation, cosineInterpolation, cubicInterpolation, hermiteInterpolation, linearInterpolation, listInterpolation

Guides: Interpolation Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Linear_interpolation)
