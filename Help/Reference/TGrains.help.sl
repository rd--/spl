# TGrains

- _TGrains(numChannels, trigger=0, bufnum=0, rate=1, centerPos=0, dur=0.1, pan=0, amp=0.1, interp=4)_

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
- pan: location in  _(-1, 1)_, same meaing as at `PanAz`
- amp: amplitude of the grain
- interp: interpolation method, 1=none, 2=linear, or 4=cubic

Note that, unlike `PlayBuf`, the rate argument is is multiplied by `BufRate`.

If the trigger is audio rate then the grains will start with sample accuracy.

Demand sequences for _rate_ and _pan_ inputs, mouse control of _trigger_ rate and _pos_:

```spl SfAcquire
let numChannels = 8;
let triggerRate = MouseY(2, 200, 1, 0.2);
let trigger = Impulse(triggerRate, 0);
let sf = SfAcquireMono('Floating');
let rate = Dseq(
	Infinity,
	[10 1 1 0.5 0.5 0.2 0.1]
);
let center = MouseX(0, SfDur(sf), 0, 0.2);
let dur = 4 / triggerRate;
let pan = Dseq(Infinity, [-1, -0.9 .. 1]);
let amp = 1 / 4;
let interp = 2;
TGrains(
	numChannels,
	trigger,
	sf,
	rate,
	center,
	dur,
	pan,
	amp,
	interp
).Splay
```

Uniform unary rate, perturb _center_ at clock rate

```spl SfAcquire
let numChannels = 8;
let triggerRate = MouseY(8, 120, 1, 0.2);
let trigger = Impulse(triggerRate, 0);
let sf = SfAcquireMono('Floating');
let rate = 1;
let center0 = MouseX(0, SfDur(sf), 0, 0.2);
let center = center0 + TRand(
	0, 0.01, trigger
);
let dur = 12 / triggerRate;
let pan = TRand(-1, 1, trigger) * 0.6;
let amp = 1 / 4;
let interp = 4;
TGrains(
	numChannels,
	trigger,
	sf,
	rate,
	center,
	dur,
	pan,
	amp,
	interp
).Splay
```

Stochastic clock (_Dust_):

```spl SfAcquire
let numChannels = 8;
let triggerRate = MouseY(8, 120, 1, 0.2);
let trigger = Dust(triggerRate);
let sf = SfAcquireMono('Floating');
let rate = 1;
let center0 = MouseX(0, SfDur(sf), 0, 0.2);
let center = center0 + TRand(
	0, 0.01, trigger
);
let dur = 4 / triggerRate;
let pan = TRand(-1, 1, trigger) * 0.6;
let amp = 1 / 4;
let interp = 4;
TGrains(
	numChannels,
	trigger,
	sf,
	rate,
	center,
	dur,
	pan,
	amp,
	interp
).Splay
```

Mouse control of _center_ and _dur_:

```spl SfAcquire
let numChannels = 8;
let triggerRate = 12;
let trigger = Impulse(triggerRate, 0);
let sf = SfAcquireMono('Floating');
let rate = 1;
let center0 = MouseX(0, SfDur(sf), 0, 0.2);
let center = center0 + TRand(
	0, 0.01, trigger
);
let dur = MouseY(
	0.2, 24, 1, 0.2
) / triggerRate;
let pan = TRand(-1, 1, trigger) * 0.6;
let amp = 1 / 4;
let interp = 4;
TGrains(
	numChannels,
	trigger,
	sf,
	rate,
	center,
	dur,
	pan,
	amp,
	interp
).Splay
```

Stochastic _center_, no external control:

```spl SfAcquire
let numChannels = 8;
let triggerRate = 100;
let trigger = Impulse(triggerRate, 0);
let sf = SfAcquireMono('Floating');
let rate = 1;
let center = Integrator(
	BrownNoise().kr * 0.001,
	1
);
let dur = 8 / triggerRate;
let pan = TRand(-1, 1, trigger) * 0.6;
let amp = 1 / 4;
let interp = 4;
TGrains(
	numChannels,
	trigger,
	sf,
	rate,
	center,
	dur,
	pan,
	amp,
	interp
).Splay
```

Stochastic _rate_:

```spl SfAcquire
let numChannels = 8;
let triggerRate = MouseY(1, 400, 1, 0.2);
let trigger = Impulse(triggerRate, 0);
let sf = SfAcquireMono('Floating');
let rate = 2 ^ TRand(-2, 2, trigger);
let center = MouseX(0, SfDur(sf), 0, 0.2);
let dur = 8 / triggerRate;
let pan = TRand(-1, 1, trigger) * 0.6;
let amp = 1 / 4;
let interp = 4;
TGrains(
	numChannels,
	trigger,
	sf,
	rate,
	center,
	dur,
	pan,
	amp,
	interp
).Splay
```

Stochastic _rate_, fixed clock rate:

```spl SfAcquire
let numChannels = 8;
let trigger = Impulse(440, 0);
let sf = SfAcquireMono('Floating');
let rate = 1.2 ^ TiRand(-3, 3, trigger);
let center = MouseX(0, SfDur(sf), 0, 0.2);
let dur = 1.2 / MouseY(2, 120, 1, 0.2);
let pan = TRand(-1, 1, trigger) * 0.6;
let amp = 1 / 4;
let interp = 4;
TGrains(
	numChannels,
	trigger,
	sf,
	rate,
	center,
	dur,
	pan,
	amp,
	interp
).Splay
```

* * *

See also: GrainFm, Warp1

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/TGrains.html)

Categories: Ugen
