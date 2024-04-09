# PulseDpw

- _PulseDpw(freq=440, width=0.5)_

Band limited pulse wave generator with pulse width modulation.

Modulate frequency:

```
PulseDpw(XLine(40, 4000, 6), 0.1) * 0.1
```

Two band limited square waves through a resonant low pass filter:

```
Rlpf(PulseDpw([100 250], 0.5) * 0.1, XLine(8000, 400, 5), 0.05)
```

* * *

See also: Pulse, SawDpw
