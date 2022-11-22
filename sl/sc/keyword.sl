+ IdentityDictionary {
	BinaryOpUGen { :d | BinaryOpUGen(d::a ? 0.0, d::b ? 0.0) }
	UnaryOpUGen { :d | UnaryOpUGen(d::a ? 0.0) }
	A2K { :d | A2K(d::in ? 0.0) }
	APF { :d | APF(d::in ? 0.0, d::freq ? 440.0, d::radius ? 0.8) }
	AllpassC { :d | AllpassC(d::in ? 0.0, d::maxdelaytime ? 0.2, d::delaytime ? 0.2, d::decaytime ? 1.0) }
	AllpassL { :d | AllpassL(d::in ? 0.0, d::maxdelaytime ? 0.2, d::delaytime ? 0.2, d::decaytime ? 1.0) }
	AllpassN { :d | AllpassN(d::in ? 0.0, d::maxdelaytime ? 0.2, d::delaytime ? 0.2, d::decaytime ? 1.0) }
	AmpComp { :d | AmpComp(d::freq ? 0.0, d::root ? 0.0, d::exp ? 0.3333) }
	AmpCompA { :d | AmpCompA(d::freq ? 1000.0, d::root ? 0.0, d::minAmp ? 0.32, d::rootAmp ? 1.0) }
	Amplitude { :d | Amplitude(d::in ? 0.0, d::attackTime ? 0.01, d::releaseTime ? 0.01) }
	BAllPass { :d | BAllPass(d::in ? 0.0, d::freq ? 1200.0, d::rq ? 1.0) }
	BBandPass { :d | BBandPass(d::in ? 0.0, d::freq ? 1200.0, d::bw ? 1.0) }
	BBandStop { :d | BBandStop(d::in ? 0.0, d::freq ? 1200.0, d::bw ? 1.0) }
	BHiPass { :d | BHiPass(d::in ? 0.0, d::freq ? 1200.0, d::rq ? 1.0) }
	BHiShelf { :d | BHiShelf(d::in ? 0.0, d::freq ? 1200.0, d::rs ? 1.0, d::db ? 0.0) }
	BLowPass { :d | BLowPass(d::in ? 0.0, d::freq ? 1200.0, d::rq ? 1.0) }
	BLowShelf { :d | BLowShelf(d::in ? 0.0, d::freq ? 1200.0, d::rs ? 1.0, d::db ? 0.0) }
	BPF { :d | BPF(d::in ? 0.0, d::freq ? 440.0, d::rq ? 1.0) }
	BPZ2 { :d | BPZ2(d::in ? 0.0) }
	BPeakEQ { :d | BPeakEQ(d::in ? 0.0, d::freq ? 1200.0, d::rq ? 1.0, d::db ? 0.0) }
	BRF { :d | BRF(d::in ? 0.0, d::freq ? 440.0, d::rq ? 1.0) }
	BRZ2 { :d | BRZ2(d::in ? 0.0) }
	Balance2 { :d | Balance2(d::left ? 0.0, d::right ? 0.0, d::pos ? 0.0, d::level ? 1.0) }
	Ball { :d | Ball(d::in ? 0.0, d::g ? 1.0, d::damp ? 0.0, d::friction ? 0.01) }
	BeatTrack { :d | BeatTrack(d::chain ? 0.0, d::lock ? 0.0) }
	BeatTrack2 { :d | BeatTrack2(d::busindex ? 0.0, d::numfeatures ? 0.0, d::windowsize ? 2.0, d::phaseaccuracy ? 0.02, d::lock ? 0.0, d::weightingscheme ? 0.0) }
	BiPanB2 { :d | BiPanB2(d::inA ? 0.0, d::inB ? 0.0, d::azimuth ? 0.0, d::gain ? 1.0) }
	Blip { :d | Blip(d::freq ? 440.0, d::numharm ? 200.0) }
	BufAllpassC { :d | BufAllpassC(d::buf ? 0.0, d::in ? 0.0, d::delaytime ? 0.2, d::decaytime ? 1.0) }
	BufAllpassL { :d | BufAllpassL(d::buf ? 0.0, d::in ? 0.0, d::delaytime ? 0.2, d::decaytime ? 1.0) }
	BufAllpassN { :d | BufAllpassN(d::buf ? 0.0, d::in ? 0.0, d::delaytime ? 0.2, d::decaytime ? 1.0) }
	BufChannels { :d | BufChannels(d::bufnum ? 0.0) }
	BufCombC { :d | BufCombC(d::buf ? 0.0, d::in ? 0.0, d::delaytime ? 0.2, d::decaytime ? 1.0) }
	BufCombL { :d | BufCombL(d::buf ? 0.0, d::in ? 0.0, d::delaytime ? 0.2, d::decaytime ? 1.0) }
	BufCombN { :d | BufCombN(d::buf ? 0.0, d::in ? 0.0, d::delaytime ? 0.2, d::decaytime ? 1.0) }
	BufDelayC { :d | BufDelayC(d::buf ? 0.0, d::in ? 0.0, d::delaytime ? 0.2) }
	BufDelayL { :d | BufDelayL(d::buf ? 0.0, d::in ? 0.0, d::delaytime ? 0.2) }
	BufDelayN { :d | BufDelayN(d::buf ? 0.0, d::in ? 0.0, d::delaytime ? 0.2) }
	BufDur { :d | BufDur(d::bufnum ? 0.0) }
	BufFrames { :d | BufFrames(d::bufnum ? 0.0) }
	BufRateScale { :d | BufRateScale(d::bufnum ? 0.0) }
	BufRd { :d | BufRd(d::numChan ? 1.0, d::bufnum ? 0.0, d::phase ? 0.0, d::loop ? 1.0, d::interpolation ? 2.0) }
	BufSampleRate { :d | BufSampleRate(d::bufnum ? 0.0) }
	BufSamples { :d | BufSamples(d::bufnum ? 0.0) }
	BufWr { :d | BufWr(d::bufnum ? 0.0, d::phase ? 0.0, d::loop ? 1.0, d::inputArray ? 0.0) }
	COsc { :d | COsc(d::bufnum ? 0.0, d::freq ? 440.0, d::beats ? 0.5) }
	CheckBadValues { :d | CheckBadValues(d::in ? 0.0, d::id ? 0.0, d::post ? 2.0) }
	ClearBuf { :d | ClearBuf(d::buf ? 0.0) }
	Clip { :d | Clip(d::in ? 0.0, d::lo ? 0.0, d::hi ? 1.0) }
	CoinGate { :d | CoinGate(d::prob ? 0.0, d::in ? 0.0) }
	CombC { :d | CombC(d::in ? 0.0, d::maxdelaytime ? 0.2, d::delaytime ? 0.2, d::decaytime ? 1.0) }
	CombL { :d | CombL(d::in ? 0.0, d::maxdelaytime ? 0.2, d::delaytime ? 0.2, d::decaytime ? 1.0) }
	CombN { :d | CombN(d::in ? 0.0, d::maxdelaytime ? 0.2, d::delaytime ? 0.2, d::decaytime ? 1.0) }
	Compander { :d | Compander(d::in ? 0.0, d::control ? 0.0, d::thresh ? 0.5, d::slopeBelow ? 1.0, d::slopeAbove ? 1.0, d::clampTime ? 0.01, d::relaxTime ? 0.1) }
	CompanderD { :d | CompanderD(d::in ? 0.0, d::thresh ? 0.5, d::slopeBelow ? 1.0, d::slopeAbove ? 1.0, d::clampTime ? 0.01, d::relaxTime ? 0.01) }
	Convolution { :d | Convolution(d::in ? 0.0, d::kernel ? 0.0, d::framesize ? 512.0) }
	Convolution2 { :d | Convolution2(d::in ? 0.0, d::kernel ? 0.0, d::trigger ? 0.0, d::framesize ? 2048.0) }
	Convolution2L { :d | Convolution2L(d::in ? 0.0, d::kernel ? 0.0, d::trigger ? 0.0, d::framesize ? 2048.0, d::crossfade ? 1.0) }
	Convolution3 { :d | Convolution3(d::in ? 0.0, d::kernel ? 0.0, d::trigger ? 0.0, d::framesize ? 2048.0) }
	Crackle { :d | Crackle(d::chaosParam ? 1.5) }
	CuspL { :d | CuspL(d::freq ? 22050.0, d::a ? 1.0, d::b ? 1.9, d::xi ? 0.0) }
	CuspN { :d | CuspN(d::freq ? 22050.0, d::a ? 1.0, d::b ? 1.9, d::xi ? 0.0) }
	DC { :d | DC(d::in ? 0.0) }
	Dbrown { :d | Dbrown(d::length ? 100000000.0, d::lo ? 0.0, d::hi ? 1.0, d::step ? 0.01) }
	Dbufrd { :d | Dbufrd(d::bufnum ? 0.0, d::phase ? 0.0, d::loop ? 1.0) }
	Dbufwr { :d | Dbufwr(d::bufnum ? 0.0, d::phase ? 0.0, d::input ? 0.0, d::loop ? 1.0) }
	Dconst { :d | Dconst(d::sum ? 0.0, d::in ? 0.0, d::tolerance ? 0.001) }
	Decay { :d | Decay(d::in ? 0.0, d::decayTime ? 1.0) }
	Decay2 { :d | Decay2(d::in ? 0.0, d::attackTime ? 0.01, d::decayTime ? 1.0) }
	DecodeB2 { :d | DecodeB2(d::numChan ? 1.0, d::w ? 0.0, d::x ? 0.0, d::y ? 0.0, d::orientation ? 0.5) }
	DegreeToKey { :d | DegreeToKey(d::bufnum ? 0.0, d::in ? 0.0, d::octave ? 12.0) }
	DelTapRd { :d | DelTapRd(d::buffer ? 0.0, d::phase ? 0.0, d::delTime ? 0.0, d::interp ? 1.0) }
	DelTapWr { :d | DelTapWr(d::buffer ? 0.0, d::in ? 0.0) }
	Delay1 { :d | Delay1(d::in ? 0.0) }
	Delay2 { :d | Delay2(d::in ? 0.0) }
	DelayC { :d | DelayC(d::in ? 0.0, d::maxdelaytime ? 0.2, d::delaytime ? 0.2) }
	DelayL { :d | DelayL(d::in ? 0.0, d::maxdelaytime ? 0.2, d::delaytime ? 0.2) }
	DelayN { :d | DelayN(d::in ? 0.0, d::maxdelaytime ? 0.2, d::delaytime ? 0.2) }
	Demand { :d | Demand(d::trig ? 0.0, d::reset ? 0.0, d::demandUGens ? 0.0) }
	DemandEnvGen { :d | DemandEnvGen(d::level ? 0.0, d::dur ? 0.0, d::shape ? 1.0, d::curve ? 0.0, d::gate ? 1.0, d::reset ? 1.0, d::levelScale ? 1.0, d::levelBias ? 0.0, d::timeScale ? 1.0, d::doneAction ? 0.0) }
	DetectIndex { :d | DetectIndex(d::bufnum ? 0.0, d::in ? 0.0) }
	DetectSilence { :d | DetectSilence(d::in ? 0.0, d::amp ? 0.0001, d::time ? 0.1, d::doneAction ? 0.0) }
	Dgeom { :d | Dgeom(d::length ? 100000000.0, d::start ? 1.0, d::grow ? 2.0) }
	Dibrown { :d | Dibrown(d::length ? 100000000.0, d::lo ? 0.0, d::hi ? 1.0, d::step ? 0.01) }
	DiskIn { :d | DiskIn(d::numChan ? 1.0, d::bufnum ? 0.0, d::loop ? 0.0) }
	DiskOut { :d | DiskOut(d::bufnum ? 0.0, d::channelsArray ? 0.0) }
	Diwhite { :d | Diwhite(d::length ? 100000000.0, d::lo ? 0.0, d::hi ? 1.0) }
	Done { :d | Done(d::src ? 0.0) }
	Dpoll { :d | Dpoll(d::in ? 0.0, d::label ? 0.0, d::run ? 1.0, d::trigid ? -1.0) }
	Drand { :d | Drand(d::repeats ? 1.0, d::list ? 0.0) }
	Dreset { :d | Dreset(d::in ? 0.0, d::reset ? 0.0) }
	Dseq { :d | Dseq(d::repeats ? 1.0, d::list ? 0.0) }
	Dser { :d | Dser(d::repeats ? 1.0, d::list ? 0.0) }
	Dseries { :d | Dseries(d::length ? 100000000.0, d::start ? 1.0, d::step ? 1.0) }
	Dshuf { :d | Dshuf(d::repeats ? 1.0, d::list ? 0.0) }
	Dstutter { :d | Dstutter(d::n ? 0.0, d::in ? 0.0) }
	Dswitch { :d | Dswitch(d::index ? 0.0, d::list ? 0.0) }
	Dswitch1 { :d | Dswitch1(d::index ? 0.0, d::list ? 0.0) }
	Dunique { :d | Dunique(d::source ? 0.0, d::maxBufferSize ? 1024.0, d::protected ? 1.0) }
	Dust { :d | Dust(d::density ? 0.0) }
	Dust2 { :d | Dust2(d::density ? 0.0) }
	Duty { :d | Duty(d::dur ? 1.0, d::reset ? 0.0, d::doneAction ? 0.0, d::level ? 1.0) }
	Dwhite { :d | Dwhite(d::length ? 100000000.0, d::lo ? 0.0, d::hi ? 1.0) }
	Dwrand { :d | Dwrand(d::repeats ? 1.0, d::weights ? 0.0, d::list ? 0.0) }
	Dxrand { :d | Dxrand(d::repeats ? 1.0, d::list ? 0.0) }
	EnvGen { :d | EnvGen(d::gate ? 1.0, d::levelScale ? 1.0, d::levelBias ? 0.0, d::timeScale ? 1.0, d::doneAction ? 0.0, d::envelope ? 0.0) }
	ExpRand { :d | ExpRand(d::lo ? 0.01, d::hi ? 1.0) }
	FBSineC { :d | FBSineC(d::freq ? 22050.0, d::im ? 1.0, d::fb ? 0.1, d::a ? 1.1, d::c ? 0.5, d::xi ? 0.1, d::yi ? 0.1) }
	FBSineL { :d | FBSineL(d::freq ? 22050.0, d::im ? 1.0, d::fb ? 0.1, d::a ? 1.1, d::c ? 0.5, d::xi ? 0.1, d::yi ? 0.1) }
	FBSineN { :d | FBSineN(d::freq ? 22050.0, d::im ? 1.0, d::fb ? 0.1, d::a ? 1.1, d::c ? 0.5, d::xi ? 0.1, d::yi ? 0.1) }
	FFT { :d | FFT(d::buffer ? 0.0, d::in ? 0.0, d::hop ? 0.5, d::wintype ? 0.0, d::active ? 1.0, d::winsize ? 0.0) }
	FOS { :d | FOS(d::in ? 0.0, d::a0 ? 0.0, d::a1 ? 0.0, d::b1 ? 0.0) }
	FSinOsc { :d | FSinOsc(d::freq ? 440.0, d::iphase ? 0.0) }
	Fold { :d | Fold(d::in ? 0.0, d::lo ? 0.0, d::hi ? 1.0) }
	Formant { :d | Formant(d::fundfreq ? 440.0, d::formfreq ? 1760.0, d::bwfreq ? 880.0) }
	Formlet { :d | Formlet(d::in ? 0.0, d::freq ? 440.0, d::attacktime ? 1.0, d::decaytime ? 1.0) }
	Free { :d | Free(d::trig ? 0.0, d::id ? 0.0) }
	FreeSelf { :d | FreeSelf(d::in ? 0.0) }
	FreeSelfWhenDone { :d | FreeSelfWhenDone(d::src ? 0.0) }
	FreeVerb { :d | FreeVerb(d::in ? 0.0, d::mix ? 0.33, d::room ? 0.5, d::damp ? 0.5) }
	FreeVerb2 { :d | FreeVerb2(d::in ? 0.0, d::in2 ? 0.0, d::mix ? 0.33, d::room ? 0.5, d::damp ? 0.5) }
	FreqShift { :d | FreqShift(d::in ? 0.0, d::freq ? 0.0, d::phase ? 0.0) }
	GVerb { :d | GVerb(d::in ? 0.0, d::roomsize ? 10.0, d::revtime ? 3.0, d::damping ? 0.5, d::inputbw ? 0.5, d::spread ? 15.0, d::drylevel ? 1.0, d::earlyreflevel ? 0.7, d::taillevel ? 0.5, d::maxroomsize ? 300.0) }
	Gate { :d | Gate(d::in ? 0.0, d::trig ? 0.0) }
	GbmanL { :d | GbmanL(d::freq ? 22050.0, d::xi ? 1.2, d::yi ? 2.1) }
	GbmanN { :d | GbmanN(d::freq ? 22050.0, d::xi ? 1.2, d::yi ? 2.1) }
	Gendy1 { :d | Gendy1(d::ampdist ? 1.0, d::durdist ? 1.0, d::adparam ? 1.0, d::ddparam ? 1.0, d::minfreq ? 440.0, d::maxfreq ? 660.0, d::ampscale ? 0.5, d::durscale ? 0.5, d::initCPs ? 12.0, d::knum ? 0.0) }
	Gendy2 { :d | Gendy2(d::ampdist ? 1.0, d::durdist ? 1.0, d::adparam ? 1.0, d::ddparam ? 1.0, d::minfreq ? 440.0, d::maxfreq ? 660.0, d::ampscale ? 0.5, d::durscale ? 0.5, d::initCPs ? 12.0, d::knum ? 0.0, d::a ? 1.17, d::c ? 0.31) }
	Gendy3 { :d | Gendy3(d::ampdist ? 1.0, d::durdist ? 1.0, d::adparam ? 1.0, d::ddparam ? 1.0, d::freq ? 440.0, d::ampscale ? 0.5, d::durscale ? 0.5, d::initCPs ? 12.0, d::knum ? 0.0) }
	GrainBuf { :d | GrainBuf(d::numChan ? 1.0, d::trigger ? 0.0, d::dur ? 1.0, d::sndbuf ? 0.0, d::rate ? 1.0, d::pos ? 0.0, d::interp ? 2.0, d::pan ? 0.0, d::envbufnum ? -1.0, d::maxGrains ? 512.0) }
	GrainFM { :d | GrainFM(d::numChan ? 1.0, d::trigger ? 0.0, d::dur ? 1.0, d::carfreq ? 440.0, d::modfreq ? 200.0, d::index ? 1.0, d::pan ? 0.0, d::envbufnum ? -1.0, d::maxGrains ? 512.0) }
	GrainIn { :d | GrainIn(d::numChan ? 1.0, d::trigger ? 0.0, d::dur ? 1.0, d::in ? 0.0, d::pan ? 0.0, d::envbufnum ? -1.0, d::maxGrains ? 512.0) }
	GrainSin { :d | GrainSin(d::numChan ? 1.0, d::trigger ? 0.0, d::dur ? 1.0, d::freq ? 440.0, d::pan ? 0.0, d::envbufnum ? -1.0, d::maxGrains ? 512.0) }
	HPF { :d | HPF(d::in ? 0.0, d::freq ? 440.0) }
	HPZ1 { :d | HPZ1(d::in ? 0.0) }
	HPZ2 { :d | HPZ2(d::in ? 0.0) }
	Hasher { :d | Hasher(d::in ? 0.0) }
	HenonC { :d | HenonC(d::freq ? 22050.0, d::a ? 1.4, d::b ? 0.3, d::x0 ? 0.0, d::x1 ? 0.0) }
	HenonL { :d | HenonL(d::freq ? 22050.0, d::a ? 1.4, d::b ? 0.3, d::x0 ? 0.0, d::x1 ? 0.0) }
	HenonN { :d | HenonN(d::freq ? 22050.0, d::a ? 1.4, d::b ? 0.3, d::x0 ? 0.0, d::x1 ? 0.0) }
	Hilbert { :d | Hilbert(d::in ? 0.0) }
	IEnvGen { :d | IEnvGen(d::index ? 0.0, d::envelope ? 0.0) }
	IFFT { :d | IFFT(d::buffer ? 0.0, d::wintype ? 0.0, d::winsize ? 0.0) }
	IRand { :d | IRand(d::lo ? 0.0, d::hi ? 127.0) }
	Impulse { :d | Impulse(d::freq ? 440.0, d::phase ? 0.0) }
	In { :d | In(d::numChan ? 1.0, d::bus ? 0.0) }
	InFeedback { :d | InFeedback(d::numChan ? 1.0, d::bus ? 0.0) }
	InRange { :d | InRange(d::in ? 0.0, d::lo ? 0.0, d::hi ? 1.0) }
	InRect { :d | InRect(d::x ? 0.0, d::y ? 0.0, d::rect ? 0.0) }
	InTrig { :d | InTrig(d::numChan ? 1.0, d::bus ? 0.0) }
	Index { :d | Index(d::bufnum ? 0.0, d::in ? 0.0) }
	IndexInBetween { :d | IndexInBetween(d::bufnum ? 0.0, d::in ? 0.0) }
	IndexL { :d | IndexL(d::bufnum ? 0.0, d::in ? 0.0) }
	Integrator { :d | Integrator(d::in ? 0.0, d::coef ? 1.0) }
	K2A { :d | K2A(d::in ? 0.0) }
	KeyState { :d | KeyState(d::keycode ? 0.0, d::minval ? 0.0, d::maxval ? 1.0, d::lag ? 0.2) }
	KeyTrack { :d | KeyTrack(d::chain ? 0.0, d::keydecay ? 2.0, d::chromaleak ? 0.5) }
	Klang { :d | Klang(d::freqscale ? 1.0, d::freqoffset ? 0.0, d::specificationsArrayRef ? 0.0) }
	Klank { :d | Klank(d::input ? 0.0, d::freqscale ? 1.0, d::freqoffset ? 0.0, d::decayscale ? 1.0, d::specificationsArrayRef ? 0.0) }
	LFClipNoise { :d | LFClipNoise(d::freq ? 500.0) }
	LFCub { :d | LFCub(d::freq ? 440.0, d::iphase ? 0.0) }
	LFDClipNoise { :d | LFDClipNoise(d::freq ? 500.0) }
	LFDNoise0 { :d | LFDNoise0(d::freq ? 500.0) }
	LFDNoise1 { :d | LFDNoise1(d::freq ? 500.0) }
	LFDNoise3 { :d | LFDNoise3(d::freq ? 500.0) }
	LFGauss { :d | LFGauss(d::duration ? 1.0, d::width ? 0.1, d::iphase ? 0.0, d::loop ? 1.0, d::doneAction ? 0.0) }
	LFNoise0 { :d | LFNoise0(d::freq ? 500.0) }
	LFNoise1 { :d | LFNoise1(d::freq ? 500.0) }
	LFNoise2 { :d | LFNoise2(d::freq ? 500.0) }
	LFPar { :d | LFPar(d::freq ? 440.0, d::iphase ? 0.0) }
	LFPulse { :d | LFPulse(d::freq ? 440.0, d::iphase ? 0.0, d::width ? 0.5) }
	LFSaw { :d | LFSaw(d::freq ? 440.0, d::iphase ? 0.0) }
	LFTri { :d | LFTri(d::freq ? 440.0, d::iphase ? 0.0) }
	LPF { :d | LPF(d::in ? 0.0, d::freq ? 440.0) }
	LPZ1 { :d | LPZ1(d::in ? 0.0) }
	LPZ2 { :d | LPZ2(d::in ? 0.0) }
	Lag { :d | Lag(d::in ? 0.0, d::lagTime ? 0.1) }
	Lag2 { :d | Lag2(d::in ? 0.0, d::lagTime ? 0.1) }
	Lag2UD { :d | Lag2UD(d::in ? 0.0, d::lagTimeU ? 0.1, d::lagTimeD ? 0.1) }
	Lag3 { :d | Lag3(d::in ? 0.0, d::lagTime ? 0.1) }
	Lag3UD { :d | Lag3UD(d::in ? 0.0, d::lagTimeU ? 0.1, d::lagTimeD ? 0.1) }
	LagIn { :d | LagIn(d::numChan ? 1.0, d::bus ? 0.0, d::lag ? 0.1) }
	LagUD { :d | LagUD(d::in ? 0.0, d::lagTimeU ? 0.1, d::lagTimeD ? 0.1) }
	LastValue { :d | LastValue(d::in ? 0.0, d::diff ? 0.01) }
	Latch { :d | Latch(d::in ? 0.0, d::trig ? 0.0) }
	LatoocarfianC { :d | LatoocarfianC(d::freq ? 22050.0, d::a ? 1.0, d::b ? 3.0, d::c ? 0.5, d::d ? 0.5, d::xi ? 0.5, d::yi ? 0.5) }
	LatoocarfianL { :d | LatoocarfianL(d::freq ? 22050.0, d::a ? 1.0, d::b ? 3.0, d::c ? 0.5, d::d ? 0.5, d::xi ? 0.5, d::yi ? 0.5) }
	LatoocarfianN { :d | LatoocarfianN(d::freq ? 22050.0, d::a ? 1.0, d::b ? 3.0, d::c ? 0.5, d::d ? 0.5, d::xi ? 0.5, d::yi ? 0.5) }
	LeakDC { :d | LeakDC(d::in ? 0.0, d::coef ? 0.995) }
	LeastChange { :d | LeastChange(d::a ? 0.0, d::b ? 0.0) }
	Limiter { :d | Limiter(d::in ? 0.0, d::level ? 1.0, d::dur ? 0.01) }
	LinCongC { :d | LinCongC(d::freq ? 22050.0, d::a ? 1.1, d::c ? 0.13, d::m ? 1.0, d::xi ? 0.0) }
	LinCongL { :d | LinCongL(d::freq ? 22050.0, d::a ? 1.1, d::c ? 0.13, d::m ? 1.0, d::xi ? 0.0) }
	LinCongN { :d | LinCongN(d::freq ? 22050.0, d::a ? 1.1, d::c ? 0.13, d::m ? 1.0, d::xi ? 0.0) }
	LinExp { :d | LinExp(d::in ? 0.0, d::srclo ? 0.0, d::srchi ? 1.0, d::dstlo ? 1.0, d::dsthi ? 2.0) }
	LinPan2 { :d | LinPan2(d::in ? 0.0, d::pos ? 0.0, d::level ? 1.0) }
	LinRand { :d | LinRand(d::lo ? 0.0, d::hi ? 1.0, d::minmax ? 0.0) }
	LinXFade2 { :d | LinXFade2(d::inA ? 0.0, d::inB ? 0.0, d::pan ? 0.0) }
	Line { :d | Line(d::start ? 0.0, d::end ? 1.0, d::dur ? 1.0, d::doneAction ? 0.0) }
	Linen { :d | Linen(d::gate ? 1.0, d::attackTime ? 0.01, d::susLevel ? 1.0, d::releaseTime ? 1.0, d::doneAction ? 0.0) }
	LocalBuf { :d | LocalBuf(d::numChannels ? 1.0, d::numFrames ? 1.0) }
	LocalIn { :d | LocalIn(d::numChan ? 1.0, d::default ? 0.0) }
	LocalOut { :d | LocalOut(d::channelsArray ? 0.0) }
	Logistic { :d | Logistic(d::chaosParam ? 3.0, d::freq ? 1000.0, d::init ? 0.5) }
	LorenzL { :d | LorenzL(d::freq ? 22050.0, d::s ? 10.0, d::r ? 28.0, d::b ? 2.667, d::h ? 0.05, d::xi ? 0.1, d::yi ? 0.0, d::zi ? 0.0) }
	Loudness { :d | Loudness(d::chain ? 0.0, d::smask ? 0.25, d::tmask ? 1.0) }
	MFCC { :d | MFCC(d::chain ? 0.0, d::numcoeff ? 13.0) }
	MantissaMask { :d | MantissaMask(d::in ? 0.0, d::bits ? 3.0) }
	Median { :d | Median(d::length ? 3.0, d::in ? 0.0) }
	MidEQ { :d | MidEQ(d::in ? 0.0, d::freq ? 440.0, d::rq ? 1.0, d::db ? 0.0) }
	ModDif { :d | ModDif(d::x ? 0.0, d::y ? 0.0, d::mod ? 1.0) }
	MoogFF { :d | MoogFF(d::in ? 0.0, d::freq ? 100.0, d::gain ? 2.0, d::reset ? 0.0) }
	MostChange { :d | MostChange(d::a ? 0.0, d::b ? 0.0) }
	MouseButton { :d | MouseButton(d::minval ? 0.0, d::maxval ? 1.0, d::lag ? 0.2) }
	MouseX { :d | MouseX(d::minval ? 0.0, d::maxval ? 1.0, d::warp ? 0.0, d::lag ? 0.2) }
	MouseY { :d | MouseY(d::minval ? 0.0, d::maxval ? 1.0, d::warp ? 0.0, d::lag ? 0.2) }
	NRand { :d | NRand(d::lo ? 0.0, d::hi ? 1.0, d::n ? 0.0) }
	Normalizer { :d | Normalizer(d::in ? 0.0, d::level ? 1.0, d::dur ? 0.01) }
	OffsetOut { :d | OffsetOut(d::bus ? 0.0, d::channelsArray ? 0.0) }
	OnePole { :d | OnePole(d::in ? 0.0, d::coef ? 0.5) }
	OneZero { :d | OneZero(d::in ? 0.0, d::coef ? 0.5) }
	Onsets { :d | Onsets(d::chain ? 0.0, d::threshold ? 0.5, d::odftype ? 3.0, d::relaxtime ? 1.0, d::floor ? 0.1, d::mingap ? 10.0, d::medianspan ? 11.0, d::whtype ? 1.0, d::rawodf ? 0.0) }
	Osc { :d | Osc(d::bufnum ? 0.0, d::freq ? 440.0, d::phase ? 0.0) }
	OscN { :d | OscN(d::bufnum ? 0.0, d::freq ? 440.0, d::phase ? 0.0) }
	Out { :d | Out(d::bus ? 0.0, d::channelsArray ? 0.0) }
	PSinGrain { :d | PSinGrain(d::freq ? 440.0, d::dur ? 0.2, d::amp ? 0.1) }
	PV_Add { :d | PV_Add(d::bufferA ? 0.0, d::bufferB ? 0.0) }
	PV_BinScramble { :d | PV_BinScramble(d::buffer ? 0.0, d::wipe ? 0.0, d::width ? 0.2, d::trig ? 0.0) }
	PV_BinShift { :d | PV_BinShift(d::buffer ? 0.0, d::stretch ? 1.0, d::shift ? 0.0, d::interp ? 0.0) }
	PV_BinWipe { :d | PV_BinWipe(d::bufferA ? 0.0, d::bufferB ? 0.0, d::wipe ? 0.0) }
	PV_BrickWall { :d | PV_BrickWall(d::buffer ? 0.0, d::wipe ? 0.0) }
	PV_ConformalMap { :d | PV_ConformalMap(d::buffer ? 0.0, d::areal ? 0.0, d::aimag ? 0.0) }
	PV_Conj { :d | PV_Conj(d::buffer ? 0.0) }
	PV_Copy { :d | PV_Copy(d::bufferA ? 0.0, d::bufferB ? 0.0) }
	PV_CopyPhase { :d | PV_CopyPhase(d::bufferA ? 0.0, d::bufferB ? 0.0) }
	PV_Diffuser { :d | PV_Diffuser(d::buffer ? 0.0, d::trig ? 0.0) }
	PV_Div { :d | PV_Div(d::bufferA ? 0.0, d::bufferB ? 0.0) }
	PV_HainsworthFoote { :d | PV_HainsworthFoote(d::maxSize ? 0.0) }
	PV_JensenAndersen { :d | PV_JensenAndersen(d::maxSize ? 0.0) }
	PV_LocalMax { :d | PV_LocalMax(d::buffer ? 0.0, d::threshold ? 0.0) }
	PV_MagAbove { :d | PV_MagAbove(d::buffer ? 0.0, d::threshold ? 0.0) }
	PV_MagBelow { :d | PV_MagBelow(d::buffer ? 0.0, d::threshold ? 0.0) }
	PV_MagClip { :d | PV_MagClip(d::buffer ? 0.0, d::threshold ? 0.0) }
	PV_MagDiv { :d | PV_MagDiv(d::bufferA ? 0.0, d::bufferB ? 0.0, d::zeroed ? 0.0001) }
	PV_MagFreeze { :d | PV_MagFreeze(d::buffer ? 0.0, d::freeze ? 0.0) }
	PV_MagMul { :d | PV_MagMul(d::bufferA ? 0.0, d::bufferB ? 0.0) }
	PV_MagNoise { :d | PV_MagNoise(d::buffer ? 0.0) }
	PV_MagShift { :d | PV_MagShift(d::buffer ? 0.0, d::stretch ? 1.0, d::shift ? 0.0) }
	PV_MagSmear { :d | PV_MagSmear(d::buffer ? 0.0, d::bins ? 0.0) }
	PV_MagSquared { :d | PV_MagSquared(d::buffer ? 0.0) }
	PV_Max { :d | PV_Max(d::bufferA ? 0.0, d::bufferB ? 0.0) }
	PV_Min { :d | PV_Min(d::bufferA ? 0.0, d::bufferB ? 0.0) }
	PV_Mul { :d | PV_Mul(d::bufferA ? 0.0, d::bufferB ? 0.0) }
	PV_PhaseShift { :d | PV_PhaseShift(d::buffer ? 0.0, d::shift ? 0.0, d::integrate ? 0.0) }
	PV_PhaseShift270 { :d | PV_PhaseShift270(d::buffer ? 0.0) }
	PV_PhaseShift90 { :d | PV_PhaseShift90(d::buffer ? 0.0) }
	PV_RandComb { :d | PV_RandComb(d::buffer ? 0.0, d::wipe ? 0.0, d::trig ? 0.0) }
	PV_RandWipe { :d | PV_RandWipe(d::bufferA ? 0.0, d::bufferB ? 0.0, d::wipe ? 0.0, d::trig ? 0.0) }
	PV_RectComb { :d | PV_RectComb(d::buffer ? 0.0, d::numTeeth ? 0.0, d::phase ? 0.0, d::width ? 0.5) }
	PV_RectComb2 { :d | PV_RectComb2(d::bufferA ? 0.0, d::bufferB ? 0.0, d::numTeeth ? 0.0, d::phase ? 0.0, d::width ? 0.5) }
	Pan2 { :d | Pan2(d::in ? 0.0, d::pos ? 0.0, d::level ? 1.0) }
	Pan4 { :d | Pan4(d::in ? 0.0, d::xpos ? 0.0, d::ypos ? 0.0, d::level ? 1.0) }
	PanAz { :d | PanAz(d::numChan ? 1.0, d::in ? 0.0, d::pos ? 0.0, d::level ? 1.0, d::width ? 2.0, d::orientation ? 0.5) }
	PanB { :d | PanB(d::in ? 0.0, d::azimuth ? 0.0, d::elevation ? 0.0, d::gain ? 1.0) }
	PanB2 { :d | PanB2(d::in ? 0.0, d::azimuth ? 0.0, d::gain ? 1.0) }
	PartConv { :d | PartConv(d::in ? 0.0, d::fftsize ? 0.0, d::irbufnum ? 0.0) }
	Pause { :d | Pause(d::gate ? 0.0, d::id ? 0.0) }
	PauseSelf { :d | PauseSelf(d::in ? 0.0) }
	PauseSelfWhenDone { :d | PauseSelfWhenDone(d::src ? 0.0) }
	Peak { :d | Peak(d::in ? 0.0, d::trig ? 0.0) }
	PeakFollower { :d | PeakFollower(d::in ? 0.0, d::decay ? 0.999) }
	Phasor { :d | Phasor(d::trig ? 0.0, d::rate ? 1.0, d::start ? 0.0, d::end ? 1.0, d::resetPos ? 0.0) }
	Pitch { :d | Pitch(d::in ? 0.0, d::initFreq ? 440.0, d::minFreq ? 60.0, d::maxFreq ? 4000.0, d::execFreq ? 100.0, d::maxBinsPerOctave ? 16.0, d::median ? 1.0, d::ampThreshold ? 0.01, d::peakThreshold ? 0.5, d::downSample ? 1.0, d::clar ? 0.0) }
	PitchShift { :d | PitchShift(d::in ? 0.0, d::windowSize ? 0.2, d::pitchRatio ? 1.0, d::pitchDispersion ? 0.0, d::timeDispersion ? 0.0) }
	PlayBuf { :d | PlayBuf(d::numChan ? 1.0, d::bufnum ? 0.0, d::rate ? 1.0, d::trigger ? 1.0, d::startPos ? 0.0, d::loop ? 0.0, d::doneAction ? 0.0) }
	Pluck { :d | Pluck(d::in ? 0.0, d::trig ? 1.0, d::maxdelaytime ? 0.2, d::delaytime ? 0.2, d::decaytime ? 1.0, d::coef ? 0.5) }
	Poll { :d | Poll(d::trig ? 0.0, d::in ? 0.0, d::trigid ? -1.0, d::label ? 0.0) }
	Pulse { :d | Pulse(d::freq ? 440.0, d::width ? 0.5) }
	PulseCount { :d | PulseCount(d::trig ? 0.0, d::reset ? 0.0) }
	PulseDivider { :d | PulseDivider(d::trig ? 0.0, d::div ? 2.0, d::start ? 0.0) }
	QuadC { :d | QuadC(d::freq ? 22050.0, d::a ? 1.0, d::b ? -1.0, d::c ? -0.75, d::xi ? 0.0) }
	QuadL { :d | QuadL(d::freq ? 22050.0, d::a ? 1.0, d::b ? -1.0, d::c ? -0.75, d::xi ? 0.0) }
	QuadN { :d | QuadN(d::freq ? 22050.0, d::a ? 1.0, d::b ? -1.0, d::c ? -0.75, d::xi ? 0.0) }
	RHPF { :d | RHPF(d::in ? 0.0, d::freq ? 440.0, d::rq ? 1.0) }
	RLPF { :d | RLPF(d::in ? 0.0, d::freq ? 440.0, d::rq ? 1.0) }
	Ramp { :d | Ramp(d::in ? 0.0, d::lagTime ? 0.1) }
	Rand { :d | Rand(d::lo ? 0.0, d::hi ? 1.0) }
	RandID { :d | RandID(d::id ? 0.0) }
	RandSeed { :d | RandSeed(d::trig ? 0.0, d::seed ? 56789.0) }
	RecordBuf { :d | RecordBuf(d::bufnum ? 0.0, d::offset ? 0.0, d::recLevel ? 1.0, d::preLevel ? 0.0, d::run ? 1.0, d::loop ? 1.0, d::trigger ? 1.0, d::doneAction ? 0.0, d::inputArray ? 0.0) }
	ReplaceOut { :d | ReplaceOut(d::bus ? 0.0, d::channelsArray ? 0.0) }
	Resonz { :d | Resonz(d::in ? 0.0, d::freq ? 440.0, d::bwr ? 1.0) }
	Ringz { :d | Ringz(d::in ? 0.0, d::freq ? 440.0, d::decaytime ? 1.0) }
	Rotate2 { :d | Rotate2(d::x ? 0.0, d::y ? 0.0, d::pos ? 0.0) }
	RunningMax { :d | RunningMax(d::in ? 0.0, d::trig ? 0.0) }
	RunningMin { :d | RunningMin(d::in ? 0.0, d::trig ? 0.0) }
	RunningSum { :d | RunningSum(d::in ? 0.0, d::numsamp ? 40.0) }
	SOS { :d | SOS(d::in ? 0.0, d::a0 ? 0.0, d::a1 ? 0.0, d::a2 ? 0.0, d::b1 ? 0.0, d::b2 ? 0.0) }
	Sanitize { :d | Sanitize(d::in ? 0.0, d::replace ? 0.0) }
	Saw { :d | Saw(d::freq ? 440.0) }
	Schmidt { :d | Schmidt(d::in ? 0.0, d::lo ? 0.0, d::hi ? 1.0) }
	Select { :d | Select(d::which ? 0.0, d::array ? 0.0) }
	SendTrig { :d | SendTrig(d::in ? 0.0, d::id ? 0.0, d::value ? 0.0) }
	SetResetFF { :d | SetResetFF(d::trig ? 0.0, d::reset ? 0.0) }
	Shaper { :d | Shaper(d::bufnum ? 0.0, d::in ? 0.0) }
	SinOsc { :d | SinOsc(d::freq ? 440.0, d::phase ? 0.0) }
	SinOscFB { :d | SinOscFB(d::freq ? 440.0, d::feedback ? 0.0) }
	Slew { :d | Slew(d::in ? 0.0, d::up ? 1.0, d::dn ? 1.0) }
	Slope { :d | Slope(d::in ? 0.0) }
	SpecCentroid { :d | SpecCentroid(d::buffer ? 0.0) }
	SpecFlatness { :d | SpecFlatness(d::buffer ? 0.0) }
	SpecPcile { :d | SpecPcile(d::buffer ? 0.0, d::fraction ? 0.5, d::interpolate ? 0.0) }
	Spring { :d | Spring(d::in ? 0.0, d::spring ? 1.0, d::damp ? 0.0) }
	StandardL { :d | StandardL(d::freq ? 22050.0, d::k ? 1.0, d::xi ? 0.5, d::yi ? 0.0) }
	StandardN { :d | StandardN(d::freq ? 22050.0, d::k ? 1.0, d::xi ? 0.5, d::yi ? 0.0) }
	Stepper { :d | Stepper(d::trig ? 0.0, d::reset ? 0.0, d::min ? 0.0, d::max ? 7.0, d::step ? 1.0, d::resetval ? 0.0) }
	StereoConvolution2L { :d | StereoConvolution2L(d::in ? 0.0, d::kernelL ? 0.0, d::kernelR ? 0.0, d::trigger ? 0.0, d::framesize ? 2048.0, d::crossfade ? 1.0) }
	Sum3 { :d | Sum3(d::in0 ? 0.0, d::in1 ? 0.0, d::in2 ? 0.0) }
	Sum4 { :d | Sum4(d::in0 ? 0.0, d::in1 ? 0.0, d::in2 ? 0.0, d::in3 ? 0.0) }
	Sweep { :d | Sweep(d::trig ? 0.0, d::rate ? 1.0) }
	SyncSaw { :d | SyncSaw(d::syncFreq ? 440.0, d::sawFreq ? 440.0) }
	T2A { :d | T2A(d::in ? 0.0, d::offset ? 0.0) }
	T2K { :d | T2K(d::in ? 0.0) }
	TBall { :d | TBall(d::in ? 0.0, d::g ? 10.0, d::damp ? 0.0, d::friction ? 0.01) }
	TDelay { :d | TDelay(d::in ? 0.0, d::dur ? 0.1) }
	TDuty { :d | TDuty(d::dur ? 1.0, d::reset ? 0.0, d::doneAction ? 0.0, d::level ? 1.0, d::gapFirst ? 0.0) }
	TExpRand { :d | TExpRand(d::lo ? 0.01, d::hi ? 1.0, d::trig ? 0.0) }
	TGrains { :d | TGrains(d::numChan ? 1.0, d::trigger ? 0.0, d::bufnum ? 0.0, d::rate ? 1.0, d::centerPos ? 0.0, d::dur ? 0.1, d::pan ? 0.0, d::amp ? 0.1, d::interp ? 4.0) }
	TIRand { :d | TIRand(d::lo ? 0.0, d::hi ? 127.0, d::trig ? 0.0) }
	TRand { :d | TRand(d::lo ? 0.0, d::hi ? 1.0, d::trig ? 0.0) }
	TWindex { :d | TWindex(d::in ? 0.0, d::normalize ? 0.0, d::array ? 0.0) }
	Timer { :d | Timer(d::trig ? 0.0) }
	ToggleFF { :d | ToggleFF(d::trig ? 0.0) }
	Trig { :d | Trig(d::in ? 0.0, d::dur ? 0.1) }
	Trig1 { :d | Trig1(d::in ? 0.0, d::dur ? 0.1) }
	TwoPole { :d | TwoPole(d::in ? 0.0, d::freq ? 440.0, d::radius ? 0.8) }
	TwoZero { :d | TwoZero(d::in ? 0.0, d::freq ? 440.0, d::radius ? 0.8) }
	VDiskIn { :d | VDiskIn(d::numChan ? 1.0, d::bufnum ? 0.0, d::rate ? 1.0, d::loop ? 0.0, d::sendID ? 0.0) }
	VOsc { :d | VOsc(d::bufpos ? 0.0, d::freq ? 440.0, d::phase ? 0.0) }
	VOsc3 { :d | VOsc3(d::bufpos ? 0.0, d::freq1 ? 110.0, d::freq2 ? 220.0, d::freq3 ? 440.0) }
	VarLag { :d | VarLag(d::in ? 0.0, d::time ? 0.1, d::curvature ? 0.0, d::warp ? 5.0, d::start ? 0.0) }
	VarSaw { :d | VarSaw(d::freq ? 440.0, d::iphase ? 0.0, d::width ? 0.5) }
	Vibrato { :d | Vibrato(d::freq ? 440.0, d::rate ? 6.0, d::depth ? 0.02, d::delay ? 0.0, d::onset ? 0.0, d::rateVariation ? 0.04, d::depthVariation ? 0.1, d::iphase ? 0.0, d::trig ? 0.0) }
	Warp1 { :d | Warp1(d::numChan ? 1.0, d::bufnum ? 0.0, d::pointer ? 0.0, d::freqScale ? 1.0, d::windowSize ? 0.2, d::envbufnum ? -1.0, d::overlaps ? 8.0, d::windowRandRatio ? 0.0, d::interp ? 1.0) }
	Wrap { :d | Wrap(d::in ? 0.0, d::lo ? 0.0, d::hi ? 1.0) }
	WrapIndex { :d | WrapIndex(d::bufnum ? 0.0, d::in ? 0.0) }
	XFade2 { :d | XFade2(d::inA ? 0.0, d::inB ? 0.0, d::pan ? 0.0, d::level ? 1.0) }
	XLine { :d | XLine(d::start ? 1.0, d::end ? 2.0, d::dur ? 1.0, d::doneAction ? 0.0) }
	XOut { :d | XOut(d::bus ? 0.0, d::xfade ? 0.0, d::channelsArray ? 0.0) }
	ZeroCrossing { :d | ZeroCrossing(d::in ? 0.0) }
	MaxLocalBufs { :d | MaxLocalBufs(d::count ? 0.0) }
	MulAdd { :d | MulAdd(d::in ? 0.0, d::mul ? 0.0, d::add ? 0.0) }
	SetBuf { :d | SetBuf(d::buf ? 0.0, d::offset ? 0.0, d::length ? 0.0, d::array ? 0.0) }
}
