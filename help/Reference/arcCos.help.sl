# arcCos

_arcCos(z)_

Answers the arc cosine of the complex number _z_.

Real arguments:

```
>>> 0.arcCos
0.5.pi

>>> 0.4.arcCos
1.15928
```

Complex arguments:

```
>>> 1.5j0.arcCos
0j0.96242

>>> 2.5j1.arcCos
0.40617j1.65869
```

ArcCos threads elementwise over lists:

```
>>> [0.2 0.5 0.8].arcCos
[1.36944 1.04720 0.64350]
```

Zero of ArcCos:

```
>>> 1.arcCos
0
```

Compose with inverse:

```
>>> let n = 1.randomFloat;
>>> n.arcCos.cos ~ n
true
```

* * *

See also: arcCosh, arcSin, cos, sin, tan

References:
_Mathematica_
[1](https://mathworld.wolfram.com/InverseCosine.html)
[2](https://reference.wolfram.com/language/ref/ArcCos.html)

Categories: Trigonometry
