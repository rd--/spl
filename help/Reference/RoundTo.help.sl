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

Categories: Ugen
