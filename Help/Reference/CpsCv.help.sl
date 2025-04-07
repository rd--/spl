# CpsCv

- _CpsCv(f, f₀=C₄)_

Answer a voltage control level given the frequency _f_ and the reference frequency _f₀_.

At `zero`, answer _f₀_:

```
>>> CpsCv(256, 256)
0

>>> CpsCv(MidiCps(60))
0
```

A semitone is one-twelfth of an octave:

```
>>> [60 .. 72].MidiCps.CpsCv
[0 .. 12] / 12
```

A voltage range of _(-5, 5)_ or _(0, 10)_ traverses eleven octaves:

```
>>> ([0 .. 10] * 12).MidiCps.CpsCv
[-5 .. 5]

>>> let f0 = MidiCps(0);
>>> ([0 .. 10] * 12).MidiCps.CpsCv(f0)
[0 .. 10]
```

Voltage levels of C₂ through C₆ given the _scientific pitch_ reference frequency:

```
>>> [64 128 256 512 1024].CpsCv(256)
[-2 .. 2]
```

Evaluate symbolically:

```
>> CpsCv(`f`, `f0`)
(log2 (/ f f0))
```

* * *

See also: CvCps, MidiCps

References:
_W_
[1](https://en.wikipedia.org/wiki/Scientific_pitch)
