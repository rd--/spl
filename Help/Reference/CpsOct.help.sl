# CpsOct

- _CpsOct(aNumber)_

Convert cycles per second to decimal octaves.
Inverse of `OctCps`.

```
>>> 440.CpsOct
(4 + 9/12)
```

Evaluate symbolically:

```
>> CpsOct(`x`)
(+ (log2 (/ x 440)) 4.75)
```

* * *

See also: CpsMidi, RatioMidi, OctCps

Guides: Pitch Functions

Categories: Math, Ugen
