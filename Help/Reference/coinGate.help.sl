# coinGate

- _coinGate(prob, trig)_

Statistical gate.
When it receives a trigger, it tosses a coin, and either passes the trigger or does not.

- prob: value between 0 and 1 determines probability of either possibilities
- trig: input signal

Mouse controls probablity:

~~~spl syn=A
let prob = mouseX(0, 1, 0, 0.2);
let trig = coinGate(
	prob,
	impulse(10, 0)
);
let freq = tRand(
	[200, 300],
	[400, 900],
	trig
);
sinOsc(freq, 0) * 0.1
~~~

Trigger level is preserved, mouse controls probablity over partial range:

~~~spl syn=B
let prob = mouseX(0, 0.65, 0, 0.2);
let trig = impulse(20, 0) * (
	sinOsc(0.5, 0) + 1
);
{
	ringz(
		coinGate(prob, trig * 0.5),
		[1, 1.5] * rand(1000, 9000),
		0.01
	)
} !+ 3
~~~

* * *

See also: Coin

Guides: Unit Generators

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/CoinGate.html)

Categories: Ugen
