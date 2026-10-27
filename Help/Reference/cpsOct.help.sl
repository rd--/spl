# cpsOct

- _cpsOct(x)_

Convert cycles per second to decimal octaves.
Inverse of `octCps`.

```
>>> 440.cpsOct
4 + 9/12

>>> 60.midiCps.cpsOct
4
```

Evaluate symbolically:

```
>> cpsOct(`x`)
(+ (log (/ x 440) 2) 4.75)
```

* * *

See also: cpsMidi, octCps, ratioMidi

Guides: Pitch Functions, Unit Generators

Categories: Math, Ugen
