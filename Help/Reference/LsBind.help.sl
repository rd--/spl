# LsBind

- _LsBind(aRecord)_

Transform a dictionary of streams into a stream of dictionaries.

An instrument that releases itself (ie. no gate):

~~~spl scsynth
let ctl = (
	freq: 440,
	amp: 0.1,
	release: 1,
	detune: 1.01,
	cutoff: 5000,
	q: 0.5
).localControls;
let freq = [
	ctl['freq'],
	ctl['freq'] * ctl['detune']
];
let osc = Saw(freq).Release(
	0,
	1,
	ctl['release']
);
let cut = XLine(
	ctl['cutoff'],
	100,
	ctl['release']
);
let sig = Rlpf(
	osc,
	cut,
	1 / ctl['q']
) * ctl['amp'];
UgenGraph('saw', sig).send
~~~

Random linear sequence:

~~~spl sequence
let r = Sfc32(378141);
LsBind(
	instrument: 'saw',
	dur: LsXRand(
		1 / [23 19 17 13 11 7 5 3 1],
		Infinity,
		r
	),
	release: LsRand(
		5 / [17 13 11 7 5 3 1],
		Infinity,
		r
	),
	freq: LsXRand(
		[1 .. 23] * 111,
		Infinity,
		r
	),
	amp: LsRand(
		1 / [99 77 55 33 11],
		Infinity,
		r
	),
	detune: LsRand(
		[3 2 1.5 1 0.5] / 100 + 1,
		Infinity,
		r
	),
	cutoff: LsRand(
		1000 * [1 .. 9],
		Infinity,
		r
	)
)
~~~

Dyads courtesy list expansion:

~~~spl sequence
let r = Sfc32(738914);
LsBind(
	instrument: 'saw',
	dur: 1 / 5,
	sustain: 3,
	freq: LsTuple(
		{
			LsXRand(
				[1 .. 23] * 55,
				Infinity,
				r
			)
		} ! 2,
		Infinity
	),
	amp: LsRand(
		1 / [99 77 55 33 11],
		Infinity,
		r
	),
	detune: LsRand(
		[3 2 1.5 1 0.5] / 100 + 1,
		Infinity,
		r
	)
)
~~~

A very similar instrument with a _gate_ control:

~~~spl scsynth
let ctl = (
	freq: 440,
	detune: 1.01,
	cutoff: 5000,
	q: 0.5,
	amp: 0.1,
	gate: 1,
	attack: 0.01,
	release: 1
).localControls;
let freq = [
	ctl['freq'],
	ctl['freq'] * ctl['detune']
];
let env = Asr(
	ctl['gate'],
	ctl['attack'],
	ctl['release'],
	-4
).FreeSelfWhenDone;
let osc = Saw(freq) * env;
let sig = Rlpf(
	osc,
	ctl['cutoff'],
	1 / ctl['q']
) * ctl['amp'];
UgenGraph('saw', sig).send
~~~

A very similar random linear sequence with _sustain_ and _gate_ parameters:

~~~spl sequence
let r = Sfc32(738914);
LsBind(
	instrument: 'saw',
	gate: 1,
	dur: LsXRand(
		1 / [23 19 17 13 11 7 5 3 1],
		Infinity,
		r
	),
	sustain: LsRand(
		3 / [17 13 11 7 5 3 1],
		Infinity,
		r
	),
	release: LsRand(
		5 / [17 13 11 7 5 3 1],
		Infinity,
		r
	),
	freq: LsXRand(
		[1 .. 23] * 111,
		Infinity,
		r
	),
	amp: LsRand(
		1 / [99 77 55 33 11],
		Infinity,
		r
	),
	detune: LsRand(
		[3 2 1.5 1 0.5] / 100 + 1,
		Infinity,
		r
	),
	cutoff: LsRand(
		1000 * [1 .. 9],
		Infinity,
		r
	)
)
~~~

* * *

See also: play, Record

Guides: Patterns and Streams

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/Pbind.html)

Categories: Stream
