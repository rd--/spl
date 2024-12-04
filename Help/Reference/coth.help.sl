# coth

- _coth(aNumber)_

Answer the hyperbolic cotangent of _aNumber_.

Evaluate numerically:

```
>>> 1.2.coth
1.19954

>>> 1.2.cosh / 1.2.sinh
1.19954
```

Plot over a subset of the reals:

~~~spl svg=A
(-4 -- 4).functionPlot { :x |
	x.coth.clip(-4, 4)
}
~~~

![](sw/spl/Help/Image/coth-A.svg)

* * *

See also: cosh, sinh

Categories: Trigonometry, Math
