/* SfRead ; phasor as phase input ; requires=SfAcquire */
let sf = SfAcquireStereo('PianoC5');
let tr = Impulse(1 / SfDuration(sf), 0);
let ph = Phasor(tr, SfRateScale(sf), 0, SfFrameCount(sf), 0);
SfRead(sf, ph, 0, 2)

/* SfRead ; phasor as phase input ; piano */
let sf = SfAcquireStereo('PianoC5');
{
	let tr = Impulse(2 ^ Rand(1, 2) / SfDuration(sf), 0).kr;
	let mnn = TiRand(-2, 0, tr) * 12 + Choose(tr, [-3, 0, 2, 5, 7]);
	let rt = mnn.MidiRatio * SfRateScale(sf);
	let ph = Phasor(tr, rt, 0, SfFrameCount(sf), 0);
	SfRead(sf, ph, 0, 2)
} !> 6 / 4

/* SfRead ; phasor as phase input ; harp */
let sf = SfAcquireStereo('HarpA4');
{
	let tr = Impulse(2 ^ Rand(1, 3) / (SfDuration(sf) * 4), 0).kr;
	let mnn = TiRand(-2, 0, tr) * 12 + Choose(tr, [0, 2.1, 4.9, 7, 9.2]);
	let rt = mnn.MidiRatio * SfRateScale(sf);
	let ph = Phasor(tr, rt, 0, SfFrameCount(sf), 0);
	SfRead(sf, ph, 0, 2)
} !> 6 / 9

/* SfRead ; phasor as phase input ; mono sound file ; multiple voices */
let sf = SfAcquireMono('CrotaleD6');
{
	let tr = Impulse(2 ^ Rand(1, 3) / SfDuration(sf), 0).kr;
	let mnn = TiRand(-3, 0, tr) * 12 + Choose(tr, [0, 2.1, 4.9, 7, 9.2]);
	let rt = mnn.MidiRatio * SfRateScale(sf);
	let ph = Phasor(tr, rt, 0, SfFrameCount(sf), 0);
	SfRead(sf, ph, 0, 2) / 4
} !^ 6
