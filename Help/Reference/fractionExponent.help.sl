# fractionExponent

- _fractionExponent(x)_

Convert the floating-point number _x_ to fractional and integral components.

```
>>> 4.fractionExponent
[0.5 3]

>>> 0.5 * (2 ^ 3)
4

>>> 16.4.fractionExponent
[0.5125 5]

>>> loadExponent(0.5125, 5)
16.4

>>> 0.5125 * (2 ^ 5)
16.4
```

Threads over lists,
zero, negative zero, infinity:

```
>>> [0 -0 Infinity].fractionExponent
[0 0; -0 0; Infinity 1025]

>>> [0 0; -0 0; Infinity 1025]
>>> .loadExponent
[0 -0 Infinity]
```

Large exponent:

```
>>> (2 ^ 1023).fractionExponent
[0.5 1024]

>>> 0.5 * (2 ^ 1024)
Infinity

>>> let x = 2 ^ 1023;
>>> let y = 0.5 * (2 ^ 1) * (2 ^ 1023);
>>> x == y
true

>>> let x = 2 ^ 1023;
>>> let y = ldexp(0.5, 1024);
>>> x == y
true
```

* * *

See also: loadExponent, SmallFloat

References:
_OpenGroup_
[1](https://pubs.opengroup.org/onlinepubs/9799919799/functions/frexp.html)
[2](https://pubs.opengroup.org/onlinepubs/9799919799/functions/ldexp.html)
