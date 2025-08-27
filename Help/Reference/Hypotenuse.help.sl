# Hypotenuse

- _Hypotenuse(x, y)_

Answer the square root of the sum of the squares of the arguments.
Or equivalently, the distance from the origin to the point _(x, y)_.

In this example, `Hypotenuse` is used to calculate a doppler shift pitch and amplitude based on distance.
Object travels 200 meters in 6 secs (=120kph) passing 10 meters from the listener.
(The speed of sound is 344 meters/sec.)

```
let x = 10;
let y = LfSaw(1 / 6, 0) * 100;
let distance = Hypotenuse(x, y);
let velocity = Slope(distance);
let pitchRatio = (344 - velocity) / 344;
let amplitude = 10 / distance.square;
SinOsc(1000 * pitchRatio, 0) * amplitude
```

The next example uses the distance to modulate a delay line:

```
let x = 10;
let y = LfSaw(1 / [6, 11], [0, 1]) * 100;
let distance = Hypotenuse(x, y);
let amplitude = 40 / distance.square;
let motorSound = Rlpf(
	SinOsc(
		200,
		0
	) * LfPulse(
		[31.3, 23.1],
		0,
		0.4
	),
	400,
	0.3
);
DelayL(
	motorSound,
	110 / 344,
	distance / 344
) * amplitude
```

* * *

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Hyoptenuse.html)

Categories: Ugen
