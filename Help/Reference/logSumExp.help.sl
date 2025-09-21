# logSumExp

- _logSumExp([x₁ x₂ …])_

Answer the `log` of the `sum` of `exp` of _x_,
a smooth maximum function,
also called multivariable softplus.

At `List`:

```
>>> [1 .. 10].logSumExp
10.4586
```

Surface plot:

~~~spl svg=A
(-2 -- 4).surfacePlot { :x :y |
	[x y].logSumExp * 3
}
~~~

![](sw/spl/Help/Image/logSumExp-A.svg)

Matrix plot:

~~~spl svg=B
let i = (-2 -- 4).discretize(12);
{ :a :b |
	[a b].logSumExp
}.table(i, i).matrixPlot
~~~

![](sw/spl/Help/Image/logSumExp-B.svg)

Compare to surface plot of `max`:

~~~spl svg=C
(-2 -- 4).surfacePlot { :x :y |
	[x y].max * 3
}
~~~

![](sw/spl/Help/Image/logSumExp-C.svg)

* * *

See also: exp, log, max, softPlus, sum

References:
_W_
[1](https://en.wikipedia.org/wiki/LogSumExp)
