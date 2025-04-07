# MidiRatio

- _MidiRatio(aNumber)_

Convert an interval in midi notes into a frequency ratio.

Inverse of `RatioMidi`.

```
>>> 12.MidiRatio
2

>>> 7.02.MidiRatio
1.5
```

Evaluate symbolically:

```
>> MidiRatio(`x`)
(^ 2 (/ x 12))
```

* * *

See also: CpsMidi, MidiCps, RatioMidi

Guides: Pitch Functions

Categories: Arithmetic
