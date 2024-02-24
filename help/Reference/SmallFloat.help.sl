# SmallFloat

Type representing floating-point numbers like 23 or 3.141.

```
>>> 3.141.typeOf
'SmallFloat'

>>> 23.typeOf
'SmallFloat'
```

- _asSmallFloat(aFraction | anInteger | aSmallFloat)_

In the Fraction case, answer the nearest SmallFloat:

```
>>> 1/4.asSmallFloat
0.25
```

In the SmallFloat and Integer cases answer _identity_:

```
>>> 23.asSmallFloat
23

>>> pi.asSmallFloat
pi
```

* * *

See also: Fraction, Integer, LargeInteger

Categories: Math, Type
