# MidiRatio

- _MidiRatio(x)_

Convert an interval in midi notes into a frequency ratio.
Alias for `midiRatio`.

Inverse of `RatioMidi`.

```
>>> 12.MidiRatio
2

>>> 7.02.MidiRatio
1.5
```

Evaluate symbolically:

```
>> midiRatio(`x`)
(^ 2 (/ x 12))
```

* * *

See also: CpsMidi, MidiCps, RatioMidi

Guides: Pitch Functions

Categories: Arithmetic
