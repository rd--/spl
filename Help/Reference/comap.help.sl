# comap

- _comap([f₁ f₂ …], x)_

Apply each unary block _f_ to the object _x_.

```
>>> [sin:/1 cos:/1 tan:/1].comap(1/3.pi)
[3.sqrt / 2, 1/2, 3.sqrt]

>>> [square:/1 cube:/1].comap(2)
[4 8]

>>> [
>>> 	{ :x | x * x },
>>> 	{ :x | x * x * x }
>>> ].comap(2)
[4 8]
```

The unary form answers a unary block,
tabulate square roots of values without using auxiliary variables:

```
>>> [identity:/1 sqrt:/1].comap
>>> .map(0:4)
[
	0 0;
	1 1;
	2 1.41421;
	3 1.73205;
	4 2
]
```

* * *

See also: collect, map

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Comap.html)
