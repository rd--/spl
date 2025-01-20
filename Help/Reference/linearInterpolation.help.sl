# linearInterpolation

- _linearInterpolation(p, q, x)_

Calculate an intepolated point that lies between _p_ and _q at _x_,
where _x_ of `zero` answers _p_,
and _x_ of `one` answers _q_.

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

Plot the line that intepolates from _1_ to _3_:

~~~spl svg=A
(0 -- 1).functionPlot { :x |
	1.linearInterpolation(3, x)
}
~~~

![](sw/spl/Help/Image/linearInterpolation-A.svg)

Plot the line that intepolates from _(1,3)_ to _(3,-1)_:

~~~spl svg=B
(0 -- 1).functionPlot { :x |
	[1 3].linearInterpolation([3 -1], x)
}
~~~

![](sw/spl/Help/Image/linearInterpolation-B.svg)

* * *

References:
_W_
[1](https://en.wikipedia.org/wiki/Linear_interpolation)
