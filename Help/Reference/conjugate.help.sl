# conjugate

- _conjugate(z)_

The complex conjugate of a complex number _a+bi_ is defined to be _a-bi_.
The conjugate of _z_ is ordinarily with a ¯ as _z̄_.

At `SmallFloat`:

```
>>> 0.7.conjugate
0.7
```

At `Complex`:

```
>>> 0.7J0.conjugate
0.7

>>> 1J1.conjugate
1J-1
```

At `Quaternion`:

```
>>> Quaternion([1 2 3 4]).conjugate
Quaternion([1 -2 -3 -4])
```

Threads elementwise over lists and matrices:

```
>>> [1.2 2.5J1.5 0J-1.8].conjugate
[1.2 2.5J-1.5 0J1.8]

>>> [0 2 -1.1 1E300 -200].conjugate
[0 2 -1.1 1E300 -200]

>>> [2J3 -4J-3 -12 1.5J1.5].conjugate
[2J-3 -4J3 -12 1.5J-1.5]
```

Value at zero:

```
>>> 0.conjugate
0
```

Value at real number is `identity`:

```
>>> let n = system.nextRandomFloat;
>>> n.conjugate
n
```

Conjugate is an odd function:

```
>>> let n = 1.j(system.nextRandomFloat);
>>> -n.conjugate
n.conjugate.negate
```

Conjugate is involutive:

```
>>> let n = 1.j(system.nextRandomFloat);
>>> n.conjugate.conjugate = n
true
```

A complex number multiplied by its conjugate is the square of its modulus:

```
>>> let z = 2J3;
>>> z * z.conjugate
z.abs.square
```

Plot over a subset of the complex numbers:

~~~spl png=A
[-2J-2 2J2].complexPlot(conjugate:/1)
~~~

![](sw/spl/Help/Image/conjugate-A.png)

Plot the absolute value of  function:

~~~spl svg=B
(-3 -- 3).functionPlot { :x |
	x.j(1).abs.conjugate
}
~~~

![](sw/spl/Help/Image/conjugate-B.svg)

* * *

See also: +, Complex

Guides: Complex Number Functions

References:
_Apl_
[1](https://aplwiki.com/wiki/Conjugate),
_Haskell_
[1](https://hackage.haskell.org/package/base/docs/Data-Complex.html#v:conjugate),
_J_
[1](https://code.jsoftware.com/wiki/Vocabulary/plus),
_Mathematica_
[1](https://mathworld.wolfram.com/ComplexConjugate.html)
[2](https://reference.wolfram.com/language/ref/Conjugate.html),
_W_
[1](https://en.wikipedia.org/wiki/Complex_conjugate)

Categories: Math
