# Crackle

- _Crackle(param)_

Chaotic noise function.
A noise generator based on a chaotic function.

- param: useful values are from just below 1 to just above 2, towards 2 the sound crackles.

Fixed _param_:

```
Crackle(1.95) * 0.1
```

Modulate _param_:

```
Crackle(Line(1, 2, 10)) * 0.1
```

* * *

See also: LatoocarfianN, Logistic

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/Crackle.html)

Categories: Ugen, Noise
