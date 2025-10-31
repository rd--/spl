# inverseSmoothStep

- _inverseSmoothStep(x)_

Inverse of `smoothStep`.

The function passes through `zero`, one half and `one`:

```
>>> [0 0.5 1].collect(inverseSmoothStep:/1)
[0 0.5 1]
```

Inputs smaller than 1/2 overestimate the input:

```
>>> 0.1.inverseSmoothStep
0.1958
```

Values larger than 1/2 do the opposite:

```
>>> 0.7.inverseSmoothStep
0.6367
```

Inverse smooth step function:

~~~spl svg=A
(0 -- 1).functionPlot(
	inverseSmoothStep:/1
)
~~~

![](sw/spl/Help/Image/inverseSmoothStep-A.svg)

* * *

See also: smoothStep

Guides: Interpolation Functions, Sigmoid Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Smoothstep)
