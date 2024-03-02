# Resonz

- _Resonz(in, freq, rq)_

Resonant filter.
A two pole resonant filter with zeroes at z = +/- 1.
Based on K. Steiglitz, "A Note on Constant-Gain Digital Resonators," Computer Music Journal, vol 18, no. 4, pp. 8-10, Winter 1994.

- in: input signal to be processed
- freq: resonant frequency in Hertz
- rq: bandwidth ratio (reciprocal of Q).
  rq = bandwidth / centerFreq.
  The reciprocal of Q is used rather than Q because it saves a divide operation inside the unit generator.

Fixed frequency:

```
Resonz(WhiteNoise() * 0.5, 2000, 0.1)
```

Modulate frequency:

```
Resonz(WhiteNoise() * 0.5, XLine(1000, 8000, 10), 0.05)
```

Modulate bandwidth:

```
Resonz(WhiteNoise() * 0.5, 2000, XLine(1, 0.001, 8))
```

Modulate bandwidth opposite direction:

```
Resonz(WhiteNoise() * 0.5, 2000, XLine(0.001, 1, 8))
```

* * *

See also: Formlet, Rhpf, Rlpf, Ringz

References:
_Csound_
[1](https://csound.com/docs/manual/resonz.html),
_SuperCollider_
[1](https://doc.sccode.org/Classes/Resonz.html)

Categories: Ugen
