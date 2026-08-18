# CpsOct

- _CpsOct(x)_

Convert cycles per second to decimal octaves.
Inverse of `OctCps`.

```
>>> 440.CpsOct
4 + 9/12

>>> 60.MidiCps.CpsOct
4
```

Evaluate symbolically:

```
>> cpsOct(`x`)
(+ (log2 (/ x 440)) 4.75)
```

* * *

See also: CpsMidi, RatioMidi, OctCps

Guides: Pitch Functions, Unit Generators

Categories: Math, Ugen
