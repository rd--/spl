# gamma

- _gamma(z)_

Answer the Euler gamma function.

Positive integer values:

```
>>> 1:10.collect(gamma:/1)
[1 1 2 6 24 120 720 5040 40320 362880]
```

Half-integer values:

```
>>> (1.5 .. 5.5).collect(gamma:/1)
[pi.sqrt / 2, (3 * pi.sqrt) / 4, (15 * pi.sqrt) / 8, (105 * pi.sqrt) / 16, (945 * pi.sqrt) / 32]
```

Evaluate numerically:

```
>>> (22 / 10).gamma
1.101802

>>> -1.4.gamma
2.659272

>>> 2.5.gamma
1.32934
```

Plot the Euler gamma function:

~~~
(-4, -3.9 .. 4).collect { :each | each.gamma.clip(-10, 10) }.plot
~~~

* * *

See also: factorial, logGamma

References:
_Dlmf_
[1](https://dlmf.nist.gov/5.2),
_Maple_
[1](https://www.maplesoft.com/support/help/Maple/view.aspx?path=GAMMA),
_Mathematica_
[1](http://mathworld.wolfram.com/GammaFunction.html)
[2](https://reference.wolfram.com/language/ref/Gamma.html)
