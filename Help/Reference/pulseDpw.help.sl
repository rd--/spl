# pulseDpw

- _pulseDpw(freq=440, width=0.5)_

Band limited pulse wave generator with pulse width modulation.

Modulate frequency:

```
pulseDpw(xLine(40, 4000, 6), 0.1) * 0.1
```

Two band limited square waves through a resonant low pass filter:

```
rlpf(
	pulseDpw([100 250], 0.5) * 0.1,
	xLine(8000, 400, 5),
	0.05
)
```

* * *

See also: pulse, sawDpw

Guides: Unit Generators

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/PulseDPW.html)

Categories: Ugen
