# ArcCos

- _ArcCos(x)_

Arc cosine of _x_.
Alias of `arcCos`.

At `SmallFloat`:

```
>>> 0.4.ArcCos
1.15928
```

At `Ugen`:

```
let x = Line(-1, 1, 2).ArcCos * 2.pi;
SinOsc(x * 110 + 110, 0) * 0.1
```

* * *

See also: arcCos, ArcSin, ArcTan, Cos, Sin

Categories: Math, Ugen, Trigonometry
