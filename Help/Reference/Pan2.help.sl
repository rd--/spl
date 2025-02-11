# Pan2

- _Pan2(in, pos=0, level=1)_

Two channel equal power panner.

- in: input signal
- pos: pan position, -1 is left, +1 is right
- level: a control rate level input

Pan `PinkNoise` according to `SinOsc`:

```
Pan2(
	PinkNoise(),
	SinOsc(0.2, 0),
	0.1
)
```

* * *

See also: EqPan2, LinPan2

References:
_Csound_
[1](https://csound.com/docs/manual/pan2.html),
_SuperCollider_
[1](https://doc.sccode.org/Classes/Pan2.html)

Categories: Ugen
