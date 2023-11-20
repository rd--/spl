# TGrains -- buffer granulator

_TGrains(numChannels, trigger=0, bufnum=0, rate=1, centerPos=0, dur=0.1, pan=0, amp=0.1, interp=4)_

Triggers generate grains from a buffer.
Each grain has a Hanning envelope (_sin^2(x)_ for x from 0 to pi),
and is panned between two channels of multiple outputs.

- numChannels: number of output channels.
- trigger: at each trigger, subsequent arguments are sampled (or demanded) and used as the arguments of a new grain. A trigger occurs when a signal changes from <= 0 to > 0. If the trigger is audio rate then the grains will start with sample accuracy.
- bufnum: the index of the buffer to use. It must be a one channel (mono) buffer.
- rate: 1 is normal, 2 is one octave up, 0.5 is one octave down -1 is backwards normal rate ... etc. Unlike PlayBuf, the rate is multiplied by BufRate, so you need not do that yourself.
- centerPos: the position in the buffer in seconds at which the grain envelope will reach maximum amplitude.
- dur: duration of the grain in seconds.
- pan: a value from -1 to 1. Determines where to pan the output in the same manner as PanAz.
- amp: amplitude of the grain
- interp: 1,2,or 4. Determines whether the grain uses (1) no interpolation, (2) linear interpolation, or (4) cubic interpolation.

Demand sequences for _rate_ and _pan_ inputs, mouse control of _trigger_ rate and _pos_:

	var numChannels = system.scSynth.mainOutputs;
	var triggerRate = MouseY(2, 200, 1, 0.2);
	var trigger = Impulse(triggerRate, 0);
	var sf = SfAcquireMono('floating_1');
	var rate = Dseq(inf, [10, 1, 1, 0.5, 0.5, 0.2, 0.1]);
	var centerPos = MouseX(0, SfDur(sf), 0, 0.2);
	var dur = 4 / triggerRate;
	var pan = Dseq(inf, [-1, -0.9 .. 1]);
	var amp = 1 / 4;
	var interp = 2;
	TGrains(numChannels, trigger, sf, rate, centerPos, dur, pan, amp, interp)

Uniform unary rate, perturb _centerPos_ at clock rate

	var numChannels = system.scSynth.mainOutputs;
	var triggerRate = MouseY(8, 120, 1, 0.2);
	var trigger = Impulse(triggerRate, 0);
	var sf = SfAcquireMono('floating_1');
	var rate = 1;
	var centerPos0 = MouseX(0, SfDur(sf), 0, 0.2);
	var centerPos = centerPos0 + Rand(trigger, 0, 0.01);
	var dur = 12 / triggerRate;
	var pan = WhiteNoise() * 0.6;
	var amp = 1 / 4;
	var interp = 4;
	TGrains(numChannels, trigger, sf, rate, centerPos, dur, pan, amp, interp)

Stochastic clock (_Dust_):

	var numChannels = system.scSynth.mainOutputs;
	var triggerRate = MouseY(8, 120, 1, 0.2);
	var trigger = Dust(triggerRate);
	var sf = SfAcquireMono('floating_1');
	var rate = 1;
	var centerPos0 = MouseX(0, SfDur(sf), 0, 0.2);
	var centerPos = centerPos0 + Rand(trigger, 0, 0.01);
	var dur = 4 / triggerRate;
	var pan = WhiteNoise() * 0.6;
	var amp = 1 / 4;
	var interp = 4;
	TGrains(numChannels, trigger, sf, rate, centerPos, dur, pan, amp, interp)

Mouse control of _centerPos_ and _dur_:

	var numChannels = system.scSynth.mainOutputs;
	var triggerRate = 12;
	var trigger = Impulse(triggerRate, 0);
	var sf = SfAcquireMono('floating_1');
	var rate = 1;
	var centerPos0 = MouseX(0, SfDur(sf), 0, 0.2);
	var centerPos = centerPos0 + Rand(trigger, 0, 0.01);
	var dur = MouseY(0.2, 24, 1, 0.2) / triggerRate;
	var pan = WhiteNoise() * 0.6;
	var amp = 1 / 4;
	var interp = 4;
	TGrains(numChannels, trigger, sf, rate, centerPos, dur, pan, amp, interp)

Stochastic _centerPos_, no external control:

	var numChannels = system.scSynth.mainOutputs;
	var triggerRate = 100;
	var trigger = Impulse(triggerRate, 0);
	var sf = SfAcquireMono('floating_1');
	var rate = 1;
	var centerPos = Integrator(BrownNoise().kr * 0.001, 1);
	var dur = 8 / triggerRate;
	var pan = WhiteNoise().kr * 0.6;
	var amp = 1 / 4;
	var interp = 4;
	TGrains(numChannels, trigger, sf, rate, centerPos, dur, pan, amp, interp)

Stochastic _rate_:

	var numChannels = system.scSynth.mainOutputs;
	var triggerRate = MouseY(1, 400, 1, 0.2);
	var trigger = Impulse(triggerRate, 0);
	var sf = SfAcquireMono('floating_1');
	var rate = 2 ^ (WhiteNoise().kr * 2);
	var centerPos = MouseX(0, SfDur(sf), 0, 0.2);
	var dur = 8 / triggerRate;
	var pan = WhiteNoise() * 0.8;
	var amp = 1 / 4;
	var interp = 4;
	TGrains(numChannels, trigger, sf, rate, centerPos, dur, pan, amp, interp)

Stochastic _rate_, fixed clock rate:

	var numChannels = system.scSynth.mainOutputs;
	var trigger = Impulse(440, 0);
	var sf = SfAcquireMono('floating_1');
	var rate = 1.2 ^ (WhiteNoise() * 3).RoundTo(1);
	var centerPos = MouseX(0, SfDur(sf), 0, 0.2);
	var dur = 1.2 / MouseY(2, 120, 1, 0.2);
	var pan = WhiteNoise() * 0.6;
	var amp = 1 / 4;
	var interp = 4;
	TGrains(numChannels, trigger, sf, rate, centerPos, dur, pan, amp, interp)

* * *

See also: GrainFm, Warp1
