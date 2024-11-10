# ArcCos

- _ArcCos(aNumber)_

Arc cosine.

At `SmallFloat`:

```
>>> 0.4.ArcCos
1.15928
```

At `Ugen`:

```
let x = Line(-1, 1, 2).ArcCos / 0.5 * pi;
SinOsc(x * 110 + 110, 0) * 0.1
```

* * *

See also: arcCos, ArcSin, ArcTan, Cos, Sin

Categories: Math, Ugen, Trigonometry
