+ Record {
	AllpassC { :d | AllpassC(d::in, d::maxDelayTime, d::delayTime, d::decayTime) }
	AllpassL { :d | AllpassL(d::in, d::maxDelayTime, d::delayTime, d::decayTime) }
	AllpassN { :d | AllpassN(d::in, d::maxDelayTime, d::delayTime, d::decayTime) }
	Bpf { :d | Bpf(d::in, d::freq, d::rq) }
	Brf { :d | Brf(d::in, d::freq, d::rq) }
	Balance2 { :d | Balance2(d::left, d::right, d::pos, d::level) }
	Blip { :d | Blip(d::freq, d::numHarm) }
	CombC { :d | CombC(d::in, d::maxDelayTime, d::delayTime, d::decayTime) }
	CombL { :d | CombL(d::in, d::maxDelayTime, d::delayTime, d::decayTime) }
	CombN { :d | CombN(d::in, d::maxDelayTime, d::delayTime, d::decayTime) }
	Compander { :d | Compander(d::in, d::control, d::thresh, d::slopeBelow, d::slopeAbove, d::clampTime, d::relaxTime) }
	Decay { :d | Decay(d::in, d::decayTime) }
	Decay2 { :d | Decay2(d::in, d::attackTime, d::decayTime) }
	DegreeToKey { :d | DegreeToKey(d::bufNum, d::in, d::octave) }
	DelayC { :d | DelayC(d::in, d::maxDelayTime, d::delayTime) }
	DelayL { :d | DelayL(d::in, d::maxDelayTime, d::delayTime) }
	DelayN { :d | DelayN(d::in, d::maxDelayTime, d::delayTime) }
	Demand { :d | Demand(d::trig, d::reset, d::demandUgens) }
	Dseq { :d | Dseq(d::repeats, d::list) }
	Dust { :d | Dust(d::density) }
	Dust2 { :d | Dust2(d::density) }
	EnvGen { :d | EnvGen(d::gate, d::levelScale, d::levelBias, d::timeScale, d::doneAction, d::envelope) }
	ExpRand { :d | ExpRand(d::lo, d::hi) }
	Fos { :d | Fos(d::in, d::a0, d::a1, d::b1) }
	FSinOsc { :d | FSinOsc(d::freq, d::iphase) }
	Fold { :d | Fold(d::in, d::lo, d::hi) }
	Formant { :d | Formant(d::fundFreq, d::formFreq, d::bwfreq) }
	Formlet { :d | Formlet(d::in, d::freq, d::attackTime, d::decayTime) }
	FreeVerb { :d | FreeVerb(d::in, d::mix, d::room, d::damp) }
	FreeVerb2 { :d | FreeVerb2(d::in, d::in2, d::mix, d::room, d::damp) }
	FreqShift { :d | FreqShift(d::in, d::freq, d::phase) }
	GVerb { :d | GVerb(d::in, d::roomSize, d::revtime, d::damping, d::inputbw, d::spread, d::drylevel, d::earlyreflevel, d::tailLevel, d::maxroomSize) }
	Gate { :d | Gate(d::in, d::trig) }
	Gendy1 { :d | Gendy1(d::ampDist, d::durDist, d::adParam, d::ddParam, d::minFreq, d::maxFreq, d::ampScale, d::durScale, d::initCps, d::kNum) }
	Gendy2 { :d | Gendy2(d::ampDist, d::durDist, d::adParam, d::ddParam, d::minFreq, d::maxFreq, d::ampScale, d::durScale, d::initCps, d::kNum, d::a, d::c) }
	Gendy3 { :d | Gendy3(d::ampDist, d::durDist, d::adParam, d::ddParam, d::freq, d::ampScale, d::durScale, d::initCps, d::kNum) }
	GrainBuf { :d | GrainBuf(d::numChan, d::trigger, d::dur, d::sndBuf, d::rate, d::pos, d::interp, d::pan, d::envBufNum ? -1.0, d::maxGrains) }
	GrainFm { :d | GrainFm(d::numChan, d::trigger, d::dur, d::carFreq, d::modFreq, d::index, d::pan, d::envBufNum ? -1.0, d::maxGrains) }
	GrainIn { :d | GrainIn(d::numChan, d::trigger, d::dur, d::in, d::pan, d::envBufNum ? -1.0, d::maxGrains) }
	GrainSin { :d | GrainSin(d::numChan, d::trigger, d::dur, d::freq, d::pan, d::envBufNum ? -1.0, d::maxGrains) }
	Hpf { :d | Hpf(d::in, d::freq) }
	IRand { :d | IRand(d::lo, d::hi) }
	Impulse { :d | Impulse(d::freq, d::phase) }
	LfCub { :d | LfCub(d::freq, d::iphase) }
	LfGauss { :d | LfGauss(d::duration, d::width, d::iphase, d::loop, d::doneAction) }
	LfNoise0 { :d | LfNoise0(d::freq) }
	LfNoise1 { :d | LfNoise1(d::freq) }
	LfNoise2 { :d | LfNoise2(d::freq) }
	LfPar { :d | LfPar(d::freq, d::iphase) }
	LfPulse { :d | LfPulse(d::freq, d::iphase, d::width) }
	LfSaw { :d | LfSaw(d::freq, d::iphase) }
	LfTri { :d | LfTri(d::freq, d::iphase) }
	Lpf { :d | Lpf(d::in, d::freq) }
	Lag { :d | Lag(d::in, d::lagTime) }
	Lag2 { :d | Lag2(d::in, d::lagTime) }
	Lag2Ud { :d | Lag2Ud(d::in, d::lagTimeU, d::lagTimeD) }
	Lag3 { :d | Lag3(d::in, d::lagTime) }
	Lag3Ud { :d | Lag3Ud(d::in, d::lagTimeU, d::lagTimeD) }
	LagIn { :d | LagIn(d::numChan, d::bus, d::lag) }
	LagUd { :d | LagUd(d::in, d::lagTimeU, d::lagTimeD) }
	Latch { :d | Latch(d::in, d::trig) }
	LeakDc { :d | LeakDc(d::in, d::coef) }
	Line { :d | Line(d::start, d::end, d::dur) }
	LinExp { :d | LinExp(d::in, d::srcLo, d::srcHi, d::dstLo, d::dstHi) }
	LinPan2 { :d | LinPan2(d::in, d::pos, d::level) }
	LinRand { :d | LinRand(d::lo, d::hi, d::minmax) }
	LinXFade2 { :d | LinXFade2(d::inA, d::inB, d::pan) }
	Linen { :d | Linen(d::gate, d::attackTime, d::susLevel, d::releaseTime, d::doneAction) }
	LocalBuf { :d | LocalBuf(d::numChannels, d::numFrames) }
	LocalIn { :d | LocalIn(d::numChan, d::default) }
	LocalOut { :d | LocalOut(d::channelsList) }
	MoogFf { :d | MoogFf(d::in, d::freq, d::gain, d::reset) }
	MouseButton { :d | MouseButton(d::minVal, d::maxVal, d::lag) }
	MouseX { :d | MouseX(d::minVal, d::maxVal, d::warp, d::lag) }
	MouseY { :d | MouseY(d::minVal, d::maxVal, d::warp, d::lag) }
	MVerb { :d | MVerb(d::in1, d::in2, d::dampingFreq, d::density, d::bandwidthFreq, d::decay, d::preDelay, d::size, d::gain, d::mix, d::earlyMix) }
	NRand { :d | NRand(d::lo, d::hi, d::n) }
	Osc { :d | Osc(d::bufNum, d::freq, d::phase) }
	OscN { :d | OscN(d::bufNum, d::freq, d::phase) }
	Out { :d | Out(d::bus, d::channelsList) }
	Pan2 { :d | Pan2(d::in, d::pos, d::level) }
	Pan4 { :d | Pan4(d::in, d::xpos, d::ypos, d::level) }
	PanAz { :d | PanAz(d::numChan, d::in, d::pos, d::level, d::width, d::orientation) }
	Phasor { :d | Phasor(d::trig, d::rate, d::start, d::end, d::resetPos) }
	Pitch { :d | Pitch(d::in, d::initFreq, d::minFreq, d::maxFreq, d::execFreq, d::maxBinsPerOctave, d::median, d::ampThreshold, d::peakThreshold, d::downSample, d::clar) }
	PitchShift { :d | PitchShift(d::in, d::windowSize, d::pitchRatio, d::pitchDispersion, d::timeDispersion) }
	Pluck { :d | Pluck(d::in, d::trig, d::maxDelayTime, d::delayTime, d::decayTime, d::coef) }
	Pulse { :d | Pulse(d::freq, d::width) }
	PulseCount { :d | PulseCount(d::trig, d::reset) }
	PulseDivider { :d | PulseDivider(d::trig, d::div, d::start) }
	Rhpf { :d | Rhpf(d::in, d::freq, d::rq) }
	Rlpf { :d | Rlpf(d::in, d::freq, d::rq) }
	Ramp { :d | Ramp(d::in, d::lagTime) }
	Rand { :d | Rand(d::lo, d::hi) }
	Resonz { :d | Resonz(d::in, d::freq, d::bwr) }
	Ringz { :d | Ringz(d::in, d::freq, d::decayTime) }
	Rotate2 { :d | Rotate2(d::x, d::y, d::pos) }
	Saw { :d | Saw(d::freq) }
	Schmidt { :d | Schmidt(d::in, d::lo, d::hi) }
	Select { :d | Select(d::which, d::array) }
	SetResetFf { :d | SetResetFf(d::trig, d::reset) }
	Shaper { :d | Shaper(d::bufNum, d::in) }
	SinOsc { :d | SinOsc(d::freq, d::phase) }
	SinOscFb { :d | SinOscFb(d::freq, d::feedback) }
	Slew { :d | Slew(d::in, d::up, d::dn) }
	Slope { :d | Slope(d::in) }
	Stepper { :d | Stepper(d::trig, d::reset, d::min, d::max, d::step, d::resetval) }
	Sweep { :d | Sweep(d::trig, d::rate) }
	SyncSaw { :d | SyncSaw(d::syncFreq, d::sawFreq) }
	TExpRand { :d | TExpRand(d::lo, d::hi, d::trig) }
	TGrains { :d | TGrains(d::numChan, d::trigger, d::bufNum, d::rate, d::centerPos, d::dur, d::pan, d::amp, d::interp) }
	TiRand { :d | TiRand(d::lo, d::hi, d::trig) }
	TRand { :d | TRand(d::lo, d::hi, d::trig) }
	Timer { :d | Timer(d::trig) }
	ToggleFf { :d | ToggleFf(d::trig) }
	Trig { :d | Trig(d::in, d::dur) }
	Trig1 { :d | Trig1(d::in, d::dur) }
	TwoPole { :d | TwoPole(d::in, d::freq, d::radius) }
	TwoZero { :d | TwoZero(d::in, d::freq, d::radius) }
	VOsc { :d | VOsc(d::bufPos, d::freq, d::phase) }
	VOsc3 { :d | VOsc3(d::bufPos, d::freq1, d::freq2, d::freq3) }
	VarLag { :d | VarLag(d::in, d::time, d::curvature, d::warp, d::start) }
	VarSaw { :d | VarSaw(d::freq, d::iphase, d::width) }
	Vibrato { :d | Vibrato(d::freq, d::rate, d::depth, d::delay, d::onset, d::rateVariation, d::depthVariation, d::iphase, d::trig) }
	Warp1 { :d | Warp1(d::numChan, d::bufNum, d::pointer, d::freqScale, d::windowSize, d::envBufNum ? -1.0, d::overlaps, d::windowRandRatio, d::interp) }
	Wrap { :d | Wrap(d::in, d::lo, d::hi) }
	XFade2 { :d | XFade2(d::inA, d::inB, d::pan, d::level) }
}

+ Record {
	Env { :d | Env(d::levels, d::times, d::curves, d::releaseNode, d::loopNode, d::offset) }
	EqPan2 { :d | EqPan2(d::in, d::pos) }
	MembraneCircle { :d | MembraneCircle(d::excitation, d::tension, d::loss) }
	MiBraids { :d | MiBraids(d::pitch, d::timbre, d::color, d::model, d::trig, d::resamp, d::decim, d::bits, d::ws) }
	MiClouds { :d | MiClouds(d::pit, d::pos, d::size, d::dens, d::tex, d::dryWet, d::inGain, d::spread, d::rvb, d::fb, d::freeze, d::mode, d::lofi, d::trig, d::inputList) }
	MiRings { :d | MiRings(d::in, d::trig, d::pit, d::struct, d::bright, d::damp, d::pos, d::model, d::poly, d::internExciter, d::easterEgg, d::bypass) }
	Ln { :d | Ln(d::start, d::end, d::dur) }
	Perc { :d | Perc(d::trig, d::attackTime, d::releaseTime, d::curve) }
	Release { :d | Release(d::in, d::attackTime, d::sustainTime, d::releaseTime) }
	Seq { :d | Seq(d::repeats ? inf, d::list) }
	TScramble { :d | TScramble(d::trigger, d::inputs) }
	TxLine { :d | TxLine(d::start, d::end, d::dur, d::trig) }
	Voicer { :d | Voicer(d::part, d::numVoices, d::voiceFunc) }
}
