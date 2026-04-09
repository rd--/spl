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

Sign of nonnegative integers,
OEIS [A057427](https://oeis.org/A057427):

```
>>> 0:17.sign
[0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1]
```

Sign of negative one and the nonnegative integers,
OEIS [A261012](https://oeis.org/A261012):

```
>>> -1:17.sign
[-1 0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1]
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

Numbers _n_ such that _n_-th Pisano number is _6n_,
OEIS [A095687](https://oeis.org/A095687):

```
>>> let n = 0:8;
>>> n.sign * 2 * (5 ^ n)
[0 10 50 250 1250 6250 31250 156250 781250]
```

Plot the `real` part of the `sign` function:

~~~spl svg=A
(-3 -- 3).functionPlot { :x |
	x.j(1).sign.real
}
~~~

![](Help/Image/sign-A.svg)

Plot the `imaginary` part of the `sign` function:

~~~spl svg=B
(-3 -- 3).functionPlot { :x |
	x.j(1).sign.imaginary
}
~~~

![](Help/Image/sign-B.svg)

Characteristic function of numbers that are not multiples of four,
OEIS [A166486](https://oeis.org/A166486):

~~~spl svg=C oeis=A166486
(0:44 % 4).sign.discretePlot
~~~

![](Help/Image/sign-C.svg)

A quaternion-generated sequence by Creighton Dement,
OEIS [A108618](https://oeis.org/A108618):

~~~spl svg=D oeis=A108618
let f = { :n |
	n.sign * (n % 2)
};
let a = Map { :n |
	(n = 0).if {
		0
	} {
		let m = n - 1;
		let p = a[m] - (3 * b[m]);
		let q = a[m] + b[m];
		(p / 2) + (3 * f(q / 2)) + f(p / 2) + 1
	}
};
let b = Map { :n |
	(n = 0).if {
		0
	} {
		let m = n - 1;
		(a[m] + b[m]) / 2 + 1
	}
};
a[1:115].discretePlot
~~~

![](Help/Image/sign-D.svg)

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
