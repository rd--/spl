# absArg

- _absArg(z)_

Answers the list _[z.abs, z.arg]_ of the number _z_.

The absolute value and argument of a complex number:

```
>>> 5J12.absArg
[13, (12 / 5).arcTan]

>>> let [r, theta] = 5J12.absArg;
>>> r * [theta.cos theta.sin]
[5 12]

>>> let z = 2 * 0.5I.exp;
>>> z.absArg
[2 0.5]

>>> 3J4.absArg
[5 0.927295]
```

Real numbers are a special kind of complex number:

```
>>> 3.absArg
[3 0]

>>> -3.absArg
[3 1.pi]
```

Collects over lists:

```
>>> [0J1 -1 0J-1 1].absArg
[1 0.5.pi; 1 1.pi; 1 -0.5.pi; 1 0]
```

`absArg` is an alias for `absoluteValueArgument`.

* * *

See also: Complex, abs, absArg, angleVector, arg, toPolarCoordinates

Guides: Complex Number Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/AbsArg.html)

Categories: Complex
