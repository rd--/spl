# EqPan

- _EqPan(in, pos=0)_

Equal power panner across the main output channels, as configured in `Preferences`.

- in: input signal
- pos: pan position, in range (-1, 1)

Pan pink noise:

```
EqPan(PinkNoise(), LfSaw(1 / 4, 0)) * 0.1
```

Sum of two panners, ie. channel-expansion at `EqPan`:

```
EqPan(
	[PinkNoise(), WhiteNoise()]  / [7, 23],
	[SinOsc(1 / 7, 0), LfSaw(1 / 4, 0)]
).Sum
```

* * *

See also: EqPan2, LinPan2, Pan2, PanAz

Categories: Ugen, Panning
