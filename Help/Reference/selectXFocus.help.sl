# selectXFocus

- _selectXFocus(which, list, focus=1, wrap=false)_

mix one output from many sources

The output is mixed from a list of inputs,
linearly interpolating from a number of adjacent channels.
A focus argument allows to control how many adjacent sources are mixed.

- which: Index of the selected input, which is also the center of the selection for a focus > 0.
- list: A collection of inputs.
- focus: The fuzziness of the selection: the larger the focus, the less adjacent inputs are mixed in.
- wrap: If set to true, index will wrap around the list of inputs, c.f. `atWrap`.

Note:
All the Ugens are continuously running.
This may not be the most efficient way if each input is Cpu-expensive.

Select one of eight input signals using mouse, fixed focus:

~~~spl syn=A
let list = {
	saw(rand(1, 3)) * saw(rand(100, 3000))
} ! 8;
selectXFocus(
	mouseX(-20, 20, 0, 0.2),
	list,
	0.3,
	true
) * 0.1
~~~

Select one of four stereo input signals using mouse,
control focus using y axis:

~~~spl syn=B
let a = [
	saw(
		lfSaw(3 * [1 1.01], 0) * 100 + 230
	),
	sinOsc(440, 0),
	pulse(
		lfPulse(3 * [1 1.02], 0, 0.5) * 100 + 230,
		0.5
	),
	sinOsc(
		sinOsc(4 * [1 1.03], 0) * 200 + 300,
		0
	)
];
selectXFocus(
	mouseX(0, 1, 0, 0.2) * a.size,
	a,
	mouseY(0, a.size, 0, 0.2),
	false
).sum * 0.2
~~~

Radio tuner (Jrh):

~~~spl syn=C
let n = 8;
let mX = mouseX(0, 1, 0, 0.1);
let mY = mouseY(0, 1, 0, 0.2);
let mWrap = { :pMin :pMax :min :max |
	(
		mX * expRand(pMin, pMax)
	).sin + 1 * 0.5 * expRand(min, max)
};
let a = {
	let freq = mWrap(10, 40, 200, 5000);
	let fAdd = expRand(200, 3000);
	let fMul = lfNoise0(
		expRand(0.1, 8)
	).round(
		1 / 6
	).expRange(
		1,
		rand(1, 1.2)
	);
	let phase = lfNoise2(
		mWrap(1, 20, 10, 1000)
	) * rand(2, 5);
	sinOsc(freq + fAdd * fMul, phase)
} ! n;
let b = onePole({ pinkNoise() * 0.5 } ! 2, 0.4);
a.add!(
	sinOsc(
		(
			lfdNoise0(11) * setResetFf(
				dust(1) * 0.3,
				dust(1) * 0.3
			)
		).linLin(-1, 1, 0, 700) + 220,
		0
	)
);
selectXFocus(
	mX * n,
	a,
	mY * n,
	false
).sum * 0.2 + b * line(0, 1, 3)
~~~

* * *

See also: selectT, selectX

Guides: Unit Generators

Categories: Mixing
