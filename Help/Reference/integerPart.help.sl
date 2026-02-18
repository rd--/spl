# integerPart

- _integerPart(x)_

Answers the integer part of _x_.
`integerPart` is equivalent to the unary form of `truncate`.

Find the integer part of a real number:

```
>>> 2.4.integerPart
2

>>> 456.457.integerPart
456

>>> (1.pi + 1.e).integerPart
5
```

Find the integer part of a negative real number:

```
>>> -2.4.integerPart
-2
```

At `Fraction`:

```
>>> -5/4.integerPart
-1

>>> (-5 / 4).integerPart
-1
```

At `Complex`:

```
>>> (78 / 47).j(-4.2).integerPart
1J-4
```

At `Decimal`:

```
>>> 3.14159D.integerPart
3.00000D
```

Threads elementwise over lists:

```
>>> [2.4 2.5 3.0].integerPart
[2 2 3]
```

Plot over a subset of the reals:

~~~spl svg=A
(-2 -- 2).functionPlot(integerPart:/1)
~~~

![](sw/spl/Help/Image/integerPart-A.svg)

Implement the Frisch continuous-but-nowhere-differentiable function:

~~~spl svg=B
let f = { :x :n |
	1:n.sum { :k |
		let a = (k * x).integerPart;
		let b = ((k + 1) * x).integerPart;
		(a = b).boole / (2 ^ k)
	}
};
1:50.collect { :j |
	0:j.collect { :i |
		i / j
	}
}.catenate.nub.sort.collect { :x |
	[x, f(x, 100)]
}.linePlot
~~~

![](sw/spl/Help/Image/integerPart-B.svg)

Plot quantized quadratic function:

~~~spl svg=C
(-3 -- 3).functionPlot { :x |
	(x + x.square).integerPart
}
~~~

![](sw/spl/Help/Image/integerPart-C.svg)

Plot integer part of square root of _n_-th prime,
OEIS [A000006](https://oeis.org/A000006):

~~~spl svg=D
1:65.prime.sqrt.integerPart.stepPlot
~~~

![](sw/spl/Help/Image/integerPart-D.svg)

* * *

See also: ceiling, floor, fractionalPart, truncate

Guides: Rounding Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/IntegerPart.html)
[2](https://reference.wolfram.com/language/ref/IntegerPart.html),
_Smalltalk_
5.6.2.21,
_W_
[1](https://en.wikipedia.org/wiki/Floor_and_ceiling_functions)
