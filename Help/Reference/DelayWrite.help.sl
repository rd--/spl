# DelayWrite

- _DelayWrite(buffer, input)_

`DelayTap` and `DelayWrite` implement delay line reading and writing in separate objects.
This lets one place signal processing in the feedback loop.

A _buffer_ is required to store the delay.
The maximum delay time is the length of the buffer minus the block size.
The minimum delay time is equal to the block size + 1.

- buffer: the memory for the delay line
- input: the input signal to write to the delay line

The output of `DelayWrite` is a copy of the input signal.
`DelayWrite` is ordinarily placed in the signal graph by the `<!` operator.

Simple feedback delay.
This program
allocates a buffer for the delay line,
makes a percussive sound as input,
taps the delay line at a 0.15 second delay,
mixes the delayed signal with the input,
write the mixed signal to the delay line,
and output the mixed signal.
See also `CombL`.

```
let buffer = BufAlloc(
	1,
	48000 * 0.3
).BufClear;
let input = Decay(
	Impulse(1, 0),
	0.2
) * PinkNoise();
let delayedSignal = DelayTap(
	buffer,
	0.15
);
let mixedSignal = (
	delayedSignal * 0.4
) + input;
let writer = DelayWrite(
	buffer,
	mixedSignal
);
mixedSignal <! writer
```

Ping pong delay.
This program
allocates a buffer for the left delay line,
allocates a buffer for the right delay line,
makes a percussive sound as input,
taps the left delay line,
taps the left delay line,
mixes the delayed signal with the input,
scales the delayed signal,
writes the scaled delay signal to the buffers in reverse order,
and outputs with delayed signal:

```
let leftBuffer = BufAlloc(
	1,
	48000 * 0.4
).BufClear;
let rightBuffer = BufAlloc(
	1,
	48000 * 0.4
).BufClear;
let input = Decay(
	Impulse(0.4, 0),
	0.1
) * PinkNoise();
let leftDelayedSignal = DelayTap(
	leftBuffer,
	0.3
);
let rightDelayedSignal = DelayTap(
	rightBuffer,
	0.3
);
let output = [
	leftDelayedSignal + input,
	rightDelayedSignal
];
let toDelay = output * 0.8;
let writer = DelayWrite(
	[
		rightBuffer,
		leftBuffer
	],
	toDelay
);
output <! writer
```

Illustrate distortion in the feedback loop.
This program
allocates a buffer for the delay line,
generates a sine pulse,
taps the delay line at 0.15 seconds and distorts it,
mixes the delayed signal with the input,
writes the mixed signal to the delay line,
and outputs the mixed signal:

```
let buffer = BufAlloc(
	1,
	48000 * 0.3
).BufClear;
let input = SinOsc(
	1000,
	0
) * LfPulse(
	0.3,
	0,
	0.05
) * 0.3;
let delayedSignal = DelayTap(
	buffer,
	0.15
).Distort;
let mixedSignal = (
	delayedSignal * 0.8
) + input;
let writer = DelayWrite(
	buffer,
	mixedSignal
);
mixedSignal <! writer
```

Pitch shift in the feedback loop.
This program
allocates a buffer for the delay line,
genrates a sine pulse,
taps the delay line at 0.15 seconds,
applies a pitch shift,
mixes the delayed signal with the input,
writes the mixed signal to the delay line,
and output the mixed signal:

```
let buffer = BufAlloc(
	1,
	48000 * 0.3
).BufClear;
let input = SinOsc(
	1000,
	0
) * LfPulse(
	0.3,
	0,
	0.05
) * 0.3;
let delayed = DelayTap(
	buffer,
	0.15
);
let shifted = PitchShift(
	delayed,
	0.2,
	5 / 7,
	0.01,
	0.01
);
let mixedSignal = (
	shifted * 0.8
) + input;
let writer = DelayWrite(
	buffer,
	mixedSignal
);
mixedSignal <! writer
```

* * *

See also: DelayTap

Categories: Ugen
