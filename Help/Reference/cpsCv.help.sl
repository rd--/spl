# cpsCv

- _cpsCv(f, f₀=C₄)_

Answer a voltage control level given the frequency _f_ and the reference frequency _f₀_.

At _f₀_, answer `zero`:

```
>>> cpsCv(256, 256)
0

>>> cpsCv(midiCps(60))
0
```

A semitone is one-twelfth of an octave:

```
>>> [60 .. 72].midiCps.cpsCv
[0 .. 12] / 12
```

A voltage range of _(-5, 5)_ or _(0, 10)_ traverses eleven octaves:

```
>>> ([0 .. 10] * 12).midiCps.cpsCv
[-5 .. 5]

>>> let f0 = 0.midiCps;
>>> ([0 .. 10] * 12).midiCps.cpsCv(f0)
[0 .. 10]
```

Voltage levels of C₂ through C₆ given the _scientific pitch_ reference frequency:

```
>>> [64 128 256 512 1024].cpsCv(256)
[-2 .. 2]
```

Evaluate symbolically:

```
>> cpsCv(`f`, `f0`)
(log (/ f f0) 2)
```

* * *

See also: cvCps, midiCps

Guides: Tuning Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Scientific_pitch)
