# logisticSigmoid

- _logisticSigmoid(z)_

Answer the logistic sigmoid function.

Evaluate numerically:

```
>>> 2.logisticSigmoid
0.8808
```

Plot over a subset of the reals:

~~~spl svg=A
(-4 -- 4).functionPlot(
	logisticSigmoid:/1
)
~~~

![](sw/spl/Help/Image/logisticSigmoid-A.svg)

Compute the elementwise values of an array using automatic threading:

```
>>> [0.5 0.6 0.8 2/7].logisticSigmoid
[0.6225 0.6457 0.6900 0.5709]
```

Complex number input:

```
>>> 1J9.logisticSigmoid
1.4298J0.3261
```

At specific values:

```
>>> [-Infinity, 0, Infinity, 0J2 * 3.pi]
>>> .logisticSigmoid
[0 1/2 1 0.5J0]
```

Polar plot with phi:

~~~spl svg=B
(-2.pi -- 8.pi).polarPlot(logisticSigmoid:/1)
~~~

![](sw/spl/Help/Image/logisticSigmoid-B.svg)

* * *

See also: exp, LogisticDistribution, unitStep

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/LogisticSigmoid.html)
