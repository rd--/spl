# smallFloatEpsilon

- _smallFloatEpsilon(n)_

Answer the smallest number that may be added to `one` to make a number greater than one.

```
>>> system.smallFloatEpsilon
2.22E-16
```

At `Number`,
answers _n_ times ε:

```
>>> let x = 1.smallFloatEpsilon;
>>> (1 + x) > x
true
```

For numbers smaller than this value the answer will equal `one`:

```
>>> let x = 0.5.smallFloatEpsilon;
>>> (1 + x) = 1
true
```

Value is less than _10^-15_:

```
>>> 1.smallFloatEpsilon < 1E-15
true
```

* * *

See also: SmallFloat, epsilon, one, smallFloatMax

Guides: Numerical Precision

Categories: Math, Constant
