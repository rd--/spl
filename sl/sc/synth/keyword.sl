+ IdentityDictionary {
	AllpassC { :d | AllpassC(d::in ? 0.0, d::maxdelaytime ? 0.2, d::delaytime ? 0.2, d::decaytime ? 1.0) }
	AllpassL { :d | AllpassL(d::in ? 0.0, d::maxdelaytime ? 0.2, d::delaytime ? 0.2, d::decaytime ? 1.0) }
	AllpassN { :d | AllpassN(d::in ? 0.0, d::maxdelaytime ? 0.2, d::delaytime ? 0.2, d::decaytime ? 1.0) }
	Bpf { :d | Bpf(d::in ? 0.0, d::freq ? 440.0, d::rq ? 1.0) }
	Brf { :d | Brf(d::in ? 0.0, d::freq ? 440.0, d::rq ? 1.0) }
	Balance2 { :d | Balance2(d::left ? 0.0, d::right ? 0.0, d::pos ? 0.0, d::level ? 1.0) }
	Blip { :d | Blip(d::freq ? 440.0, d::numharm ? 200.0) }
	CombC { :d | CombC(d::in ? 0.0, d::maxdelaytime ? 0.2, d::delaytime ? 0.2, d::decaytime ? 1.0) }
	CombL { :d | CombL(d::in ? 0.0, d::maxdelaytime ? 0.2, d::delaytime ? 0.2, d::decaytime ? 1.0) }
	CombN { :d | CombN(d::in ? 0.0, d::maxdelaytime ? 0.2, d::delaytime ? 0.2, d::decaytime ? 1.0) }
	DegreeToKey { :d | DegreeToKey(d::bufnum ? 0.0, d::in ? 0.0, d::octave ? 12.0) }
	DelayC { :d | DelayC(d::in ? 0.0, d::maxdelaytime ? 0.2, d::delaytime ? 0.2) }
	DelayL { :d | DelayL(d::in ? 0.0, d::maxdelaytime ? 0.2, d::delaytime ? 0.2) }
	DelayN { :d | DelayN(d::in ? 0.0, d::maxdelaytime ? 0.2, d::delaytime ? 0.2) }
	EnvGen { :d | EnvGen(d::gate ? 1.0, d::levelScale ? 1.0, d::levelBias ? 0.0, d::timeScale ? 1.0, d::doneAction ? 0.0, d::envelope ? 0.0) }
	ExpRand { :d | ExpRand(d::lo ? 0.01, d::hi ? 1.0) }
	Fos { :d | Fos(d::in ? 0.0, d::a0 ? 0.0, d::a1 ? 0.0, d::b1 ? 0.0) }
	FSinOsc { :d | FSinOsc(d::freq ? 440.0, d::iphase ? 0.0) }
	Fold { :d | Fold(d::in ? 0.0, d::lo ? 0.0, d::hi ? 1.0) }
	Formant { :d | Formant(d::fundfreq ? 440.0, d::formfreq ? 1760.0, d::bwfreq ? 880.0) }
	Formlet { :d | Formlet(d::in ? 0.0, d::freq ? 440.0, d::attacktime ? 1.0, d::decaytime ? 1.0) }
	FreeVerb { :d | FreeVerb(d::in ? 0.0, d::mix ? 0.33, d::room ? 0.5, d::damp ? 0.5) }
	FreeVerb2 { :d | FreeVerb2(d::in ? 0.0, d::in2 ? 0.0, d::mix ? 0.33, d::room ? 0.5, d::damp ? 0.5) }
	FreqShift { :d | FreqShift(d::in ? 0.0, d::freq ? 0.0, d::phase ? 0.0) }
	GVerb { :d | GVerb(d::in ? 0.0, d::roomsize ? 10.0, d::revtime ? 3.0, d::damping ? 0.5, d::inputbw ? 0.5, d::spread ? 15.0, d::drylevel ? 1.0, d::earlyreflevel ? 0.7, d::taillevel ? 0.5, d::maxroomsize ? 300.0) }
	Gate { :d | Gate(d::in ? 0.0, d::trig ? 0.0) }
	Gendy1 { :d | Gendy1(d::ampdist ? 1.0, d::durdist ? 1.0, d::adparam ? 1.0, d::ddparam ? 1.0, d::minfreq ? 440.0, d::maxfreq ? 660.0, d::ampscale ? 0.5, d::durscale ? 0.5, d::initCPs ? 12.0, d::knum ? 0.0) }
	Gendy2 { :d | Gendy2(d::ampdist ? 1.0, d::durdist ? 1.0, d::adparam ? 1.0, d::ddparam ? 1.0, d::minfreq ? 440.0, d::maxfreq ? 660.0, d::ampscale ? 0.5, d::durscale ? 0.5, d::initCPs ? 12.0, d::knum ? 0.0, d::a ? 1.17, d::c ? 0.31) }
	Gendy3 { :d | Gendy3(d::ampdist ? 1.0, d::durdist ? 1.0, d::adparam ? 1.0, d::ddparam ? 1.0, d::freq ? 440.0, d::ampscale ? 0.5, d::durscale ? 0.5, d::initCPs ? 12.0, d::knum ? 0.0) }
	GrainBuf { :d | GrainBuf(d::numChan ? 1.0, d::trigger ? 0.0, d::dur ? 1.0, d::sndbuf ? 0.0, d::rate ? 1.0, d::pos ? 0.0, d::interp ? 2.0, d::pan ? 0.0, d::envbufnum ? -1.0, d::maxGrains ? 512.0) }
	GrainFm { :d | GrainFm(d::numChan ? 1.0, d::trigger ? 0.0, d::dur ? 1.0, d::carfreq ? 440.0, d::modfreq ? 200.0, d::index ? 1.0, d::pan ? 0.0, d::envbufnum ? -1.0, d::maxGrains ? 512.0) }
	GrainIn { :d | GrainIn(d::numChan ? 1.0, d::trigger ? 0.0, d::dur ? 1.0, d::in ? 0.0, d::pan ? 0.0, d::envbufnum ? -1.0, d::maxGrains ? 512.0) }
	GrainSin { :d | GrainSin(d::numChan ? 1.0, d::trigger ? 0.0, d::dur ? 1.0, d::freq ? 440.0, d::pan ? 0.0, d::envbufnum ? -1.0, d::maxGrains ? 512.0) }
	Hpf { :d | Hpf(d::in ? 0.0, d::freq ? 440.0) }
	IRand { :d | IRand(d::lo ? 0.0, d::hi ? 127.0) }
	Impulse { :d | Impulse(d::freq ? 440.0, d::phase ? 0.0) }
	LfCub { :d | LfCub(d::freq ? 440.0, d::iphase ? 0.0) }
	LfPar { :d | LfPar(d::freq ? 440.0, d::iphase ? 0.0) }
	LfPulse { :d | LfPulse(d::freq ? 440.0, d::iphase ? 0.0, d::width ? 0.5) }
	LfSaw { :d | LfSaw(d::freq ? 440.0, d::iphase ? 0.0) }
	LfTri { :d | LfTri(d::freq ? 440.0, d::iphase ? 0.0) }
	Lpf { :d | Lpf(d::in ? 0.0, d::freq ? 440.0) }
	Lag { :d | Lag(d::in ? 0.0, d::lagTime ? 0.1) }
	Lag2 { :d | Lag2(d::in ? 0.0, d::lagTime ? 0.1) }
	Lag2Ud { :d | Lag2Ud(d::in ? 0.0, d::lagTimeU ? 0.1, d::lagTimeD ? 0.1) }
	Lag3 { :d | Lag3(d::in ? 0.0, d::lagTime ? 0.1) }
	Lag3Ud { :d | Lag3Ud(d::in ? 0.0, d::lagTimeU ? 0.1, d::lagTimeD ? 0.1) }
	LagIn { :d | LagIn(d::numChan ? 1.0, d::bus ? 0.0, d::lag ? 0.1) }
	LagUd { :d | LagUd(d::in ? 0.0, d::lagTimeU ? 0.1, d::lagTimeD ? 0.1) }
	LeakDc { :d | LeakDc(d::in ? 0.0, d::coef ? 0.995) }
	LinExp { :d | LinExp(d::in ? 0.0, d::srclo ? 0.0, d::srchi ? 1.0, d::dstlo ? 1.0, d::dsthi ? 2.0) }
	LinPan2 { :d | LinPan2(d::in ? 0.0, d::pos ? 0.0, d::level ? 1.0) }
	LinRand { :d | LinRand(d::lo ? 0.0, d::hi ? 1.0, d::minmax ? 0.0) }
	LinXFade2 { :d | LinXFade2(d::inA ? 0.0, d::inB ? 0.0, d::pan ? 0.0) }
	Line { :d | Line(d::start ? 0.0, d::end ? 1.0, d::dur ? 1.0, d::doneAction ? 0.0) }
	Linen { :d | Linen(d::gate ? 1.0, d::attackTime ? 0.01, d::susLevel ? 1.0, d::releaseTime ? 1.0, d::doneAction ? 0.0) }
	LocalBuf { :d | LocalBuf(d::numChannels ? 1.0, d::numFrames ? 1.0) }
	LocalIn { :d | LocalIn(d::numChan ? 1.0, d::default ? 0.0) }
	LocalOut { :d | LocalOut(d::channelsArray ? 0.0) }
	MoogFf { :d | MoogFf(d::in ? 0.0, d::freq ? 100.0, d::gain ? 2.0, d::reset ? 0.0) }
	MouseButton { :d | MouseButton(d::minval ? 0.0, d::maxval ? 1.0, d::lag ? 0.2) }
	MouseX { :d | MouseX(d::minval ? 0.0, d::maxval ? 1.0, d::warp ? 0.0, d::lag ? 0.2) }
	MouseY { :d | MouseY(d::minval ? 0.0, d::maxval ? 1.0, d::warp ? 0.0, d::lag ? 0.2) }
	NRand { :d | NRand(d::lo ? 0.0, d::hi ? 1.0, d::n ? 0.0) }
	Osc { :d | Osc(d::bufnum ? 0.0, d::freq ? 440.0, d::phase ? 0.0) }
	OscN { :d | OscN(d::bufnum ? 0.0, d::freq ? 440.0, d::phase ? 0.0) }
	Out { :d | Out(d::bus ? 0.0, d::channelsArray ? 0.0) }
	Pan2 { :d | Pan2(d::in ? 0.0, d::pos ? 0.0, d::level ? 1.0) }
	Pan4 { :d | Pan4(d::in ? 0.0, d::xpos ? 0.0, d::ypos ? 0.0, d::level ? 1.0) }
	PanAz { :d | PanAz(d::numChan ? 1.0, d::in ? 0.0, d::pos ? 0.0, d::level ? 1.0, d::width ? 2.0, d::orientation ? 0.5) }
	Phasor { :d | Phasor(d::trig ? 0.0, d::rate ? 1.0, d::start ? 0.0, d::end ? 1.0, d::resetPos ? 0.0) }
	Pitch { :d | Pitch(d::in ? 0.0, d::initFreq ? 440.0, d::minFreq ? 60.0, d::maxFreq ? 4000.0, d::execFreq ? 100.0, d::maxBinsPerOctave ? 16.0, d::median ? 1.0, d::ampThreshold ? 0.01, d::peakThreshold ? 0.5, d::downSample ? 1.0, d::clar ? 0.0) }
	PitchShift { :d | PitchShift(d::in ? 0.0, d::windowSize ? 0.2, d::pitchRatio ? 1.0, d::pitchDispersion ? 0.0, d::timeDispersion ? 0.0) }
	Pluck { :d | Pluck(d::in ? 0.0, d::trig ? 1.0, d::maxdelaytime ? 0.2, d::delaytime ? 0.2, d::decaytime ? 1.0, d::coef ? 0.5) }
	Pulse { :d | Pulse(d::freq ? 440.0, d::width ? 0.5) }
	PulseCount { :d | PulseCount(d::trig ? 0.0, d::reset ? 0.0) }
	PulseDivider { :d | PulseDivider(d::trig ? 0.0, d::div ? 2.0, d::start ? 0.0) }
	Rhpf { :d | Rhpf(d::in ? 0.0, d::freq ? 440.0, d::rq ? 1.0) }
	Rlpf { :d | Rlpf(d::in ? 0.0, d::freq ? 440.0, d::rq ? 1.0) }
	Ramp { :d | Ramp(d::in ? 0.0, d::lagTime ? 0.1) }
	Rand { :d | Rand(d::lo ? 0.0, d::hi ? 1.0) }
	Resonz { :d | Resonz(d::in ? 0.0, d::freq ? 440.0, d::bwr ? 1.0) }
	Ringz { :d | Ringz(d::in ? 0.0, d::freq ? 440.0, d::decaytime ? 1.0) }
	Rotate2 { :d | Rotate2(d::x ? 0.0, d::y ? 0.0, d::pos ? 0.0) }
	Saw { :d | Saw(d::freq ? 440.0) }
	Schmidt { :d | Schmidt(d::in ? 0.0, d::lo ? 0.0, d::hi ? 1.0) }
	Select { :d | Select(d::which ? 0.0, d::array ? 0.0) }
	SetResetFf { :d | SetResetFf(d::trig ? 0.0, d::reset ? 0.0) }
	Shaper { :d | Shaper(d::bufnum ? 0.0, d::in ? 0.0) }
	SinOsc { :d | SinOsc(d::freq ? 440.0, d::phase ? 0.0) }
	SinOscFb { :d | SinOscFb(d::freq ? 440.0, d::feedback ? 0.0) }
	Slew { :d | Slew(d::in ? 0.0, d::up ? 1.0, d::dn ? 1.0) }
	Slope { :d | Slope(d::in ? 0.0) }
	Stepper { :d | Stepper(d::trig ? 0.0, d::reset ? 0.0, d::min ? 0.0, d::max ? 7.0, d::step ? 1.0, d::resetval ? 0.0) }
	Sweep { :d | Sweep(d::trig ? 0.0, d::rate ? 1.0) }
	SyncSaw { :d | SyncSaw(d::syncFreq ? 440.0, d::sawFreq ? 440.0) }
	TExpRand { :d | TExpRand(d::lo ? 0.01, d::hi ? 1.0, d::trig ? 0.0) }
	TGrains { :d | TGrains(d::numChan ? 1.0, d::trigger ? 0.0, d::bufnum ? 0.0, d::rate ? 1.0, d::centerPos ? 0.0, d::dur ? 0.1, d::pan ? 0.0, d::amp ? 0.1, d::interp ? 4.0) }
	TiRand { :d | TiRand(d::lo ? 0.0, d::hi ? 127.0, d::trig ? 0.0) }
	TRand { :d | TRand(d::lo ? 0.0, d::hi ? 1.0, d::trig ? 0.0) }
	Timer { :d | Timer(d::trig ? 0.0) }
	ToggleFf { :d | ToggleFf(d::trig ? 0.0) }
	Trig { :d | Trig(d::in ? 0.0, d::dur ? 0.1) }
	Trig1 { :d | Trig1(d::in ? 0.0, d::dur ? 0.1) }
	TwoPole { :d | TwoPole(d::in ? 0.0, d::freq ? 440.0, d::radius ? 0.8) }
	TwoZero { :d | TwoZero(d::in ? 0.0, d::freq ? 440.0, d::radius ? 0.8) }
	VOsc { :d | VOsc(d::bufpos ? 0.0, d::freq ? 440.0, d::phase ? 0.0) }
	VOsc3 { :d | VOsc3(d::bufpos ? 0.0, d::freq1 ? 110.0, d::freq2 ? 220.0, d::freq3 ? 440.0) }
	VarLag { :d | VarLag(d::in ? 0.0, d::time ? 0.1, d::curvature ? 0.0, d::warp ? 5.0, d::start ? 0.0) }
	VarSaw { :d | VarSaw(d::freq ? 440.0, d::iphase ? 0.0, d::width ? 0.5) }
	Vibrato { :d | Vibrato(d::freq ? 440.0, d::rate ? 6.0, d::depth ? 0.02, d::delay ? 0.0, d::onset ? 0.0, d::rateVariation ? 0.04, d::depthVariation ? 0.1, d::iphase ? 0.0, d::trig ? 0.0) }
	Warp1 { :d | Warp1(d::numChan ? 1.0, d::bufnum ? 0.0, d::pointer ? 0.0, d::freqScale ? 1.0, d::windowSize ? 0.2, d::envbufnum ? -1.0, d::overlaps ? 8.0, d::windowRandRatio ? 0.0, d::interp ? 1.0) }
	Wrap { :d | Wrap(d::in ? 0.0, d::lo ? 0.0, d::hi ? 1.0) }
	XFade2 { :d | XFade2(d::inA ? 0.0, d::inB ? 0.0, d::pan ? 0.0, d::level ? 1.0) }
	XLine { :d | XLine(d::start ? 1.0, d::end ? 2.0, d::dur ? 1.0, d::doneAction ? 0.0) }
}

+ IdentityDictionary {
	DmdOn { :d | DmdOn(d::trig ? 0, d::reset ? 0, d::demandUGens) }
	Env { :d | Env(d::levels, d::times, d::curves, d::releaseNode ? nil, d::loopNode ? nil, d::offset ? 0) }
	MiBraids { :d | MiBraids(d::pitch ? 60, d::timbre ? 0.5, d::color ? 0.5, d::model ? 0, d::trig ? 0, d::resamp ? 0, d::decim ? 0, d::bits ? 0, d::ws ? 0) }
	Ln { :d | Ln(d::start ? 0, d::end ? 1, d::dur ? 1) }
	Release { :d | Release(d::in, d::attackTime, d::dur, d::releaseTime) }
	Seq { :d | Seq(d::repeats ? inf, d::list) }
	TScramble { :d | TScramble(d::trigger ? 0, d::inputs) }
	TxLine { :d | TxLine(d::start ? 0, d::end ? 1, d::dur ? 10, d::trig ? 0) }
}
