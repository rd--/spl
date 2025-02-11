# EqPan2

- _EqPan2(in, pos=0)_

Two channel equal power panner.

- in: input signal
- pos: pan position, -1 is left, +1 is right

Pan `PinkNoise` using `SinOsc` control signal:

```
EqPan2(
	PinkNoise(0.1, 0),
	SinOsc(0.2, 0)
)
```

* * *

See also: LinPan2, Pan2

Categories: Ugen, Panning
