# Blip

- _Blip(freq=440, numHarm=200)_

Band limited impulse oscillator, _Band Limited ImPulse_ generator.
All harmonics have equal amplitude.
This is the equivalent of 'buzz' in MusicN languages.

- freq: frequency in Hertz
- numHarm: number of harmonics. This may be lowered internally if it would cause aliasing.

Modulate frequency:

```
Blip(XLine(20000, 200, 6), 100) * 0.2
```

Modulate number of harmonics:

```
Blip(200,Line(1, 100, 20)) * 0.2
```

Modulate both:

```
Blip([3 33], LfNoise2(44) * 77 + 99) * LfTri(4, 0)
```

_Warning_:
This waveform in its raw form could be damaging to your ears at high amplitudes or for long periods.

_Implementation notes_:
It is improved from other implementations in that it will crossfade in a control period when the number of harmonics changes, so that there are no audible pops.
It also eliminates the divide in the formula by using a 1/sin table (with special precautions taken for 1/0).
The lookup tables are linearly interpolated for better quality.

_Naming_:
_Synth-O-Matic_ (1990) had an impulse generator called blip, hence that name here rather than 'buzz'.

* * *

See also: Impulse

References:
_Csound_
[1](https://csound.com/docs/manual/buzz.html)
[2](https://csound.com/docs/manual/gbuzz.html),
_SuperCollider_
[1](https://doc.sccode.org/Classes/Blip.html)
