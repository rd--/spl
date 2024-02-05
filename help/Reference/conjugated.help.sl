# conjugated

_conjugated(aComplexNumber)_

The complex conjugate of a complex number a+bi is defined to be a-bi.

```
>>> 1j1.conjugated
1j-1

>>> 0.7j0.conjugated
0.7j0
```

Conjugate threads elementwise over lists and matrices:

```
>>> [1.2 2.5j1.5 0j-1.8].conjugated
[1.2 2.5j-1.5 0j1.8]
```

Value at zero:

```
>>> 0.conjugated
0
```

Value at real number is identity:

```
>>> let n = system.nextRandomFloat;
>>> n.conjugated = n
true
```

Conjugate is an odd function:

```
>>> let n = 1.j(system.nextRandomFloat);
>>> n.negated.conjugated = n.conjugated.negated
true
```

Conjugate is involutive:

```
>>> let n = 1.j(system.nextRandomFloat);
>>> n.conjugated.conjugated = n
true
```

* * *

See also: Complex

References:
_Haskell_
[1](https://hackage.haskell.org/package/base/docs/Data-Complex.html#v:conjugate),
_Mathematica_
[1](https://mathworld.wolfram.com/ComplexConjugate.html)
[2](https://reference.wolfram.com/language/ref/Conjugate.html)

Categories: Math
