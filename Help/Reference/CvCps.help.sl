# CvCps

- _CvCps(v, f₀=C₄)_

Answer the frequency,
in hertz,
given the control voltage _v_ and the reference frequency _f₀_.

At `zero`, answer _f₀_:

```
>>> CvCps(0, 256)
256

>>> CvCps(0)
MidiCps(60)
```

A semitone is one-twelfth of an octave:

```
>>> ([0 .. 12] / 12).CvCps
[60 .. 72].MidiCps
```

A voltage range of _(-5, 5)_ or _(0, 10)_ traverses eleven octaves:

```
>>> [-5 .. 5].CvCps
([0 .. 10] * 12).MidiCps

>>> [0 .. 10].CvCps(MidiCps(0))
([0 .. 10] * 12).MidiCps
```

Frequencies of C₂ through C₆ given the _scientific pitch_ reference frequency:

```
>>> [-2 .. 2].CvCps(256)
[64 128 256 512 1024]
```

Evaluate symbolically:

```
>> CvCps(`v`, `f0`)
(* f0 (^ 2 v))
```

* * *

See also: CpsCv, MidiCps

References:
_W_
[1](https://en.wikipedia.org/wiki/Scientific_pitch)
