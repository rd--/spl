# conjugated

- _conjugated(z)_

The complex conjugate of a complex number _a+bi_ is defined to be _a-bi_.

```
>>> 1J1.conjugated
1J-1

>>> 0.7J0.conjugated
0.7J0
```

Threads elementwise over lists and matrices:

```
>>> [1.2 2.5J1.5 0J-1.8].conjugated
[1.2 2.5J-1.5 0J1.8]
```

Value at zero:

```
>>> 0.conjugated
0
```

Value at real number is `identity`:

```
>>> let n = system.nextRandomFloat;
>>> n.conjugated
n
```

Conjugate is an odd function:

```
>>> let n = 1.j(system.nextRandomFloat);
>>> n.negated.conjugated
n.conjugated.negated
```

Conjugate is involutive:

```
>>> let n = 1.j(system.nextRandomFloat);
>>> n.conjugated.conjugated = n
true
```

* * *

See also: +, Complex

Guides: Complex Numbers

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
