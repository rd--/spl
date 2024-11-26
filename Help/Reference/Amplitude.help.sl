# Amplitude

- _Amplitude(in, attackTime, releaseTime)_

Amplitude follower.
Tracks the peak amplitude of a signal.

- in: input signal
- attackTime: 60dB convergence time for following attacks
- releaseTime: 60dB convergence time for following decays

Use input amplitude to control Pulse amplitude, _use headphones to prevent feedback_.

```
Pulse(90, 0.3) * Amplitude(AudioIn(1), 0.01, 0.01)
```

Use input amplitude to control SinOsc frequency, _use headphones to prevent feedback_.

```
SinOsc(
	MulAdd(
		Amplitude(
			AudioIn(1),
			0.01,
			0.01
		),
		1200,
		400
	),
	0
) * 0.2
```

* * *

See also: PeakFollower

Categories: Ugen, Analysis
