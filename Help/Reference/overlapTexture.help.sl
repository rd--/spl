# overlapTexture

- _overlapTexture(newEventBlock/1, sustainTime, transitionTime, overlap)_

Overlap events.
Creates a series of overlapped sounds from a user function.
The user function should return a graph of unit generators that produce a continuous sound.
`overlapTexture` will apply an envelope to the sound to cross fade different invocations of the user function.

- newEventBlock: answers a graph of unit generators given a trigger signal indicating each event
- sustainTime: the sustain time of the envelope
- transitionTime: the transition time of the envelope
- overlap: number of overlapping events

Texture of three overlapping stereo sine tones:

~~~spl syn=A
{ :tr |
	{
		sinOsc(tRand(220, 990, tr), 0)
	} ! 2 * 0.1
}.overlapTexture(3, 3, 3).mix
~~~

Texture of overlapping _n_-channel sine tones (n should be number of speakers in system):

~~~spl syn=B
let n = 24;
{ :tr |
	{
		sinOsc(tRand(220, 990, tr), 0)
	} ! n / n / 3
}.overlapTexture(3, 3, 3).mix
~~~

There are many examples of `overlapTexture` in the examples files:

~~~spl syn=C
let lfoFreq = 6;
let lfo = lfNoise0(lfoFreq) * 1000 + 1200;
let texture = { :tr |
	let f1 = tChoose(
		tr,
		[
			25 30 34 37 41 42 46
			49 53 54 58 61 63 66
		]
	).midiCps;
	let f2 = f1 * 2 + tRand(-0.5, 0.5, tr);
	lfPulse([f1 f2], 0, 0.2).sum
}.overlapTexture(4, 2, 4).sum;
let left = rlpf(
	texture * 0.02,
	lfo,
	mouseX(0.2, 0.02, 1, 0.2)
);
let delayTime = 2 / lfoFreq;
let right = delayC(
	left,
	delayTime,
	delayTime
);
[left, right]
~~~

* * *

See also: overlapTextureProgram, xFadeTexture

Guides: SuperCollider Functions, Unit Generators

Categories: Texture, Ugen
