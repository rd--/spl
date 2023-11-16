# EqPan -- equal power panning

_EqPan(in, pos=0)_

Equal power panner across the main output channels, as configured in Preferences.

- in: input signal
- pos: pan position, in range (-1, 1)

Pan noise:

	EqPan(PinkNoise(), LfSaw(1 / 4, 0)) * 0.1

* * *

See also: EqPan2, LinPan2, Pan2, PanAz
