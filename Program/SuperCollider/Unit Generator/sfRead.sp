/* sfRead ; phasor as phase input ; requires=SfAcquire */
let sf = sfAcquireStereo('PianoC5');
let tr = impulse(1 / sfDuration(sf), 0);
let ph = phasor(tr, sfRateScale(sf), 0, sfFrameCount(sf), 0);
sfRead(sf, ph, 0, 2)

/* sfRead ; phasor as phase input ; piano */
let sf = sfAcquireStereo('PianoC5');
{
	let tr = impulse(2 ^ rand(1, 2) / sfDuration(sf), 0).kr;
	let mnn = tiRand(-2, 0, tr) * 12 + tChoose(tr, [-3, 0, 2, 5, 7]);
	let rt = mnn.midiRatio * sfRateScale(sf);
	let ph = phasor(tr, rt, 0, sfFrameCount(sf), 0);
	sfRead(sf, ph, 0, 2)
} !> 6 / 4

/* sfRead ; phasor as phase input ; harp */
let sf = sfAcquireStereo('HarpA4');
{
	let tr = impulse(2 ^ rand(1, 3) / (sfDuration(sf) * 4), 0).kr;
	let mnn = tiRand(-2, 0, tr) * 12 + tChoose(tr, [0, 2.1, 4.9, 7, 9.2]);
	let rt = mnn.midiRatio * sfRateScale(sf);
	let ph = phasor(tr, rt, 0, sfFrameCount(sf), 0);
	sfRead(sf, ph, 0, 2)
} !> 6 / 9

/* sfRead ; phasor as phase input ; mono sound file ; multiple voices */
let sf = sfAcquireMono('CrotaleD6');
{
	let tr = impulse(2 ^ rand(1, 3) / sfDuration(sf), 0).kr;
	let mnn = tiRand(-3, 0, tr) * 12 + tChoose(tr, [0, 2.1, 4.9, 7, 9.2]);
	let rt = mnn.midiRatio * sfRateScale(sf);
	let ph = phasor(tr, rt, 0, sfFrameCount(sf), 0);
	sfRead(sf, ph, 0, 2) / 4
} !^ 6
