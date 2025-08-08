# lambertW

- _lambertW(x)_

Answer the Lambert W function, also called the ω function or product logarithm.

```
>>> 2.5.lambertW
0.958586

>>> (1 / 3).lambertW
0.257628

>>> (7 / 3).lambertW
0.925125

>>> 0.824361.lambertW
0.5
```

At `e` and `zero`:

```
>>> 1.e.lambertW
1

>>> 0.lambertW
0
```

Plot over a subset of the reals:

~~~spl svg=A
(-1 / 1.e -- 10).functionPlot(lambertW:/1)
~~~

![](sw/spl/Help/Image/lambertW-A.svg)

Polar plot:

~~~spl svg=B
(0 -- 6.pi).polarPlot(lambertW:/1)
~~~

![](sw/spl/Help/Image/lambertW-B.svg)

* * *

See also: log, exp, omegaConstant

Guides: Special Functions

References:
_Mathematica_
[1](http://mathworld.wolfram.com/LambertW-Function.html)
[2](https://reference.wolfram.com/language/ref/ProductLog.html),
_W_
[1](https://en.wikipedia.org/wiki/Lambert_W_function)
