# PingPongDelay

- _PingPongDelay(left, right, maxDelayTime, delayTime, feedBack)_

Stereo ping pong delay.
Bounces sound between two outputs.
PingPong is a pseudo-Ugen built upon `DelayWrite` and `DelayTap`.

- left: left input
- right: right input
- maxDelayTime: the maximum delay time in seconds, used to initialize the delay buffer sizes
- delayTime: delay time in seconds
- feedBack: feedback coefficient

Mouse control of delay time:

```
let left = Mul(
	Decay2(Impulse(0.6, 0) * 0.25, 0.01, 0.25),
	SinOsc(SinOsc(3.7, 0) * 200 + 500, 0)
);
let right = Mul(
	Decay2(Impulse(0.5, 0) * 0.25, 0.01, 0.25),
	Resonz(PinkNoise() * 4, SinOsc(2.7, 0) * 1000 + 2500, 0.2)
);
PingPongDelay(left, right, 0.5, MouseX(0.1, 0.5, 0, 0.2), 0.7)
```

* * *

See also: BufRd, ClearBuf, DelayTap, DelayWrite, LocalBuf, Phasor, RecordBuf, SampleRate, Wrap
