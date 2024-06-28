# absArg

- _absArg(z)_

Answers the list _[z.abs, z.arg]_ of the number _z_.

The absolute value and argument of a complex number:

```
>>> 5j12.absArg
[13, (12 / 5).arcTan]

>>> let z = 2 * 0.5.i.exp;
>>> z.absArg
[2 0.5]
```

Real numbers are a special kind of complex number:

```
>>> 3.absArg
[3 0]

>>> -3.absArg
[3 pi]
```

Collects over lists:

```
>>> [0j1 -1 0j-1 1].absArg
[1 0.5.pi; 1 pi; 1 -0.5.pi; 1 0]
```

* * *

See also: abs, angleVector, arg, Complex, toPolarCoordinates

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/AbsArg.html)

Categories: Complex
