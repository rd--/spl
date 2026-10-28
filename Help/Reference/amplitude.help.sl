# amplitude

- _amplitude(in, attackTime, releaseTime)_

amplitude follower.
Tracks the peak amplitude of a signal.

- in: input signal
- attackTime: 60dB convergence time for following attacks
- releaseTime: 60dB convergence time for following decays

Use input amplitude to control pulse amplitude, _use headphones to prevent feedback_.

```
pulse(90, 0.3) * amplitude(
	audioIn(1),
	0.01,
	0.01
)
```

Use input amplitude to control sinOsc frequency, _use headphones to prevent feedback_.

```
sinOsc(
	amplitude(
		audioIn(1),
		0.01,
		0.01
	) * 1200 + 400,
	0
) * 0.2
```

* * *

See also: peakFollower

Guides: Unit Generators

Categories: Ugen, Analysis
