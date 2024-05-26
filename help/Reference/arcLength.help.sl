# arcLength

- _arcLength(aCurve)_

Answer the length of _aCurve_.

At `Circle`:

```
>>> Circle([0 0], 1).arcLength
2.pi
```

At `Triangle`:

```
>>> Triangle([0 0], [1 0], [0 1]).arcLength
(2 + 2.sqrt)
```

At `Rectangle`:

```
>>> Rectangle([-1 -1], [1 1]).arcLength
8
```

* * *

See also: Circle, circumference, perimeter, Rectangle

References:
_Mathematica_
[1](https://mathworld.wolfram.com/ArcLength.html)
[2](https://reference.wolfram.com/language/ref/ArcLength.html)

Categories: Geometry
