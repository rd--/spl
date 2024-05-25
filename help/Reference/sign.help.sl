# sign

- _sign(aNumber)_
- _sign(aNumber, anotherNumber)_

Sign function.
-1 when _aNumber < 0_.
1 when _aNumber > 0_.
-0 when _aNumber = -0_.
0 when _aNumber = 0_.
The sign of a `Complex` number _z_ is defined as _z / abs(z)_.

Real numbers:

```
>>> -2.5.sign
-1

>>> 3.14.sign
1
```

At negative `zero` sign is negative zero:

```
>>> -0.sign.isNegativeZero
true
```

See also `signBit`:

```
>>> -0.signBit
true
```

The unary operator `*` is `sign`:

```
>>> [-2.5 3.14].*
[-1 1]
```

Complex numbers, division by absolute value:

```
>>> 1.4j2.3.sign
0.5199j0.8542

>>> 1j1.sign
(1j1 / 1j1.abs)
```

Element-wise sign function:

```
>>> [-3 -0 0 5 inf].sign
[-1 -0 0 1 1]
```

The binary form answers a `Number` with the same sign as _anotherNumber_ and the same magnitude as _aNumber_.

```
>>> 3.sign(-2)
-3
```

Plot the `real` and `imaginary` parts of the `sign` function:

~~~
(-3, -2.95 .. 3).collect { :x | x.j(1).sign.real }.plot

(-3, -2.95 .. 3).collect { :x | x.j(1).sign.imaginary }.plot
~~~

* * *

See also: *, abs, copySignTo, negated, signBit

References:
_Apl_
[1](https://aplwiki.com/wiki/Signum),
_Haskell_
[1](https://hackage.haskell.org/package/base/docs/Prelude.html#v:signum),
_J_
[1](https://code.jsoftware.com/wiki/Vocabulary/star),
_Mathematica_
[1](https://mathworld.wolfram.com/Sign.html)
[2](https://reference.wolfram.com/language/ref/Sign.html)
[3](https://reference.wolfram.com/language/ref/RealSign.html),
_Mathworks_
[1](https://mathworks.com/help/symbolic/sign.html),
_Smalltalk_
5.6.2.33,
_W_
[1](https://en.wikipedia.org/wiki/Sign_function)

Categories: Math, Operator
