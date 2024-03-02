# Dust

- _Dust(density)_

Random impulses.
Generates random impulses from 0 to +1.

- density: average number of impulses per second

Fixed density:

```
Dust(200) * 0.1
```

Modulate density:

```
Dust(XLine(20000, 2, 10)) * 0.1
```

* * *

See also: Dust2, Impulse

References:
_Csound_
[1](https://csound.com/docs/manual/dust.html),
_SuperCollider_
[1](https://doc.sccode.org/Classes/Dust.html)

Categories: Ugen
