# %

- _self % aNumber_

Answer the floating-point remainder of dividing _self_ by _aNumber_.

The answer is _self - n * aNumber_, where _n_ is the quotient of _self / aNumber_, rounded toward zero to an integer.

	5 % 3 = 2
	17 % 5 = 2

Rational numbers:

	5/2 % 2 = 1/2

Real numbers:

	28.sqrt % 3 = (-3 + (2 * 7.sqrt))
	pi % 2 = (-2 + pi)
	pi % 2 ~ 1.1416

Mod threads over lists:

	[1 2 3 4 5] % 3 = [1 2 0 1 2]

Plot the sequence with fixed modulus:

```
(1:50 % 8).plot
```

Plot the sequence, varying the modulus:

```
(100 % 1:50).plot
```

The name of this operator is _modulo_.

* * *

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Mod.html)
[2](https://mathworld.wolfram.com/Congruence.html)
[3](https://reference.wolfram.com/language/ref/Mod.html)

Categories: Math, Operator
