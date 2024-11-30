# goldenAngle

- _goldenAngle(aNumber)_

Answer _aNumber_ × the golden angle, _pi × (3 - 5.sqrt)_.

```
>>> 1.goldenAngle
137.5.degree

>>> (1 / pi).goldenAngle
(3 - 5.sqrt)
```

Expressions for `goldenAngle` in terms of `goldenRatio`:

```
>>> 1.goldenAngle
2.pi / (1.goldenRatio ^ 2)

>>> 1.goldenAngle
2.pi - (2.pi / 1.goldenRatio)

>>> 1.goldenAngle
2.pi / (1 + 1.goldenRatio)
```

Scatter plot of a phyllotaxis pattern:

~~~
1:1000.collect { :i |
	i.sqrt * i.goldenAngle.angleVector
}.scatterPlot
~~~

* * *

See also: e, degree, fibonacci, goldenRatio, pi

Guides: Mathematical Constants

References:
_Mathematica_
[1](https://mathworld.wolfram.com/GoldenAngle.html)
[2](https://reference.wolfram.com/language/ref/GoldenAngle.html)
