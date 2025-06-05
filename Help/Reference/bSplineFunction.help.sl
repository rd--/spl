# bSplineFunction

- _bSplineFunction(p, d)_

Answer a B-spline function of degree _d_ for a curve defined by the control points _p_.

Evaluate B-spline curve:

```
>>> let p = [1 1; 2 3; 3 -1; 4 1; 5 0];
>>> let f:/1 = p.bSplineFunction(3);
>>> f(0.5)
[3 0.5]
```

Construct a B-spline curve using a list of control points:

~~~spl svg=A
let p = [1 1; 2 3; 3 -1; 4 1; 5 0];
(0 -- 1).functionPlot(
	p.bSplineFunction(3)
)
~~~

![](sw/spl/Help/Image/bSplineFunction-A.svg)

Create a vector-valued function of dimension two:

~~~spl svg=B
let r = Sfc32(728314);
let p = r.randomReal([0 1], [10 2]);
(0 -- 1).functionPlot(
	p.bSplineFunction(3)
)
~~~

![](sw/spl/Help/Image/bSplineFunction-B.svg)

Create a vector-valued function of dimension three:

~~~spl svg=C
let r = Sfc32(831934);
let p = r.randomReal([0 1], [10 3]);
(0 -- 1).functionPlot(
	p.bSplineFunction(3)
)
~~~

![](sw/spl/Help/Image/bSplineFunction-C.svg)

* * *

See also: bezierFunction

Guides: Interpolation Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/B-Spline.html)
[2](https://reference.wolfram.com/language/ref/BSplineFunction.html),
_W_
[1](https://en.wikipedia.org/wiki/B-spline)
