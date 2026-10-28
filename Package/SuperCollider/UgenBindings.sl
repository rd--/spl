/* Requires: Ugen */

+Void {

	blockSize {
		<primitive: return sc.BlockSize();>
	}

	brownNoise {
		<primitive: return sc.BrownNoise();>
	}

	clipNoise {
		<primitive: return sc.ClipNoise();>
	}

	controlDur {
		<primitive: return sc.ControlDur();>
	}

	controlRate {
		<primitive: return sc.ControlRate();>
	}

	greyNoise {
		<primitive: return sc.GrayNoise();>
	}

	numOutputBuses {
		<primitive: return sc.NumOutputBuses();>
	}

	pinkNoise {
		<primitive: return sc.PinkNoise();>
	}

	radiansPerSample {
		<primitive: return sc.RadiansPerSample();>
	}

	sampleDur {
		<primitive: return sc.SampleDur();>
	}

	sampleRate {
		<primitive: return sc.SampleRate();>
	}

	whiteNoise {
		<primitive: return sc.WhiteNoise();>
	}

}

+[List, Ugen] {

	a2K { :in |
		<primitive: return sc.A2K(_in);>
	}

	allpassC { :in :maxdelaytime :delaytime :decaytime |
		<primitive: return sc.AllpassC(_in, _maxdelaytime, _delaytime, _decaytime);>
	}

	allpassL { :in :maxdelaytime :delaytime :decaytime |
		<primitive: return sc.AllpassL(_in, _maxdelaytime, _delaytime, _decaytime);>
	}

	allpassN { :in :maxdelaytime :delaytime :decaytime |
		<primitive: return sc.AllpassN(_in, _maxdelaytime, _delaytime, _decaytime);>
	}

	amplitude { :in :attackTime :releaseTime |
		<primitive: return sc.Amplitude(_in, _attackTime, _releaseTime);>
	}

	apf { :in :freq :radius |
		<primitive: return sc.Apf(_in, _freq, _radius);>
	}

	bAllPass { :in :freq :rq |
		<primitive: return sc.BAllPass(_in, _freq, _rq);>
	}

	bBandPass { :in :freq :bw |
		<primitive: return sc.BBandPass(_in, _freq, _bw);>
	}

	bBandStop { :in :freq :bw |
		<primitive: return sc.BBandStop(_in, _freq, _bw);>
	}

	bHiPass { :in :freq :rq |
		<primitive: return sc.BHiPass(_in, _freq, _rq);>
	}

	bHiShelf { :in :freq :rs :db |
		<primitive: return sc.BHiShelf(_in, _freq, _rs, _db);>
	}

	bLowPass { :in :freq :rq |
		<primitive: return sc.BLowPass(_in, _freq, _rq);>
	}

	bLowShelf { :in :freq :rs :db |
		<primitive: return sc.BLowShelf(_in, _freq, _rs, _db);>
	}

	bMoog { :in :freq :q :mode :saturation |
		<primitive: return sc.BMoog(_in, _freq, _q, _mode, _saturation);>
	}

	bPeakEq { :in :freq :rq :db |
		<primitive: return sc.BPeakEq(_in, _freq, _rq, _db);>
	}

	balance2 { :left :right :pos :level |
		<primitive: return sc.Balance2(_left, _right, _pos, _level);>
	}

	bfDecode1 { :w :x :y :z :azimuth :elevation :wComp |
		<primitive: return sc.BfDecode1(_w, _x, _y, _z, _azimuth, _elevation, _wComp);>
	}

	bfEncode1 { :input :azimuth :elevation :rho :gain :wComp |
		<primitive: return sc.BfEncode1(_input, _azimuth, _elevation, _rho, _gain, _wComp);>
	}

	bpf { :in :freq :rq |
		<primitive: return sc.Bpf(_in, _freq, _rq);>
	}

	bpz2 { :in |
		<primitive: return sc.Bpz2(_in);>
	}

	brf { :in :freq :rq |
		<primitive: return sc.Brf(_in, _freq, _rq);>
	}

	brz2 { :in |
		<primitive: return sc.Brz2(_in);>
	}

	combC { :in :maxdelaytime :delaytime :decaytime |
		<primitive: return sc.CombC(_in, _maxdelaytime, _delaytime, _decaytime);>
	}

	combL { :in :maxdelaytime :delaytime :decaytime |
		<primitive: return sc.CombL(_in, _maxdelaytime, _delaytime, _decaytime);>
	}

	combN { :in :maxdelaytime :delaytime :decaytime |
		<primitive: return sc.CombN(_in, _maxdelaytime, _delaytime, _decaytime);>
	}

	compander { :in :control :thresh :slopeBelow :slopeAbove :clampTime :relaxTime |
		<primitive: return sc.Compander(_in, _control, _thresh, _slopeBelow, _slopeAbove, _clampTime, _relaxTime);>
	}

	convolution { :in :kernel :framesize |
		<primitive: return sc.Convolution(_in, _kernel, _framesize);>
	}

	decay { :in :decayTime |
		<primitive: return sc.Decay(_in, _decayTime);>
	}

	decay2 { :in :attackTime :decayTime |
		<primitive: return sc.Decay2(_in, _attackTime, _decayTime);>
	}

	delay1 { :in |
		<primitive: return sc.Delay1(_in);>
	}

	delay2 { :in |
		<primitive: return sc.Delay2(_in);>
	}

	delayC { :in :maxdelaytime :delaytime |
		<primitive: return sc.DelayC(_in, _maxdelaytime, _delaytime);>
	}

	delayL { :in :maxdelaytime :delaytime |
		<primitive: return sc.DelayL(_in, _maxdelaytime, _delaytime);>
	}

	delayMap { :bufNum :in :dynamic :spec |
		<primitive: return sc.DelayMap(_bufNum, _in, _dynamic, _spec);>
	}

	delayN { :in :maxdelaytime :delaytime |
		<primitive: return sc.DelayN(_in, _maxdelaytime, _delaytime);>
	}

	demand { :trig :reset :demandUGens |
		<primitive: return sc.Demand(_trig, _reset, _demandUGens);>
	}

	detectSilence { :in :amp :time :doneAction |
		<primitive: return sc.DetectSilence(_in, _amp, _time, _doneAction);>
	}

	formlet { :in :freq :attacktime :decaytime |
		<primitive: return sc.Formlet(_in, _freq, _attacktime, _decaytime);>
	}

	freeVerb { :in :mix :room :damp |
		<primitive: return sc.FreeVerb(_in, _mix, _room, _damp);>
	}

	freeVerb2 { :in :in2 :mix :room :damp |
		<primitive: return sc.FreeVerb2(_in, _in2, _mix, _room, _damp);>
	}

	freqShift { :in :freq :phase |
		<primitive: return sc.FreqShift(_in, _freq, _phase);>
	}

	gVerb { :in :roomsize :revtime :damping :inputbw :spread :drylevel :earlyreflevel :taillevel :maxroomsize |
		<primitive: return sc.GVerb(_in, _roomsize, _revtime, _damping, _inputbw, _spread, _drylevel, _earlyreflevel, _taillevel, _maxroomsize);>
	}

	gate { :in :trig |
		<primitive: return sc.Gate(_in, _trig);>
	}

	hasher { :in |
		<primitive: return sc.Hasher(_in);>
	}

	hilbertTransform { :in |
		<primitive: return sc.Hilbert(_in);>
	}

	hpf { :in :freq |
		<primitive: return sc.Hpf(_in, _freq);>
	}

	hpz1 { :in |
		<primitive: return sc.Hpz1(_in);>
	}

	hpz2 { :in |
		<primitive: return sc.Hpz2(_in);>
	}

	inRange { :in :lo :hi |
		<primitive: return sc.InRange(_in, _lo, _hi);>
	}

	integrator { :in :coef |
		<primitive: return sc.Integrator(_in, _coef);>
	}

	k2A { :in |
		<primitive: return sc.K2A(_in);>
	}

	klank { :input :freqscale :freqoffset :decayscale :specificationsListRef |
		<primitive: return sc.Klank(_input, _freqscale, _freqoffset, _decayscale, _specificationsListRef);>
	}

	lag { :in :lagTime |
		<primitive: return sc.Lag(_in, _lagTime);>
	}

	lag2 { :in :lagTime |
		<primitive: return sc.Lag2(_in, _lagTime);>
	}

	lag3 { :in :lagTime |
		<primitive: return sc.Lag3(_in, _lagTime);>
	}

	lag3Ud { :in :lagTimeU :lagTimeD |
		<primitive: return sc.Lag3Ud(_in, _lagTimeU, _lagTimeD);>
	}

	lagUd { :in :lagTimeU :lagTimeD |
		<primitive: return sc.LagUd(_in, _lagTimeU, _lagTimeD);>
	}

	latch { :in :trig |
		<primitive: return sc.Latch(_in, _trig);>
	}

	leakDc { :in :coef |
		<primitive: return sc.LeakDc(_in, _coef);>
	}

	limiter { :in :level :dur |
		<primitive: return sc.Limiter(_in, _level, _dur);>
	}

	linPan2 { :in :pos :level |
		<primitive: return sc.LinPan2(_in, _pos, _level);>
	}

	linXFade2 { :inA :inB :pan |
		<primitive: return sc.LinXFade2(_inA, _inB, _pan);>
	}

	lpf { :in :freq |
		<primitive: return sc.Lpf(_in, _freq);>
	}

	lpz1 { :in |
		<primitive: return sc.Lpz1(_in);>
	}

	lpz2 { :in |
		<primitive: return sc.Lpz2(_in);>
	}

	mVerb { :in1 :in2 :dampingFreq :density :bandwidthFreq :decay :predelay :size :gain :mix :earlyMix |
		<primitive: return sc.MVerb(_in1, _in2, _dampingFreq, _density, _bandwidthFreq, _decay, _predelay, _size, _gain, _mix, _earlyMix);>
	}

	mantissaMask { :in :bits |
		<primitive: return sc.MantissaMask(_in, _bits);>
	}

	midEq { :in :freq :rq :db |
		<primitive: return sc.MidEq(_in, _freq, _rq, _db);>
	}

	moogFf { :in :freq :gain :reset |
		<primitive: return sc.MoogFf(_in, _freq, _gain, _reset);>
	}

	moogVcf { :in :fco :res |
		<primitive: return sc.MoogVcf(_in, _fco, _res);>
	}

	normalizer { :in :level :dur |
		<primitive: return sc.Normalizer(_in, _level, _dur);>
	}

	onePole { :in :coef |
		<primitive: return sc.OnePole(_in, _coef);>
	}

	oneZero { :in :coef |
		<primitive: return sc.OneZero(_in, _coef);>
	}

	pan2 { :in :pos :level |
		<primitive: return sc.Pan2(_in, _pos, _level);>
	}

	panB { :in :azimuth :elevation :gain |
		<primitive: return sc.PanB(_in, _azimuth, _elevation, _gain);>
	}

	panB2 { :input :azimuth :gain |
		<primitive: return sc.PanB2(_input, _azimuth, _gain);>
	}

	peakFollower { :in :decay |
		<primitive: return sc.PeakFollower(_in, _decay);>
	}

	pitchFollower { :in :initFreq :minFreq :maxFreq :execFreq :maxBinsPerOctave :median :ampThreshold :peakThreshold :downSample :clar |
		<primitive: return sc.Pitch(_in, _initFreq, _minFreq, _maxFreq, _execFreq, _maxBinsPerOctave, _median, _ampThreshold, _peakThreshold, _downSample, _clar);>
	}

	pitchShift { :in :windowSize :pitchRatio :pitchDispersion :timeDispersion |
		<primitive: return sc.PitchShift(_in, _windowSize, _pitchRatio, _pitchDispersion, _timeDispersion);>
	}

	pluck { :in :trig :maxdelaytime :delaytime :decaytime :coef |
		<primitive: return sc.Pluck(_in, _trig, _maxdelaytime, _delaytime, _decaytime, _coef);>
	}

	resonz { :in :freq :bwr |
		<primitive: return sc.Resonz(_in, _freq, _bwr);>
	}

	rhpf { :in :freq :rq |
		<primitive: return sc.Rhpf(_in, _freq, _rq);>
	}

	ringz { :in :freq :decaytime |
		<primitive: return sc.Ringz(_in, _freq, _decaytime);>
	}

	rlpf { :in :freq :rq |
		<primitive: return sc.Rlpf(_in, _freq, _rq);>
	}

	runningMax { :in :trig |
		<primitive: return sc.RunningMax(_in, _trig);>
	}

	runningSum { :in :numsamp |
		<primitive: return sc.RunningSum(_in, _numsamp);>
	}

	sanitize { :in :replace |
		<primitive: return sc.Sanitize(_in, _replace);>
	}

	schmidt { :in :lo :hi |
		<primitive: return sc.Schmidt(_in, _lo, _hi);>
	}

	slew { :in :up :dn |
		<primitive: return sc.Slew(_in, _up, _dn);>
	}

	slope { :in |
		<primitive: return sc.Slope(_in);>
	}

	spring { :in :spring :damp |
		<primitive: return sc.Spring(_in, _spring, _damp);>
	}

	tDelay { :in :dur |
		<primitive: return sc.TDelay(_in, _dur);>
	}

	trig { :in :dur |
		<primitive: return sc.Trig(_in, _dur);>
	}

	trig1 { :in :dur |
		<primitive: return sc.Trig1(_in, _dur);>
	}

	twIndex { :input :normalize :array |
		<primitive: return sc.TwIndex(_input, _normalize, _array);>
	}

	twoPole { :in :freq :radius |
		<primitive: return sc.TwoPole(_in, _freq, _radius);>
	}

	twoZero { :in :freq :radius |
		<primitive: return sc.TwoZero(_in, _freq, _radius);>
	}

	xFade2 { :inA :inB :pan :level |
		<primitive: return sc.XFade2(_inA, _inB, _pan, _level);>
	}

	zeroCrossing { :in |
		<primitive: return sc.ZeroCrossing(_in);>
	}

}

+[List, Ugen] {

	[firstOrderFilterSection, fos] { :in :a0 :a1 :b1 |
		<primitive: return sc.Fos(_in, _a0, _a1, _b1);>
	}

	[secondOrderFilterSection, sos] { :in :a0 :a1 :a2 :b1 :b2 |
		<primitive: return sc.Sos(_in, _a0, _a1, _a2, _b1, _b2);>
	}

}

+[List, Ugen, SmallFloat] {

	ampComp { :freq :root :exp |
		<primitive: return sc.AmpComp(_freq, _root, _exp);>
	}

	ampCompA { :freq :root :minAmp :rootAmp |
		<primitive: return sc.AmpCompA(_freq, _root, _minAmp, _rootAmp);>
	}

	blip { :freq :numharm |
		<primitive: return sc.Blip(_freq, _numharm);>
	}

	bufDur { :bufnum |
		<primitive: return sc.BufDur(_bufnum);>
	}

	bufFrames { :bufnum |
		<primitive: return sc.BufFrames(_bufnum);>
	}

	bufRateScale { :bufnum |
		<primitive: return sc.BufRateScale(_bufnum);>
	}

	bufSampleRate { :bufnum |
		<primitive: return sc.BufSampleRate(_bufnum);>
	}

	bufWr { :bufnum :phase :loop :inputList |
		<primitive: return sc.BufWr(_bufnum, _phase, _loop, _inputList);>
	}

	clearBuf { :buf |
		<primitive: return sc.ClearBuf(_buf);>
	}

	coinGate { :prob :in |
		<primitive: return sc.CoinGate(_prob, _in);>
	}

	crackle { :chaosParam |
		<primitive: return sc.Crackle(_chaosParam);>
	}

	cuspL { :freq :a :b :xi |
		<primitive: return sc.CuspL(_freq, _a, _b, _xi);>
	}

	cuspN { :freq :a :b :xi |
		<primitive: return sc.CuspN(_freq, _a, _b, _xi);>
	}

	dbrown { :length :lo :hi :step |
		<primitive: return sc.Dbrown(_length, _lo, _hi, _step);>
	}

	dbufrd { :bufnum :phase :loop |
		<primitive: return sc.Dbufrd(_bufnum, _phase, _loop);>
	}

	dbufwr { :bufnum :phase :input :loop |
		<primitive: return sc.Dbufwr(_bufnum, _phase, _input, _loop);>
	}

	dc { :in |
		<primitive: return sc.Dc(_in);>
	}

	ddup { :n :in |
		<primitive: return sc.Ddup(_n, _in);>
	}

	demandEnvGen { :level :dur :shape :curve :gate :reset :levelScale :levelBias :timeScale :doneAction |
		<primitive: return sc.DemandEnvGen(_level, _dur, _shape, _curve, _gate, _reset, _levelScale, _levelBias, _timeScale, _doneAction);>
	}

	bufDetectIndex { :bufnum :input |
		<primitive: return sc.DetectIndex(_bufnum, _input);>
	}

	dgeom { :start :grow :length |
		<primitive: return sc.Dgeom(_start, _grow, _length);>
	}

	dibrown { :length :lo :hi :step |
		<primitive: return sc.Dibrown(_length, _lo, _hi, _step);>
	}

	diwhite { :length :lo :hi |
		<primitive: return sc.Diwhite(_length, _lo, _hi);>
	}

	drand { :repeats :list |
		<primitive: return sc.Drand(_repeats, _list);>
	}

	dseq { :repeats :list |
		<primitive: return sc.Dseq(_repeats, _list);>
	}

	dser { :repeats :list |
		<primitive: return sc.Dser(_repeats, _list);>
	}

	dseries { :length :start :step |
		<primitive: return sc.Dseries(_length, _start, _step);>
	}

	dshuf { :repeats :list |
		<primitive: return sc.Dshuf(_repeats, _list);>
	}

	durationGate { :dur |
		 <primitive: return sc.DurationGate(_dur);>
	}

	dust { :density |
		<primitive: return sc.Dust(_density);>
	}

	dust2 { :density |
		<primitive: return sc.Dust2(_density);>
	}

	duty { :dur :reset :level |
		<primitive: return sc.Duty(_dur, _reset, 0, _level);>
	}

	dwhite { :length :lo :hi |
		<primitive: return sc.Dwhite(_length, _lo, _hi);>
	}

	dwrand { :repeats :weights :list |
		<primitive: return sc.Dwrand(_repeats, _weights, _list);>
	}

	dxrand { :repeats :list |
		<primitive: return sc.Dxrand(_repeats, _list);>
	}

	envGen { :gate :levelScale :levelBias :timeScale :doneAction :envelope |
		<primitive: return sc.EnvGen(_gate, _levelScale, _levelBias, _timeScale, _doneAction, _envelope);>
	}

	envTrapezoid { :trig :dur :shape :skew |
		<primitive: return sc.EnvTrapezoid(_trig, _dur, _shape, _skew);>
	}

	fSinOsc { :freq :iphase |
		<primitive: return sc.FSinOsc(_freq, _iphase);>
	}

	fbSineC { :freq :im :fb :a :c :xi :yi |
		<primitive: return sc.FbSineC(_freq, _im, _fb, _a, _c, _xi, _yi);>
	}

	fbSineL { :freq :im :fb :a :c :xi :yi |
		<primitive: return sc.FbSineL(_freq, _im, _fb, _a, _c, _xi, _yi);>
	}

	fbSineN { :freq :im :fb :a :c :xi :yi |
		<primitive: return sc.FbSineN(_freq, _im, _fb, _a, _c, _xi, _yi);>
	}

	fft { :buffer :in :hop :wintype :active :winsize |
		<primitive: return sc.Fft(_buffer, _in, _hop, _wintype, _active, _winsize);>
	}

	formant { :fundfreq :formfreq :bwfreq |
		<primitive: return sc.Formant(_fundfreq, _formfreq, _bwfreq);>
	}

	freeSelfWhenDone { :src |
		<primitive: return sc.FreeSelfWhenDone(_src);>
	}

	gbmanL { :freq :xi :yi |
		<primitive: return sc.GbmanL(_freq, _xi, _yi);>
	}

	gbmanN { :freq :xi :yi |
		<primitive: return sc.GbmanN(_freq, _xi, _yi);>
	}

	gendy1 { :ampdist :durdist :adparam :ddparam :minfreq :maxfreq :ampscale :durscale :initCPs :knum |
		<primitive: return sc.Gendy1(_ampdist, _durdist, _adparam, _ddparam, _minfreq, _maxfreq, _ampscale, _durscale, _initCPs, _knum);>
	}

	gendy2 { :ampdist :durdist :adparam :ddparam :minfreq :maxfreq :ampscale :durscale :initCPs :knum :a :c |
		<primitive: return sc.Gendy2(_ampdist, _durdist, _adparam, _ddparam, _minfreq, _maxfreq, _ampscale, _durscale, _initCPs, _knum, _a, _c);>
	}

	gendy3 { :ampdist :durdist :adparam :ddparam :freq :ampscale :durscale :initCPs :knum |
		<primitive: return sc.Gendy3(_ampdist, _durdist, _adparam, _ddparam, _freq, _ampscale, _durscale, _initCPs, _knum);>
	}

	henonC { :freq :a :b :x0 :x1 |
		<primitive: return sc.HenonC(_freq, _a, _b, _x0, _x1);>
	}

	henonL { :freq :a :b :x0 :x1 |
		<primitive: return sc.HenonL(_freq, _a, _b, _x0, _x1);>
	}

	henonN { :freq :a :b :x0 :x1 |
		<primitive: return sc.HenonN(_freq, _a, _b, _x0, _x1);>
	}

	iRand { :lo :hi |
		<primitive: return sc.IRand(_lo, _hi);>
	}

	ifft { :buffer :wintype :winsize |
		<primitive: return sc.Ifft(_buffer, _wintype, _winsize);>
	}

	impulse { :freq :phase |
		<primitive: return sc.Impulse(_freq, _phase);>
	}

	indexInBetween { :bufnum :in |
		<primitive: return sc.IndexInBetween(_bufnum, _in);>
	}

	keyState { :keycode :minval :maxval :lag |
		<primitive: return sc.KeyState(_keycode, _minval, _maxval, _lag);>
	}

	klang { :freqscale :freqoffset :specificationsListRef |
		<primitive: return sc.Klang(_freqscale, _freqoffset, _specificationsListRef);>
	}

	latoocarfianC { :freq :a :b :c :d :xi :yi |
		<primitive: return sc.LatoocarfianC(_freq, _a, _b, _c, _d, _xi, _yi);>
	}

	latoocarfianL { :freq :a :b :c :d :xi :yi |
		<primitive: return sc.LatoocarfianL(_freq, _a, _b, _c, _d, _xi, _yi);>
	}

	latoocarfianN { :freq :a :b :c :d :xi :yi |
		<primitive: return sc.LatoocarfianN(_freq, _a, _b, _c, _d, _xi, _yi);>
	}

	lfClipNoise { :freq |
		<primitive: return sc.LfClipNoise(_freq);>
	}

	lfCub { :freq :iphase |
		<primitive: return sc.LfCub(_freq, _iphase);>
	}

	lfGauss { :duration :width :iphase :loop :doneAction |
		<primitive: return sc.LfGauss(_duration, _width, _iphase, _loop, _doneAction);>
	}

	lfNoise0 { :freq |
		<primitive: return sc.LfNoise0(_freq);>
	}

	lfNoise1 { :freq |
		<primitive: return sc.LfNoise1(_freq);>
	}

	lfNoise2 { :freq |
		<primitive: return sc.LfNoise2(_freq);>
	}

	lfPar { :freq :iphase |
		<primitive: return sc.LfPar(_freq, _iphase);>
	}

	lfPulse { :freq :iphase :width |
		<primitive: return sc.LfPulse(_freq, _iphase, _width);>
	}

	lfSaw { :freq :iphase |
		<primitive: return sc.LfSaw(_freq, _iphase);>
	}

	lfTri { :freq :iphase |
		<primitive: return sc.LfTri(_freq, _iphase);>
	}

	lfdClipNoise { :freq |
		<primitive: return sc.LfdClipNoise(_freq);>
	}

	lfdNoise0 { :freq |
		<primitive: return sc.LfdNoise0(_freq);>
	}

	lfdNoise1 { :freq |
		<primitive: return sc.LfdNoise1(_freq);>
	}

	lfdNoise3 { :freq |
		<primitive: return sc.LfdNoise3(_freq);>
	}

	linCongC { :freq :a :c :m :xi |
		<primitive: return sc.LinCongC(_freq, _a, _c, _m, _xi);>
	}

	linRand { :lo :hi :minmax |
		<primitive: return sc.LinRand(_lo, _hi, _minmax);>
	}

	linen { :gate :attackTime :susLevel :releaseTime :doneAction |
		<primitive: return sc.Linen(_gate, _attackTime, _susLevel, _releaseTime, _doneAction);>
	}

	localOut { :channelsList |
		<primitive: return sc.LocalOut(_channelsList);>
	}

	logistic { :chaosParam :freq :init |
		<primitive: return sc.Logistic(_chaosParam, _freq, _init);>
	}

	lorenzL { :freq :s :r :b :h :xi :yi :zi |
		<primitive: return sc.LorenzL(_freq, _s, _r, _b, _h, _xi, _yi, _zi);>
	}

	maxLocalBufs { :count |
		<primitive: return sc.MaxLocalBufs(_count);>
	}

	mouseButton { :minval :maxval :lag |
		<primitive: return sc.MouseButton(_minval, _maxval, _lag);>
	}

	mouseX { :minval :maxval :warp :lag |
		<primitive: return sc.MouseX(_minval, _maxval, _warp, _lag);>
	}

	mouseY { :minval :maxval :warp :lag |
		<primitive: return sc.MouseY(_minval, _maxval, _warp, _lag);>
	}

	multiplexer { :selector :inputList |
		<primitive: return sc.Multiplexer(_selector, _inputList);>
	}

	nRand { :lo :hi :n |
		<primitive: return sc.NRand(_lo, _hi, _n);>
	}

	offsetOut { :bus :channelsList |
		<primitive: return sc.OffsetOut(_bus, _channelsList);>
	}

	osc { :bufnum :freq :phase |
		<primitive: return sc.Osc(_bufnum, _freq, _phase);>
	}

	out { :bus :channelsList |
		<primitive: return sc.Out(_bus, _channelsList);>
	}

	phasor { :trig :rate :start :end :resetPos |
		<primitive: return sc.Phasor(_trig, _rate, _start, _end, _resetPos);>
	}

	pulse { :freq :width |
		<primitive: return sc.Pulse(_freq, _width);>
	}

	pulseCount { :trig :reset |
		<primitive: return sc.PulseCount(_trig, _reset);>
	}

	pulseDivider { :trig :div :start |
		<primitive: return sc.PulseDivider(_trig, _div, _start);>
	}

	pvBinScramble { :buffer :wipe :width :trig |
		<primitive: return sc.PvBinScramble(_buffer, _wipe, _width, _trig);>
	}

	pvDiffuser { :buffer :trig |
		<primitive: return sc.PvDiffuser(_buffer, _trig);>
	}

	pvRandComb { :buffer :wipe :trig |
		<primitive: return sc.PvRandComb(_buffer, _wipe, _trig);>
	}

	quadC { :freq :a :b :c :xi |
		<primitive: return sc.QuadC(_freq, _a, _b, _c, _xi);>
	}

	quadL { :freq :a :b :c :xi |
		<primitive: return sc.QuadL(_freq, _a, _b, _c, _xi);>
	}

	quadN { :freq :a :b :c :xi |
		<primitive: return sc.QuadN(_freq, _a, _b, _c, _xi);>
	}

	rand { :lo :hi |
		<primitive: return sc.Rand(_lo, _hi);>
	}

	recordBuf { :bufnum :offset :recLevel :preLevel :run :loop :trigger :doneAction :inputList |
		<primitive: return sc.RecordBuf(_bufnum, _offset, _recLevel, _preLevel, _run, _loop, _trigger, _doneAction, _inputList);>
	}

	replaceOut { :bus :channelsList |
		<primitive: return sc.ReplaceOut(_bus, _channelsList);>
	}

	rotate2 { :x :y :pos |
		<primitive: return sc.Rotate2(_x, _y, _pos);>
	}

	samplerIndex { :bufNum :size :mnn |
		<primitive: return sc.SamplerIndex(_bufNum, _size, _mnn);>
	}

	saw { :freq |
		<primitive: return sc.Saw(_freq);>
	}

	sawDpw { :freq :iphase |
		<primitive: return sc.SawDpw(_freq, _iphase);>
	}

	selectT { :which :array |
		<primitive: return sc.Select(_which, _array);>
	}

	setBuf { :buf :offset :length :array |
		<primitive: return sc.SetBuf(_buf, _offset, _length, _array);>
	}

	setResetFf { :trig :reset |
		<primitive: return sc.SetResetFf(_trig, _reset);>
	}

	sinOsc { :freq :phase |
		<primitive: return sc.SinOsc(_freq, _phase);>
	}

	sinOscFb { :freq :feedback |
		<primitive: return sc.SinOscFb(_freq, _feedback);>
	}

	standardL { :freq :k :xi :yi |
		<primitive: return sc.StandardL(_freq, _k, _xi, _yi);>
	}

	standardN { :freq :k :xi :yi |
		<primitive: return sc.StandardN(_freq, _k, _xi, _yi);>
	}

	stepper { :trig :reset :min :max :step :resetval |
		<primitive: return sc.Stepper(_trig, _reset, _min, _max, _step, _resetval);>
	}

	sweep { :trig :rate |
		<primitive: return sc.Sweep(_trig, _rate);>
	}

	syncSaw { :syncFreq :sawFreq |
		<primitive: return sc.SyncSaw(_syncFreq, _sawFreq);>
	}

	tDuty { :dur :reset :level |
		<primitive: return sc.TDuty(_dur, _reset, 0, _level, 0);>
	}

	tExpRand { :lo :hi :trig |
		<primitive: return sc.TExpRand(_lo, _hi, _trig);>
	}

	tRand { :lo :hi :trig |
		<primitive: return sc.TRand(_lo, _hi, _trig);>
	}

	tableRand { :trig :bufnum |
		<primitive: return sc.TableRand(_trig, _bufnum);>
	}

	tiRand { :lo :hi :trig |
		<primitive: return sc.TiRand(_lo, _hi, _trig);>
	}

	timer { :trig |
		<primitive: return sc.Timer(_trig);>
	}

	toggleFf { :trig |
		<primitive: return sc.ToggleFf(_trig);>
	}

	varSaw { :freq :iphase :width |
		<primitive: return sc.VarSaw(_freq, _iphase, _width);>
	}

	vibrato { :freq :rate :depth :delay :onset :rateVariation :depthVariation :iphase :trig |
		<primitive: return sc.Vibrato(_freq, _rate, _depth, _delay, _onset, _rateVariation, _depthVariation, _iphase, _trig);>
	}

	bufIndexClip { :bufnum :in |
		<primitive: return sc.Index(_bufnum, _in);>
	}

	bufIndexWrap { :bufnum :in |
		<primitive: return sc.WrapIndex(_bufnum, _in);>
	}

	expRand { :lo :hi |
		<primitive: return sc.ExpRand(_lo, _hi);>
	}

}

+[SmallFloat, List] {

	bufRd { :numChan :bufnum :phase :loop :interpolation |
		<primitive: return sc.BufRd(_numChan, _bufnum, _phase, _loop, _interpolation);>
	}

	decodeB2 { :numChan :w :x :y :orientation |
		<primitive: return sc.DecodeB2(_numChan, _w, _x, _y, _orientation);>
	}

	demultiplexer { :numChannels :input :selector |
		<primitive: return sc.Demultiplexer(_numChannels, _input, _selector);>
	}

	grainBuf { :numChan :trigger :dur :sndbuf :rate :pos :interp :pan :envbufnum :maxGrains |
		<primitive: return sc.GrainBuf(_numChan, _trigger, _dur, _sndbuf, _rate, _pos, _interp, _pan, _envbufnum, _maxGrains);>
	}

	grainFm { :numChan :trigger :dur :carfreq :modfreq :index :pan :envbufnum :maxGrains |
		<primitive: return sc.GrainFm(_numChan, _trigger, _dur, _carfreq, _modfreq, _index, _pan, _envbufnum, _maxGrains);>
	}

	grainSin { :numChan :trigger :dur :freq :pan :envbufnum :maxGrains |
		<primitive: return sc.GrainSin(_numChan, _trigger, _dur, _freq, _pan, _envbufnum, _maxGrains);>
	}

	inFeedback { :numChan :bus |
		<primitive: return sc.InFeedback(_numChan, _bus);>
	}

	localBuf { :numChannels :numFrames |
		<primitive: return sc.LocalBuf(_numChannels, _numFrames);>
	}

	localIn { :numChan :default |
		<primitive: return sc.LocalIn(_numChan, _default);>
	}

	panAz { :numChan :in :pos :level :width :orientation |
		<primitive: return sc.PanAz(_numChan, _in, _pos, _level, _width, _orientation);>
	}

	playBuf { :numChan :bufnum :rate :trigger :startPos :loop :doneAction |
		<primitive: return sc.PlayBuf(_numChan, _bufnum, _rate, _trigger, _startPos, _loop, _doneAction);>
	}

	tGrains { :numChan :trigger :bufnum :rate :centerPos :dur :pan :amp :interp |
		<primitive: return sc.TGrains(_numChan, _trigger, _bufnum, _rate, _centerPos, _dur, _pan, _amp, _interp);>
	}

	warp1 { :numChan :bufnum :pointer :freqScale :windowSize :envbufnum :overlaps :windowRandRatio :interp |
		<primitive: return sc.Warp1(_numChan, _bufnum, _pointer, _freqScale, _windowSize, _envbufnum, _overlaps, _windowRandRatio, _interp);>
	}

	busIn { :numChan :bus |
		<primitive: return sc.In(_numChan, _bus);>
	}

}

+[List, Ugen] {

	dswitch { :index :list |
		<primitive: return sc.Dswitch(_index, _list);>
	}

	dswitch1 { :index :list |
		<primitive: return sc.Dswitch1(_index, _list);>
	}

}

+[List, SmallFloat, Ugen] {

	analogFoldOsc { :freq :amp |
		<primitive: return sc.AnalogFoldOsc(_freq, _amp);>
	}

	bezier { :haltAfter :dx :freq :phase :param |
		<primitive: return sc.Bezier(_haltAfter, _dx, _freq, _phase, _param);>
	}

	crossoverDistortion { :in :amp :smooth |
		<primitive: return sc.CrossoverDistortion(_in, _amp, _smooth);>
	}

	dfm1 { :in :freq :res :inputgain :type :noiselevel |
		<primitive: return sc.Dfm1(_in, _freq, _res, _inputgain, _type, _noiselevel);>
	}

	dustRange { :iotMin :iotMax |
		<primitive: return sc.DustRange(_iotMin, _iotMax);>
	}

	dwgPluckedStiff { :freq :amp :gate :pos :c1 :c3 :inp :release :fB |
		<primitive: return sc.DwgPluckedStiff(_freq, _amp, _gate, _pos, _c1, _c3, _inp, _release, _fB);>
	}

	dx7 { :bufnum :on :off :data :vc :mnn :vel :pw :mw :bc :fc |
		<primitive: return sc.Dx7(_bufnum, _on, _off, _data, _vc, _mnn, _vel, _pw, _mw, _bc, _fc);>
	}

	dx7Env { :gate :data :r1 :r2 :r3 :r4 :l1 :l2 :l3 :l4 :ol |
		<primitive: return sc.Dx7Env(_gate, _data, _r1, _r2, _r3, _r4, _l1, _l2, _l3, _l4, _ol);>
	}

	expRandN { :numChan :lo :hi |
		<primitive: return sc.ExpRandN(_numChan, _lo, _hi);>
	}

	fm7 { :ctlMatrix :modMatrix |
		<primitive: return sc.Fm7(_ctlMatrix, _modMatrix);>
	}

	freezer { :bufnum :left :right :gain :increment :incrementOffset :incrementRandom :rightRandom :syncPhaseTrigger :randomizePhaseTrigger :numberOfLoops |
		<primitive: return sc.Freezer(_bufnum, _left, _right, _gain, _increment, _incrementOffset, _incrementRandom, _rightRandom, _syncPhaseTrigger, _randomizePhaseTrigger, _numberOfLoops);>
	}

	friction { :in :friction :spring :damp :mass :beltmass |
		<primitive: return sc.Friction(_in, _friction, _spring, _damp, _mass, _beltmass);>
	}

	greyholeRaw { :in1 :in2 :damping :delaytime :diffusion :feedback :moddepth :modfreq :size |
		<primitive: return sc.GreyholeRaw(_in1, _in2, _damping, _delaytime, _diffusion, _feedback, _moddepth, _modfreq, _size);>
	}

	lfBrownNoise1 { :freq :dev :dist |
		<primitive: return sc.LfBrownNoise1(_freq, _dev, _dist);>
	}

	linRandN { :numChan :lo :hi :minmax |
		<primitive: return sc.LinRandN(_numChan, _lo, _hi, _minmax);>
	}

	membraneCircle { :excitation :tension :loss |
		<primitive: return sc.MembraneCircle(_excitation, _tension, _loss);>
	}

	miBraids { :pitch :timbre :color :model :trig :resamp :decim :bits :ws |
		<primitive: return sc.MiBraids(_pitch, _timbre, _color, _model, _trig, _resamp, _decim, _bits, _ws);>
	}

	miClouds { :pit :pos :size :dens :tex :drywet :inGain :spread :rvb :fb :freeze :mode :lofi :trig :inputList |
		<primitive: return sc.MiClouds(_pit, _pos, _size, _dens, _tex, _drywet, _inGain, _spread, _rvb, _fb, _freeze, _mode, _lofi, _trig, _inputList);>
	}

	miRings { :in :trig :pit :struct :bright :damp :pos :model :poly :internExciter :easteregg :bypass |
		<primitive: return sc.MiRings(_in, _trig, _pit, _struct, _bright, _damp, _pos, _model, _poly, _internExciter, _easteregg, _bypass);>
	}

	moogLadder { :in :ffreq :res |
		<primitive: return sc.MoogLadder(_in, _ffreq, _res);>
	}

	obxdFilter { :in :cutoff :resonance :multimode :bandpass :fourpole |
		<primitive: return sc.ObxdFilter(_in, _cutoff, _resonance, _multimode, _bandpass, _fourpole);>
	}

	perlin3 { :x :y :z |
		<primitive: return sc.Perlin3(_x, _y, _z);>
	}

	randN { :numChan :lo :hi |
		<primitive: return sc.RandN(_numChan, _lo, _hi);>
	}

	rcd { :clock :rotate :reset :div :spread :auto :len :down :gates |
		<primitive: return sc.Rcd(_clock, _rotate, _reset, _div, _spread, _auto, _len, _down, _gates);>
	}

	scm { :clock :bpm :rotate :slip :shuffle :skip :pw |
		<primitive: return sc.Scm(_clock, _bpm, _rotate, _slip, _shuffle, _skip, _pw);>
	}

	shufflerB { :bufnum :readLocationMinima :readLocationMaxima :readIncrementMinima :readIncrementMaxima :durationMinima :durationMaxima :envelopeAmplitudeMinima :envelopeAmplitudeMaxima :envelopeShapeMinima :envelopeShapeMaxima :envelopeSkewMinima :envelopeSkewMaxima :stereoLocationMinima :stereoLocationMaxima :interOffsetTimeMinima :interOffsetTimeMaxima :ftableReadLocationIncrement :readIncrementQuanta :interOffsetTimeQuanta |
		<primitive: return sc.ShufflerB(_bufnum, _readLocationMinima, _readLocationMaxima, _readIncrementMinima, _readIncrementMaxima, _durationMinima, _durationMaxima, _envelopeAmplitudeMinima, _envelopeAmplitudeMaxima, _envelopeShapeMinima, _envelopeShapeMaxima, _envelopeSkewMinima, _envelopeSkewMaxima, _stereoLocationMinima, _stereoLocationMaxima, _interOffsetTimeMinima, _interOffsetTimeMaxima, _ftableReadLocationIncrement, _readIncrementQuanta, _interOffsetTimeQuanta);>
	}

	sinGrain { :trigger :dur :freq |
		<primitive: return sc.SinGrain(_trigger, _dur, _freq);>
	}

	svf { :signal :cutoff :res :lowpass :bandpass :highpass :notch :peak |
		<primitive: return sc.Svf(_signal, _cutoff, _res, _lowpass, _bandpass, _highpass, _notch, _peak);>
	}

	svfBp { :in :freq :q |
		<primitive: return sc.SvfBp(_in, _freq, _q);>
	}

	svfHp { :in :freq :q |
		<primitive: return sc.SvfHp(_in, _freq, _q);>
	}

	svfLp { :in :freq :q |
		<primitive: return sc.SvfLp(_in, _freq, _q);>
	}

	tLinRand { :lo :hi :minmax :trigger |
		<primitive: return sc.TLinRand(_lo, _hi, _minmax, _trigger);>
	}

	tScramble { :trigger :inputs |
		<primitive: return sc.TScramble(_trigger, _inputs);>
	}

	trigAllocator { :numChannels :algorithm :in :dur |
		<primitive: return sc.TrigAllocator(_numChannels, _algorithm, _in, _dur);>
	}

	trigRoundRobin { :numChannels :in |
		<primitive: return sc.TrigRoundRobin(_numChannels, _in);>
	}

	vbJonVerb { :in :decay :damping :inputbw :erfl :tail |
		<primitive: return sc.VbJonVerb(_in, _decay, _damping, _inputbw, _erfl, _tail);>
	}

	vosim { :trig :freq :nCycles :decay |
		<primitive: return sc.Vosim(_trig, _freq, _nCycles, _decay);>
	}

	wDistances { :gate :x :y :z :coordinateList |
		<primitive: return sc.WDistances(_gate, _x, _y, _z, _coordinateList);>
	}

	waveLoss { :in :drop :outof :mode |
		<primitive: return sc.WaveLoss(_in, _drop, _outof, _mode);>
	}

	wkNearest { :numChannels :gate :x :y :z :coordinateList |
		<primitive: return sc.WkNearest(_numChannels, _gate, _x, _y, _z, _coordinateList);>
	}

}

+[List, SmallFloat, Ugen] {

	biLinRand { :self |
		<primitive: return sc.BiLinRand(_self);>
	}

	coin { :self |
		<primitive: return sc.Coin(_self);>
	}

	expRandRange { :self :anObject |
		<primitive: return sc.ExpRandRange(_self, _anObject);>
	}

	firstArg { :self :anObject |
		<primitive: return sc.FirstArg(_self, _anObject);>
	}

	hanWindow { :self |
		<primitive: return sc.HanWindow(_self);>
	}

	linRand { :self |
		<primitive: return sc.LinRand_(_self);>
	}

	randRange { :self :anObject |
		<primitive: return sc.RandRange(_self, _anObject);>
	}

	ring1 { :self :anObject |
		<primitive: return sc.Ring1(_self, _anObject);>
	}

	sum3Rand { :self |
		<primitive: return sc.Sum3Rand(_self);>
	}

	triWindow { :self |
		<primitive: return sc.TriWindow(_self);>
	}

	welchWindow { :self |
		<primitive: return sc.WelchWindow(_self);>
	}

}

+Ugen {

	[abs, absoluteValue] { :self |
		<primitive: return sc.Abs(_self);>
	}

	ampDb { :self |
		<primitive: return sc.AmpDb(_self);>
	}

	arcCos { :self |
		<primitive: return sc.ArcCos(_self);>
	}

	arcSin { :self |
		<primitive: return sc.ArcSin(_self);>
	}

	arcTan { :self |
		<primitive: return sc.ArcTan(_self);>
	}

	ceiling { :self |
		<primitive: return sc.Ceil(_self);>
	}

	cos { :self |
		<primitive: return sc.Cos(_self);>
	}

	cosh { :self |
		<primitive: return sc.Cosh(_self);>
	}

	cpsMidi { :self |
		<primitive: return sc.CpsMidi(_self);>
	}

	cube { :self |
		<primitive: return sc.Cubed(_self);>
	}

	dbAmp { :self |
		<primitive: return sc.DbAmp(_self);>
	}

	distort { :self |
		<primitive: return sc.Distort(_self);>
	}

	exp { :self |
		<primitive: return sc.Exp(_self);>
	}

	floor { :self |
		<primitive: return sc.Floor(_self);>
	}

	fractionalPart { :self |
		<primitive: return sc.Frac(_self);>
	}

	log { :self |
		<primitive: return sc.Log(_self);>
	}

	log10 { :self |
		<primitive: return sc.Log10(_self);>
	}

	log2 { :self |
		<primitive: return sc.Log2(_self);>
	}

	midiCps { :self |
		<primitive: return sc.MidiCps(_self);>
	}

	midiRatio { :self |
		<primitive: return sc.MidiRatio(_self);>
	}

	[negate, -] { :self |
		<primitive: return sc.Neg(_self);>
	}

	ratioMidi { :self |
		<primitive: return sc.RatioMidi(_self);>
	}

	reciprocal { :self |
		<primitive: return sc.Recip(_self);>
	}

	sign { :self |
		<primitive: return sc.Sign(_self);>
	}

	[signedSqrt, signedSquareRoot] { :self |
		<primitive: return sc.Sqrt(_self);>
	}

	sin { :self |
		<primitive: return sc.Sin(_self);>
	}

	sinh { :self |
		<primitive: return sc.Sinh(_self);>
	}

	softClip { :self |
		<primitive: return sc.SoftClip(_self);>
	}

	square { :self |
		<primitive: return sc.Squared(_self);>
	}

	tan { :self |
		<primitive: return sc.Tan(_self);>
	}

	tanh { :self |
		<primitive: return sc.Tanh(_self);>
	}

}

+Ugen {

	absDif { :self :anObject |
		<primitive: return sc.AbsDif(_self, _anObject);>
	}

	amClip { :self :anObject |
		<primitive: return sc.AmClip(_self, _anObject);>
	}

	atan2 { :self :anObject |
		<primitive: return sc.Atan2(_self, _anObject);>
	}

	bitAnd { :self :anObject |
		<primitive: return sc.BitAnd(_self, _anObject);>
	}

	bitOr { :self :anObject |
		<primitive: return sc.BitOr(_self, _anObject);>
	}

	[bitShiftLeft, <<] { :self :anObject |
		<primitive: return sc.ShiftLeft(_self, _anObject);>
	}

	[bitShiftRight, >>] { :self :anObject |
		<primitive: return sc.ShiftRight(_self, _anObject);>
	}

	difSqr { :self :anObject |
		<primitive: return sc.DifSqr(_self, _anObject);>
	}

	[divide, /] { :self :anObject |
		<primitive: return sc.Fdiv(_self, _anObject);>
	}

	excess { :self :anObject |
		<primitive: return sc.Excess(_self, _anObject);>
	}

	hypotenuse { :self :anObject |
		<primitive: return sc.Hypot(_self, _anObject);>
	}

	[isEqual, =] { :self :anObject |
		<primitive: return sc.Eq(_self, _anObject);>
	}

	[isGreater, >] { :self :anObject |
		<primitive: return sc.Gt(_self, _anObject);>
	}

	[isGreaterOrEqual, >=] { :self :anObject |
		<primitive: return sc.Ge(_self, _anObject);>
	}

	[isLess, <] { :self :anObject |
		<primitive: return sc.Lt(_self, _anObject);>
	}

	[isLessOrEqual, <=] { :self :anObject |
		<primitive: return sc.Le(_self, _anObject);>
	}

	[isUnequal, !=] { :self :anObject |
		<primitive: return sc.Ne(_self, _anObject);>
	}

	max { :self :anObject |
		<primitive: return sc.Max(_self, _anObject);>
	}

	min { :self :anObject |
		<primitive: return sc.Min(_self, _anObject);>
	}

	[mod, %] { :self :anObject |
		<primitive: return sc.Mod(_self, _anObject);>
	}

	[plus, +] { :self :anObject |
		<primitive: return sc.Add(_self, _anObject);>
	}

	[power, ^] { :self :anObject |
		<primitive: return sc.Pow(_self, _anObject);>
	}

	[quotient, //] { :self :anObject |
		<primitive: return sc.Idiv(_self, _anObject);>
	}

	round { :self :anObject |
		<primitive: return sc.RoundTo(_self, _anObject);>
	}

	scaleNegative { :self :anObject |
		<primitive: return sc.ScaleNeg(_self, _anObject);>
	}

	signedGcd { :self :anObject |
		<primitive: return sc.Gcd(_self, _anObject);>
	}

	signedLcm { :self :anObject |
		<primitive: return sc.Lcm(_self, _anObject);>
	}

	[signedPower, **] { :self :anObject |
		<primitive: return sc.Pow(_self, _anObject);>
	}

	sqrDif { :self :anObject |
		<primitive: return sc.SqrDif(_self, _anObject);>
	}

	[subtract, -] { :self :anObject |
		<primitive: return sc.Sub(_self, _anObject);>
	}

	[times, *] { :self :anObject |
		<primitive: return sc.Mul(_self, _anObject);>
	}

	[truncate, integerPart] { :self :anObject |
		<primitive: return sc.Trunc(_self, _anObject);>
	}

}

+Ugen {

	bilateralClip { :self :anObject |
		<primitive: return sc.Clip2(_self, _anObject);>
	}

	bilateralFold { :self :anObject |
		<primitive: return sc.Fold2(_self, _anObject);>
	}

	bilateralWrap { :self :anObject |
		<primitive: return sc.Wrap2(_self, _anObject);>
	}

	clip { :in :lo :hi |
		<primitive: return sc.Clip(_in, _lo, _hi);>
	}

	degreeToKey { :bufnum :in :octave |
		<primitive: return sc.DegreeToKey(_bufnum, _in, _octave);>
	}

	fold { :in :lo :hi |
		<primitive: return sc.Fold(_in, _lo, _hi);>
	}

	linExp { :in :srclo :srchi :dstlo :dsthi |
		<primitive: return sc.LinExp(_in, _srclo, _srchi, _dstlo, _dsthi);>
	}

	medianFilter { :in :r |
		<primitive:
		if(sl.isSmallFloat(_r)) {
			return sc.Median(_r * 2 + 1, _in);
		}
		>
		in.error('medianFilter: length not scalar')
	}

	modularDistance { :x :y :mod |
		<primitive: return sc.ModDif(_x, _y, _mod);>
	}

	[plus, +] { :in0 :in1 :in2 :in3 |
		<primitive: return sc.Sum4(_in0, _in1, _in2, _in3);>
	}

	[timesPlus, *+] { :in :mul :add |
		<primitive: return sc.MulAdd(_in, _mul, _add);>
	}

	wrap { :in :lo :hi |
		<primitive: return sc.Wrap(_in, _lo, _hi);>
	}

}

+Ugen {

	clip { :self |
		self.clip(-1, 1)
	}

	fold { :self |
		self.fold(-1, 1)
	}

	round { :self |
		self.round(1)
	}

	truncate { :self |
		self.truncate(1)
	}

	unitCps { :self |
		(self * 100).midiCps
	}

	wrap { :self |
		self.wrap(-1, 1)
	}

}
