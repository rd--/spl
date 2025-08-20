# hadjicostassFormula

- _hadjicostassFormula(s)_

Hadjicostas’s formula relating a double integral to values of the γ and ζ functions.

As _s_ tends to negative one:

```
>>> -0.99999.hadjicostassFormula
1.eulerGamma
```

Plot over a subset of the reals:

~~~spl svg=A
(-0.99990 -- 1).functionPlot(
	hadjicostassFormula:/1
)
~~~

![](sw/spl/Help/Image/hadjicostassFormula-A.svg)

* * *

See also: gamma, zeta

References:
_Mathematica_
[1](https://mathworld.wolfram.com/HadjicostassFormula.html),
_W_
[1](https://en.wikipedia.org/wiki/Hadjicostas%27s_formula)
