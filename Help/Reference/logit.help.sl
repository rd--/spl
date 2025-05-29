# logit

- _logit(x)_

Answer the _logit_ function,
the inverse of the standard logistic function `logisticSigmoid`.

Compute the logit of an exact number:

```
>>> 8/10.logit
4.log
```

Threads over lists:

```
>>> [0.345 0.5 1].logit
[-0.6411 0 Infinity]
```

Plot over a subset of the reals:

~~~spl svg=A
(0 -- 1).functionPlot(
	logit:/1.clip([-6 6])
)
~~~

![](sw/spl/Help/Image/logit-A.svg)

* * *

See also: log, logisticSigmoid

References:
_Mathematica_
[1](https://mathworld.wolfram.com/LogitTransformation.html),
_W_
[1](https://en.wikipedia.org/wiki/Logit)
