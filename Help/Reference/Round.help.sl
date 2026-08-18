# Round

- _Round(a, b=1)_

Round _a_ to the nearest multiple of _b_.
Quantization by rounding.
Alias of `round`.

```
let l = Line(48, 57, 23);
SinOsc([l, l.Round(1)].MidiCps, 0) * 0.1
```

* * *

See also: Ceiling, Floor, round

Guides: Unit Generators

References:
_Max_
[1](https://docs.cycling74.com/reference/gen_dsp_round/),
_SuperCollider_
[1](https://doc.sccode.org/Overviews/Operators.html#.round)

Categories: Ugen
