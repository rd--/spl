# artinsConstant

- _artinsConstant(n)_

Answer _n_ times Artin’s constant.

```
>>> 1.artinsConstant
0.37396

>>> 1:1000.product { :k |
>>> 	let p = k.prime;
>>> 	1 - (1 / (p * (p - 1)))
>>> }
1.artinsConstant
```

Artin’s constant is also stored as a named constant with higher precision,
OEIS [A005596](https://oeis.org/A005596):

```
>>> let n = 'ArtinsConstant';
>>> let k = n.namedConstant;
>>> (k, k.scale)
(0.37396, 105)
```

Scatter plot of the digits of Artin’s constant:

~~~spl svg=A
'ArtinsConstant'
.namedConstant
.integerDigits
.scatterPlot
~~~

![](sw/spl/Help/Image/artinsConstant-A.svg)

* * *

See also: catalansConstant, namedConstant, zeta

Guides: Mathematical Constants

References:
_Mathematica_
[1](https://mathworld.wolfram.com/ArtinsConstant.html),
_OEIS_
[1](http://oeis.org/A005596),
_W_
[1](https://en.wikipedia.org/wiki/Artin%27s_conjecture_on_primitive_roots)
