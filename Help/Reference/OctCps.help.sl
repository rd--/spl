# OctCps

- _OctCps(aNumber)_

Convert decimal octaves to cycles per second.
Inverse of `CpsOct`.

Decimal octaves are a linear pitch space.
_C4_ is _4_, _A4_ is _4 + 9/12_.

```
>>> (4 + (9 / 12)).OctCps
440
```

Linear frequency sweep:

```
Saw(Line(2, 9, 10).OctCps) * 0.1
```

Evaluate symbolically:

```
>> OctCps(`x`)
(* 440 (^ 2 (- x 4.75)))
```

* * *

See also: CpsOct, MidiCps

Guides: Pitch Functions

Categories: Math, Ugen
