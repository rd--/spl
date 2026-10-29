# pingPongDelay

- _pingPongDelay(left, right, maxDelayTime, delayTime, feedBack)_

Stereo ping pong delay.
Bounces sound between two outputs.
PingPong is a pseudo-Ugen built upon `delayWrite` and `delayTap`.

- left: left input
- right: right input
- maxDelayTime: the maximum delay time in seconds, used to initialize the delay buffer sizes
- delayTime: delay time in seconds
- feedBack: feedback coefficient

Mouse control of delay time:

~~~spl syn=A
let left = decay2(
	impulse(0.6, 0) * 0.25,
	0.01,
	0.25
) * sinOsc(
	sinOsc(3.7, 0) * 200 + 500,
	0
);
let right = decay2(
	impulse(0.5, 0) * 0.25,
	0.01,
	0.25
) * resonz(
	pinkNoise() * 4,
	sinOsc(2.7, 0) * 1000 + 2500,
	0.2
);
pingPongDelay(
	left,
	right,
	0.5,
	mouseX(0.1, 0.5, 0, 0.2),
	0.7
)
~~~

* * *

See also: bufRd, clearBuf, delayTap, delayWrite, localBuf, phasor, recordBuf, sampleRate, wrap

Guides: Unit Generators

Categories: Ugen
