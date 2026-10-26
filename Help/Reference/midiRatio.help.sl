# midiRatio

- _midiRatio(x)_

Convert an interval in midi notes into a frequency ratio.
Alias for `midiRatio`.

Inverse of `ratioMidi`.

```
>>> 12.midiRatio
2

>>> 7.02.midiRatio
1.5
```

Evaluate symbolically:

```
>> midiRatio(`x`)
(^ 2 (/ x 12))
```

* * *

See also: cpsMidi, midiCps, ratioMidi

Guides: Pitch Functions

Categories: Arithmetic
