# tGrains

- _tGrains(numChannels, trigger=0, bufnum=0, rate=1, centerPos=0, dur=0.1, pan=0, amp=0.1, interp=4)_

Buffer granulator.
Triggers generate grains from a buffer.
Each grain has a Hanning envelope (_sin^2(x)_ for x from `zero` to `pi`),
and is panned between two channels of multiple outputs.

- numChannels: number of output channels
- trigger: at each trigger subsequent arguments are read and used as the arguments of a new grain
- bufnum: the index of the one-channel buffer to use
- rate: playback rate, 1=unchanged, 2=octave up, 0.5=octave down, -1=backwards
- centerPos: the position in the buffer (in seconds) at which the grain envelope will reach maximum amplitude
- dur: duration of the grain (in seconds)
- pan: location in  _(-1, 1)_, same meaing as at `panAz`
- amp: amplitude of the grain
- interp: interpolation method, 1=none, 2=linear, or 4=cubic

Note that, unlike `playBuf`, the rate argument is is multiplied by `BufRate`.

If the trigger is audio rate then the grains will start with sample accuracy.

demand sequences for _rate_ and _pan_ inputs, mouse control of _trigger_ rate and _pos_:

```spl sfAcquire
let numChannels = 8;
let triggerRate = mouseY(2, 200, 1, 0.2);
let trigger = impulse(triggerRate, 0);
let sf = sfAcquireMono('Floating');
let rate = dseq(
	Infinity,
	[10 1 1 0.5 0.5 0.2 0.1]
);
let center = mouseX(0, sfDuration(sf), 0, 0.2);
let dur = 4 / triggerRate;
let pan = dseq(Infinity, [-1, -0.9 .. 1]);
let amp = 1 / 4;
let interp = 2;
tGrains(
	numChannels,
	trigger,
	sf,
	rate,
	center,
	dur,
	pan,
	amp,
	interp
).splay
```

Uniform unary rate, perturb _center_ at clock rate

```spl SfAcquire
let numChannels = 8;
let triggerRate = mouseY(8, 120, 1, 0.2);
let trigger = impulse(triggerRate, 0);
let sf = sfAcquireMono('Floating');
let rate = 1;
let center0 = mouseX(0, sfDuration(sf), 0, 0.2);
let center = center0 + tRand(
	0, 0.01, trigger
);
let dur = 12 / triggerRate;
let pan = tRand(-1, 1, trigger) * 0.6;
let amp = 1 / 4;
let interp = 4;
tGrains(
	numChannels,
	trigger,
	sf,
	rate,
	center,
	dur,
	pan,
	amp,
	interp
).splay
```

Stochastic clock (_dust_):

```spl SfAcquire
let numChannels = 8;
let triggerRate = mouseY(8, 120, 1, 0.2);
let trigger = dust(triggerRate);
let sf = sfAcquireMono('Floating');
let rate = 1;
let center0 = mouseX(0, sfDuration(sf), 0, 0.2);
let center = center0 + tRand(
	0, 0.01, trigger
);
let dur = 4 / triggerRate;
let pan = tRand(-1, 1, trigger) * 0.6;
let amp = 1 / 4;
let interp = 4;
tGrains(
	numChannels,
	trigger,
	sf,
	rate,
	center,
	dur,
	pan,
	amp,
	interp
).splay
```

Mouse control of _center_ and _dur_:

```spl SfAcquire
let numChannels = 8;
let triggerRate = 12;
let trigger = impulse(triggerRate, 0);
let sf = sfAcquireMono('Floating');
let rate = 1;
let center0 = mouseX(0, sfDuration(sf), 0, 0.2);
let center = center0 + tRand(
	0, 0.01, trigger
);
let dur = mouseY(
	0.2, 24, 1, 0.2
) / triggerRate;
let pan = tRand(-1, 1, trigger) * 0.6;
let amp = 1 / 4;
let interp = 4;
tGrains(
	numChannels,
	trigger,
	sf,
	rate,
	center,
	dur,
	pan,
	amp,
	interp
).splay
```

Stochastic _center_, no external control:

```spl SfAcquire
let numChannels = 8;
let triggerRate = 100;
let trigger = impulse(triggerRate, 0);
let sf = sfAcquireMono('Floating');
let rate = 1;
let center = integrator(
	brownNoise().kr * 0.001,
	1
);
let dur = 8 / triggerRate;
let pan = tRand(-1, 1, trigger) * 0.6;
let amp = 1 / 4;
let interp = 4;
tGrains(
	numChannels,
	trigger,
	sf,
	rate,
	center,
	dur,
	pan,
	amp,
	interp
).splay
```

Stochastic _rate_:

```spl SfAcquire
let numChannels = 8;
let triggerRate = mouseY(1, 400, 1, 0.2);
let trigger = impulse(triggerRate, 0);
let sf = sfAcquireMono('Floating');
let rate = 2 ^ tRand(-2, 2, trigger);
let center = mouseX(0, sfDuration(sf), 0, 0.2);
let dur = 8 / triggerRate;
let pan = tRand(-1, 1, trigger) * 0.6;
let amp = 1 / 4;
let interp = 4;
tGrains(
	numChannels,
	trigger,
	sf,
	rate,
	center,
	dur,
	pan,
	amp,
	interp
).splay
```

Stochastic _rate_, fixed clock rate:

```spl sfAcquire
let numChannels = 8;
let trigger = impulse(440, 0);
let sf = sfAcquireMono('Floating');
let rate = 1.2 ^ tiRand(-3, 3, trigger);
let center = mouseX(0, sfDuration(sf), 0, 0.2);
let dur = 1.2 / mouseY(2, 120, 1, 0.2);
let pan = tRand(-1, 1, trigger) * 0.6;
let amp = 1 / 4;
let interp = 4;
tGrains(
	numChannels,
	trigger,
	sf,
	rate,
	center,
	dur,
	pan,
	amp,
	interp
).splay
```

* * *

See also: grainFm, warp1

Guides: Unit Generators

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/TGrains.html)

Categories: Ugen
