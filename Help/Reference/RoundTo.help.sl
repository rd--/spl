# RoundTo

- _RoundTo(aNumber, anotherNumber=1)_

Round to multiple of.
Quantization by rounding.
Rounds _aNumber_ to the nearest multiple of _anotherNumber_.

```
let l = Line(48, 57, 23);
SinOsc([l, l.RoundTo(1)].MidiCps, 0) * 0.1
```

* * *

See also: Ceiling, Floor

Guides: Unit Generators

References:
_Max_
[1](https://docs.cycling74.com/reference/gen_dsp_round/),
_SuperCollider_
[1](https://doc.sccode.org/Overviews/Operators.html#.round)

Categories: Ugen
