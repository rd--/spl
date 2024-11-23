# divisible

- _divisible(n, m)_

Answers _true_ if _n_ is divisible by _m_, else _false_.

_divisible_ is typically used to test whether _n_ is divisible by _m_.
_n_ is divisible by _m_ if _n_ is the product of _m_ by an integer.
_divisible(n, m)_ is effectively equivalent to _(n % m) = 0_.

Test whether a number is divisible by two:

```
>>> 10.divisible(2)
true

>>> 10 % 2 = 0
true
```

The number five is not divisible by two:

```
>>> 5.divisible(2)
false

>>> 5 % 2 = 0
false
```

Divisible works over integers:

```
>>> 6.divisible(3)
true

>>> 6 % 3 = 0
true
```

At `Fraction`:

```
>>> 3/2.divisible(1/2)
true

>>> 3/2 % 1/2 = 0
true
```

At `SmallFloat`:

```
>>> 2.pi.divisible(0.5.pi)
true

>>> 2.pi % 0.5.pi = 0
true

>>> 6.sqrt.divisible(2.sqrt)
false

>>> 6.sqrt % 2.sqrt = 0
false
```

At `LargeInteger`:

```
>>> (10n ^ 3000 + 1).divisible(16001n)
true

>>> (10n ^ 3000 + 1) % 16001n = 0n
true
```

Divisible threads elementwise over lists:

```
>>> 1:6.divisible(2)
[false true false true false true]

>>> 1:6 % 2 =.each [0]
[false true false true false true]
```

* * *

See also: %, divisors, even, gcd, mod, quotient, round

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Divisible.html)

Categories: Math
