# logSumExp

- _logSumExp([x₁ x₂ …])_

Answer the `log` of the `sum` of `exp` of _x_,
a smooth maximum function,
also called multivariable softplus.

At `List`:

```
>>> [1 2 3 4].logSumExp
4.44019

>>> [1 2 3 4].exp.sum.log
4.44019

>>> [1 .. 10].logSumExp
10.4586

>>> [1 .. 10].exp.sum.log
10.4586
```

`logSumExp` can be computed in a numerically stable way even when larger numbers are involved:

```
>>> [1 2 3995 4000].logSumExp
4000.0067

>>> [1 2 3995 4000].exp.sum.log
Infinity
```

`logSumExp` of `log` is equal to `log` of `sum`,
in the same way that `sum` of `log` is equal to `log` of `product`:

```
>>> let x = Sfc32(367814).randomReal([0 1], [10]);
>>> (x.product.log, x.log.sum, x.sum.log, x.log.logSumExp)
(-15.93669, -15.93669, 0.86785, 0.86785)
```

Surface plot:

~~~spl svg=A
(-2 -- 4).surfacePlot { :x :y |
	[x y].logSumExp * 3
}
~~~

![](Help/Image/logSumExp-A.svg)

Matrix plot:

~~~spl svg=B
let i = (-2 -- 4).discretize(12);
{ :a :b |
	[a b].logSumExp
}.table(i, i).matrixPlot
~~~

![](Help/Image/logSumExp-B.svg)

Compare to surface plot of `max`:

~~~spl svg=C
(-2 -- 4).surfacePlot { :x :y |
	[x y].max * 3
}
~~~

![](Help/Image/logSumExp-C.svg)

* * *

See also: exp, log, max, softPlus, sum

References:
_W_
[1](https://en.wikipedia.org/wiki/LogSumExp)
