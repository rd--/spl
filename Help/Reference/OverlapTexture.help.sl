# OverlapTexture

- _OverlapTexture(newEventBlock:/1, sustainTime, transitionTime, overlap)_

Overlap events.
Creates a series of overlapped sounds from a user function.
The user function should return a graph of unit generators that produce a continuous sound.
`OverlapTexture` will apply an envelope to the sound to cross fade different invocations of the user function.

- newEventBlock: Answers a graph of unit generators given a trigger signal indicating each event
- sustainTime: the sustain time of the envelope
- transitionTime: the transition time of the envelope
- overlap: number of overlapping events

Texture of three overlapping stereo sine tones:

```
{ :tr |
	{
		SinOsc(TRand(220, 990, tr), 0)
	} ! 2 * 0.1
}.OverlapTexture(3, 3, 3).Mix
```

Texture of overlapping _n_-channel sine tones (n should be number of speakers in system):

```
let n = 24;
{ :tr |
	{
		SinOsc(TRand(220, 990, tr), 0)
	} ! n / n / 3
}.OverlapTexture(3, 3, 3).Mix
```

There are many examples of `OverlapTexture` in the examples files:

```
let lfoFreq = 6;
let lfo = LfNoise0(lfoFreq) * 1000 + 1200;
let texture = { :tr |
	let f1 = Choose(
		tr,
		[
			25 30 34 37 41 42 46
			49 53 54 58 61 63 66
		]
	).MidiCps;
	let f2 = f1 * 2 + TRand(-0.5, 0.5, tr);
	LfPulse([f1 f2], 0, 0.2).Sum
}.OverlapTexture(4, 2, 4);
let left = Rlpf(
	texture.Sum * 0.02,
	lfo,
	MouseX(0.2, 0.02, 1, 0.2)
);
let delayTime = 2 / lfoFreq;
let right = DelayC(
	left,
	delayTime,
	delayTime
);
[left, right]
```

* * *

See also: overlapTextureProgram, XFadeTexture

Categories: Texture, Ugen
