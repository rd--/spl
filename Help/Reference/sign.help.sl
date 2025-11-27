# sign

- _sign(x)_
- _sign(a, b)_

Sign function.
-1 when _x<0_.
1 when _x>0_.
-0 when _x=-0_.
0 when _x=0_.
The sign of a `Complex` number _z_ is defined as _z/|z|_,
telling the normalized direction.

Real numbers:

```
>>> let z = -2.5.sign;
>>> (z, z.isSmallFloat)
(-1, true)

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

Threads over lists:

```
>>> [-2.5 3.14].sign
[-1 1]

>>> [-3 0 3].sign
[-1 0 1]
```

At `Fraction`:

```
>>> let z = -3/4.sign;
>>> (z, z.isFraction)
(-1/1, true)
```

At `LargeInteger`:

```
>>> let z = -23L.sign;
>>> (z, z.isLargeInteger)
(-1L, true)
```

Complex numbers, division by absolute value:

```
>>> 1.4J2.3.sign
0.5199J0.8542

>>> 1J1.sign
(1J1 / 1J1.abs)

>>> 0J0.sign.isNaN
true
```

At `Quaternion` likewise:

```
>>> let a = Quaternion([1 2 3 4]);
>>> let b = a.sign;
>>> (b, b.abs)
(a / a.abs, 1)
```

Element-wise sign function:

```
>>> [-3 -0 0 5 Infinity].sign
[-1 -0 0 1 1]
```

The binary form answers a `Number` with the same sign as the operand _b_ and the same magnitude as the number _a_:

```
>>> 3.sign(-2)
-3

>>> -3.sign(2)
3

>>> 3/4.sign(-0.75)
-3/4
```

At `Symbol`:

```
>> `m`.*
(if (> m 0) 1 (if (< m 0) -1 0))
```

Plot the `real` part of the `sign` function:

~~~spl svg=A
(-3 -- 3).functionPlot { :x |
	x.j(1).sign.real
}
~~~

![](sw/spl/Help/Image/sign-A.svg)

Plot the `imaginary` part of the `sign` function:

~~~spl svg=B
(-3 -- 3).functionPlot { :x |
	x.j(1).sign.imaginary
}
~~~

![](sw/spl/Help/Image/sign-B.svg)

* * *

See also: *, abs, copySignTo, negate, signBit

Guides: Complex Number Functions, Mathematical Functions

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
