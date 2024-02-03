# SawDpw

Efficient sawtooth oscillator with low aliasing.

_SawDpw(freq=440, iphase=0)_

A sawtooth oscillator using the "Differentiated Parabolic Wave" technique,
which suppresses aliasing at a wide range of frequencies,
yet is about 3 times as Cpu-efficient as the SuperCollider Saw ugen.

- freq: frequency in Hertz
- iphase: initial phase offset, a value ranging from -1 to 1

SawDpw does not guarantee to be alias-free but sounds very good for most applications:
e.g. at 44.1 kHz sample rate, aliasing can only be heard if the frequency goes over around 4 kHz.
The technique is documented in Välimäki (2005) Signal Processing Letters 12(3) pages 214-217.

Move mouse to change frequency:

```
SawDpw(MouseX(50, 2000, 1, 0.2), 0) * 0.1
```

Compare aliasing characteristics:

```
SawDpw(MouseX(50, 10000, 1, 0.2), 0) * 0.1
```

* * *

See also: PulseDpw, Saw

