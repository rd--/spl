# lfPulse

- _lfPulse(freq=440, phase=0, width=0.5)_

pulse oscillator.
A non-band-limited pulse oscillator.
Outputs a high value of one and a low value of zero.

- freq: frequency in Hertz
- iphase: initial phase offset in cycles (0..1)
- width: pulse width duty cycle from zero to one

Fixed frequency:

~~~spl syn=A
lfPulse(500, 0, 0.3) * 0.1
~~~

Mouse control of width:

~~~spl syn=B
lfPulse(
	500,
	0,
	mouseX(0, 1, 0, 0.2)
) * 0.1
~~~

Used as both Oscillator and Lfo:

~~~spl syn=C
lfPulse(
	lfPulse(3, 0, 0.3) * 200 + 200,
	0,
	0.2
) * 0.1
~~~

Compare with band limited pulse UGen:

~~~spl syn=D
[
	pulse(100, 0.3),
	lfPulse(100, 0, 0.3)
] * 0.15
~~~

Texture:

~~~spl texture
{
	let z = expRand(300, 3000) + [-0.6 0.6];
	rlpf(
		lfSaw(
			[21000 21001],
			0
		) * (
			lfPulse(
				expRand(0.1, 1),
				0,
				0.3
			) * 0.2 + 0.02
		) * lfPulse(
			z,
			0,
			mouseY(0.01, 0.99, 0, 0.2)
		),
		z * (
			lfPulse(
				expRand(0.1, 12),
				0,
				0.4
			) * 0.2 + 0.2
		) + (
			lfPulse(
				expRand(0.1, 12),
				0,
				0.7
			) * 0.2
		),
		0.1
	)
}.overlapTextureProgram(4, 4, 4)
~~~

* * *

See also: lfSaw, pulse

Guides: Unit Generators

References:
_Max_
[1](https://docs.cycling74.com/reference/gen_dsp_train/),
_SuperCollider_
[1](https://doc.sccode.org/Classes/LFPulse.html)

Categories: Ugen
