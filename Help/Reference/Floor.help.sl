# Floor

- _Floor(x)_

Next lower integer.
Alias of `floor`.

```
>>> 1.5.Floor
1
```

Stepped line:

```
let m = XLine(48, 57, 7);
SinOsc([m, m.Floor].MidiCps, 0) * 0.1
```

* * *

See also: Ceiling, floor, Round

Guides: Unit Generators

Categories: Truncating, Rounding, Ugen
