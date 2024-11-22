# SelectXFocus

- _SelectXFocus(which, list, focus=1, wrap=false)_

Mix one output from many sources

The output is mixed from a list of inputs,
linearly interpolating from a number of adjacent channels.
A focus argument allows to control how many adjacent sources are mixed.

- which: Index of the selected input, which is also the center of the selection for a focus > 0.
- list: A collection of inputs.
- focus: The fuzziness of the selection: the larger the focus, the less adjacent inputs are mixed in.
- wrap: If set to true, index will wrap around the list of inputs, c.f. `wrapAt`.

Note:
All the Ugens are continuously running.
This may not be the most efficient way if each input is Cpu-expensive.

Select one of eight input signals using mouse, fixed focus:

```
let list = {
	Saw(Rand(1, 3)) * Saw(Rand(100, 3000))
} ! 8;
SelectXFocus(MouseX(-20, 20, 0, 0.2), list, 0.3, true) * 0.1
```

Select one of four stereo input signals using mouse,
control focus using y axis:

```
let a = [
	Saw(LfSaw(3 * [1, 1.01], 0) * 100 + 230),
	SinOsc(440, 0),
	Pulse(LfPulse(3 * [1, 1.02], 0, 0.5) * 100 + 230, 0.5),
	SinOsc(SinOsc(4 * [1, 1.03], 0) * 200 + 300, 0)
];
SelectXFocus(
	MouseX(0, 1, 0, 0.2) * a.size,
	a,
	MouseY(0, a.size, 0, 0.2),
	false
).Sum * 0.2
```

Radio tuner (Jrh):

```
let n = 8;
let mX = MouseX(0, 1, 0, 0.1);
let mY = MouseY(0, 1, 0, 0.2);
let mWrap = { :pMin :pMax :min :max |
	(mX * ExpRand(pMin, pMax)).Sin + 1 * 0.5 * ExpRand(min, max)
};
let a = {
	let freq = mWrap(10, 40, 200, 5000) + ExpRand(200, 3000);
	let fMul = LfNoise0(ExpRand(0.1, 8)).RoundTo(1 / 6).ExpRange(1, Rand(1, 1.2));
	let phase = LfNoise2(mWrap(1, 20, 10, 1000)) * Rand(2, 5);
	SinOsc(freq * fMul, phase)
} ! n;
let b = OnePole({ PinkNoise() * 0.5 } ! 2, 0.4);
a.add(
	SinOsc(
		(
			LfdNoise0(11)
			*
			SetResetFf(Dust(1) * 0.3, Dust(1) * 0.3)
		).LinLin(-1, 1, 0, 700) + 220,
		0
	)
);
SelectXFocus(mX * n, a, mY * n, false).Sum * 0.2 + b * Line(0, 1, 3)
```

* * *

See also: Select, SelectX

Categories: Mixing
