# eqPan2

- _eqPan2(in, pos=0)_

Two channel equal power panner.

- in: input signal
- pos: pan position, -1 is left, +1 is right

Pan `pinkNoise` using `sinOsc` control signal:

```
eqPan2(
	pinkNoise(0.1, 0),
	sinOsc(0.2, 0)
)
```

* * *

See also: linPan2, pan2

Guides: Unit Generators

Categories: Ugen, Panning
