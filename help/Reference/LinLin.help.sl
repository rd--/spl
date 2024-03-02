# LinLin

- _LinLin(in, srcLow=-1, srcHigh=1, dstLow=0, dstHigh=1)_

Maps a linear range of values to another linear range of values.

- in: input to convert
- srcLoq: lower limit of input range
- srcHigh: upper limit of input range
- dstLoq: lower limit of output range
- dstHigh: upper limit of output range

Map oscillator to frequency:

```
let mod = SinOsc(Line(1, 10, 10), 0);
SinOsc(LinLin(mod, -1, 1, 100, 900), 0) * 0.1
```

Modulating destination values:

```
let mod = LfNoise2(80);
SinOsc(LinLin(mod, -1, 1, MouseX(200, 8000, 1, 0.2), MouseY(200, 8000, 1, 0.2)), 0) * 0.1
```

Modulating source and destination values:

```
let mod = LfNoise2(80);
SinOsc(
        LinLin(
		mod,
		SinOsc(0.2, 0),
		SinOsc(0.2543, 0),
		MouseX(200, 8000, 1, 0.2),
		MouseY(200, 8000, 1, 0.2)
        ),
	0
) * 0.1
```

* * *

See also: LinExp

References:
_Csound_
[1](https://csound.com/docs/manual/linlin.html),
_SuperCollider_
[1](https://doc.sccode.org/Classes/LinLin.html)

Categories: Ugen
