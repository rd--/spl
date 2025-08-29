# cayleyTransform

- _cayleyTransform(z)_

Answer the Cayley transorm of _z_, equal to _(z-i)/(z+i)_.

```
>>> 3.cayleyTransform
0.8J-0.6

>>> 5J7.cayleyTransform
0.820224J-0.11236
```

Plot transform of Gaussian integers:

~~~spl svg=A
{ :a :b |
	(a + b.i).cayleyTransform
}.table(-7:7, 0:7).complexListPlot
~~~

![](sw/spl/Help/Image/cayleyTransform-A.svg)

Plot over half unit square:

~~~spl png=B
[-1J0 1J1].complexPlot(cayleyTransform:/1)
~~~

![](sw/spl/Help/Image/cayleyTransform-B.png)

Plot transform of Gaussian integers of the form _(m-ni)/(p+qi)_:

~~~spl svg=C
[1 .. 5].tuples(4).collect { :each |
	let [m, n, p, q] = each;
	let z = (m + n.i) / (p + q.i);
	(z.imaginary > 0).if {
		z.cayleyTransform
	} {
		nil
	}
}.deleteMissing.complexListPlot
~~~

![](sw/spl/Help/Image/cayleyTransform-C.svg)

* * *

See also: Complex

Guides: Complex Number Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/CayleyTransform.html),
_W_
[1](https://en.wikipedia.org/wiki/Cayley_transform)
