# dust

- _dust(density)_

Random impulses.
Generates random impulses from 0 to +1.

- density: average number of impulses per second

Fixed density:

```
dust(200) * 0.1
```

Modulate density:

```
dust(xLine(20000, 2, 10)) * 0.1
```

* * *

See also: dust2, impulse

Guides: Unit Generators

References:
_Csound_
[1](https://csound.com/docs/manual/dust.html),
_SuperCollider_
[1](https://doc.sccode.org/Classes/Dust.html)

Categories: Ugen
