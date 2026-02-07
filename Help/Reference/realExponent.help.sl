# realExponent

- _realExponent(x, b=10)_

Answer the base _b_ logarithm of the absolute value of _x_.

The base ten exponent of a number real number:

```
>>> let x = 123.456;
>>> let y = x.realExponent(10);
>>> (y, 10 ^ y)
(2.09151, x.abs)
```

The base two exponent:

```
>>> let x = 123.456;
>>> let y = x.realExponent(2);
>>> (y, 2 ^ y)
(6.94785, x.abs)
```

At `Fraction`:

```
>>> 987654321/123456789
>>> .realExponent(10)
0.90309
```

At _π^π_:

```
>>> (1.pi ^ 1.pi).realExponent(10)
1.56184
```

At `zero`:

```
>>> 0.realExponent(10)
-Infinity
```

At different bases:

```
>>> [2 3 5 7 10].collect { :b |
>>> 	1.pi.realExponent(b)
>>> }
[1.6515 1.04198 0.711261 0.588275 0.49715]
```


At _π_ with base _e_:

```
>>> 1.pi.realExponent(1.e)
1.14473
```

* * *

See also: log10, log, mantissaExponent, integerExponent

Guides: Number Digit Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/RealExponent.html)
