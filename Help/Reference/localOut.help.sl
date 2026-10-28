# localOut

- _localOut(channelsList)_

Define and write to an audio bus local to the enclosing synth,
which can be read from by `localIn`.

A resonator, note that one must subtract the block size for correct tuning:

~~~
let p = localIn(1, 0);
let i = impulse(1, 0);
let d = delayC(
	i + (p * 0.995),
	1,
	440.reciprocal - controlDur()
);
[
	p <! localOut(d),
	sinOsc(440, 0) * 0.05
]
~~~

A ping pong delay:

~~~
let n = decay(
	impulse(0.3, 0),
	0.1
) * pinkNoise() * 0.2;
let l = localIn(2, 0) + [n, 0];
let d = delayN(l, 0.2, 0.2);
d <! localOut(d.reverse * 0.8)
~~~

* * *

See also: <!, localIn

Guides: Unit Generators

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/LocalOut.html)

Categories: Ugen
