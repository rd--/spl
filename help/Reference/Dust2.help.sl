# Dust2

- _Dust2(density)_

Bipolar random impulses.
Generates random impulses from -1 to +1.
There is no noticeable difference in sound from Dust, but it may be useful for its properties in some situations.

- density: average number of impulses per second

Fixed density:

```
Dust2(200) * 0.1
```

Modulate density:

```
Dust2(XLine(20000, 2, 10)) * 0.1
```

* * *

See also: Dust, DustRange

References:
_Csound_
[1](https://csound.com/docs/manual/dust2.html),
_SuperCollider_
[1](https://doc.sccode.org/Classes/Dust2.html)
