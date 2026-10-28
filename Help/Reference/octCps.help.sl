# octCps

- _octCps(n)_

Convert decimal octaves _n_ to cycles per second.
Inverse of `cpsOct`.

Decimal octaves are a linear pitch space.
_C4_ is _4_, _A4_ is _4 + 9/12_.

```
>>> (4 + (9 / 12)).octCps
440
```

Linear frequency sweep:

```
Saw(line(2, 9, 10).octCps) * 0.1
```

Evaluate symbolically:

```
>> octCps(`x`)
(* 440 (^ 2 (- x 4.75)))
```

* * *

See also: cpsOct, midiCps

Guides: Pitch Functions

Categories: Math, Ugen
