# SelectXFocus -- mixing

Mix one output from many sources

The output is mixed from an array of inputs,
linearly interpolating from a number of adjacent channels.
A focus argument allows to control how many adjacent sources are mixed.

_SelectXFocus(which, array, focus=1, wrap=false)_

- which: Index of the selected input, which is also the center of the selection for a focus > 0.
- array: A collection of inputs.
- focus: The fuzziness of the selection: the larger the focus, the less adjacent inputs are mixed in.
- wrap: If set to true, index will wrap around the array of inputs, cf. wrapAt.

Note:
All the Ugens are continuously running.
This may not be the most efficient way if each input is Cpu-expensive.

Select one of eight input signals using mouse, fixed focus:

	var array = {
		Saw(Rand(1, 3)) * Saw(Rand(100, 3000))
	} ! 8;
	SelectXFocus(MouseX(-20, 20, 0, 0.2), array, 0.3, true) * 0.1

Select one of four stereo input signals using mouse,
control focus using y axis:

	var a = [
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

Radio tuner (Jrh):

	var n = 8;
	var mX = MouseX(0, 1, 0, 0.1);
	var mY = MouseY(0, 1, 0, 0.2);
	var mWrap = { :pMin :pMax :min :max |
		(mX * ExpRand(pMin, pMax)).Sin + 1 * 0.5 * ExpRand(min, max)
	};
	var a = {
		var freq = mWrap(10, 40, 200, 5000) + ExpRand(200, 3000);
		var fMul = LfNoise0(ExpRand(0.1, 8)).RoundTo(1 / 6).ExpRange(1, Rand(1, 1.2));
		var phase = LfNoise2(mWrap(1, 20, 10, 1000)) * Rand(2, 5);
		SinOsc(freq * fMul, phase)
	} ! n;
	var b = OnePole({ PinkNoise() * 0.5 } ! 2, 0.4);
	a.add(
		SinOsc(
			(LfdNoise0(11) * SetResetFf(Dust(1) * 0.3, Dust(1) * 0.3)).Range(0, 700) + 220,
			0
		)
	);
	SelectXFocus(mX * n, a, mY * n, false).Sum * 0.2 + b * Line(0, 1, 3)

* * *

See also: Select, SelectX
