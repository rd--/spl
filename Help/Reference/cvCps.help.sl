# cvCps

- _cvCps(v, f₀=C₄)_

Answer the frequency,
in hertz,
given the control voltage _v_ and the reference frequency _f₀_.

At `zero`, answer _f₀_:

```
>>> cvCps(0, 256)
256

>>> cvCps(0)
midiCps(60)
```

A semitone is one-twelfth of an octave:

```
>>> ([0 .. 12] / 12).cvCps
[60 .. 72].midiCps
```

A voltage range of _(-5, 5)_ or _(0, 10)_ traverses eleven octaves:

```
>>> [-5 .. 5].cvCps
([0 .. 10] * 12).midiCps

>>> [0 .. 10].cvCps(0.midiCps)
([0 .. 10] * 12).midiCps
```

Frequencies of C₂ through C₆ given the _scientific pitch_ reference frequency:

```
>>> [-2 .. 2].cvCps(256)
[64 128 256 512 1024]
```

Evaluate symbolically:

```
>> cvCps(`v`, `f0`)
(* f0 (^ 2 v))
```

* * *

See also: cpsCv, midiCps

Guides: Pitch Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Scientific_pitch)
