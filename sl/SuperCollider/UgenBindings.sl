(* Requires: Ugen *)

(* Auto-generated *)
+Void {
	BlockSize { <primitive: return sc.BlockSize();> }
	BrownNoise { <primitive: return sc.BrownNoise();> }
	ClipNoise { <primitive: return sc.ClipNoise();> }
	ControlDur { <primitive: return sc.ControlDur();> }
	ControlRate { <primitive: return sc.ControlRate();> }
	GrayNoise { <primitive: return sc.GrayNoise();> }
	NumOutputBuses { <primitive: return sc.NumOutputBuses();> }
	PinkNoise { <primitive: return sc.PinkNoise();> }
	SampleDur { <primitive: return sc.SampleDur();> }
	SampleRate { <primitive: return sc.SampleRate();> }
	WhiteNoise { <primitive: return sc.WhiteNoise();> }
}

(* Auto-generated *)
+[Array, SmallFloat, Ugen] {
	A2K { :in | <primitive: return sc.A2K(_in);> }
	AllpassC { :in :maxdelaytime :delaytime :decaytime | <primitive: return sc.AllpassC(_in, _maxdelaytime, _delaytime, _decaytime);> }
	AllpassL { :in :maxdelaytime :delaytime :decaytime | <primitive: return sc.AllpassL(_in, _maxdelaytime, _delaytime, _decaytime);> }
	AllpassN { :in :maxdelaytime :delaytime :decaytime | <primitive: return sc.AllpassN(_in, _maxdelaytime, _delaytime, _decaytime);> }
	AmpComp { :freq :root :exp | <primitive: return sc.AmpComp(_freq, _root, _exp);> }
	AmpCompA { :freq :root :minAmp :rootAmp | <primitive: return sc.AmpCompA(_freq, _root, _minAmp, _rootAmp);> }
	Amplitude { :in :attackTime :releaseTime | <primitive: return sc.Amplitude(_in, _attackTime, _releaseTime);> }
	BBandPass { :in :freq :bw | <primitive: return sc.BBandPass(_in, _freq, _bw);> }
	BBandStop { :in :freq :bw | <primitive: return sc.BBandStop(_in, _freq, _bw);> }
	BfDecode1 { :w :x :y :z :azimuth :elevation :wComp | <primitive: return sc.BfDecode1(_w, _x, _y, _z, _azimuth, _elevation, _wComp);> }
	BfEncode1 { :input :azimuth :elevation :rho :gain :wComp | <primitive: return sc.BfEncode1(_input, _azimuth, _elevation, _rho, _gain, _wComp);> }
	BHiPass { :in :freq :rq | <primitive: return sc.BHiPass(_in, _freq, _rq);> }
	BLowPass { :in :freq :rq | <primitive: return sc.BLowPass(_in, _freq, _rq);> }
	BMoog { :in :freq :q :mode :saturation | <primitive: return sc.BMoog(_in, _freq, _q, _mode, _saturation);> }	Bpf { :in :freq :rq | <primitive: return sc.Bpf(_in, _freq, _rq);> }
	Bpz2 { :in | <primitive: return sc.Bpz2(_in);> }
	BPeakEq { :in :freq :rq :db | <primitive: return sc.BPeakEq(_in, _freq, _rq, _db);> }
	Brf { :in :freq :rq | <primitive: return sc.Brf(_in, _freq, _rq);> }
	Brz2 { :in | <primitive: return sc.Brz2(_in);> }
	Balance2 { :left :right :pos :level | <primitive: return sc.Balance2(_left, _right, _pos, _level);> }
	Blip { :freq :numharm | <primitive: return sc.Blip(_freq, _numharm);> }
	BufDur { :bufnum | <primitive: return sc.BufDur(_bufnum);> }
	BufFrames { :bufnum | <primitive: return sc.BufFrames(_bufnum);> }
	BufRateScale { :bufnum | <primitive: return sc.BufRateScale(_bufnum);> }
	BufRd { :numChan :bufnum :phase :loop :interpolation | <primitive: return sc.BufRd(_numChan, _bufnum, _phase, _loop, _interpolation);> }
	BufSampleRate { :bufnum | <primitive: return sc.BufSampleRate(_bufnum);> }
	BufWr { :bufnum :phase :loop :inputArray | <primitive: return sc.BufWr(_bufnum, _phase, _loop, _inputArray);> }
	ClearBuf { :buf | <primitive: return sc.ClearBuf(_buf);> }
	Clip { :in :lo :hi | <primitive: return sc.Clip(_in, _lo, _hi);> }
	CoinGate { :prob :in | <primitive: return sc.CoinGate(_prob, _in);> }
	CombC { :in :maxdelaytime :delaytime :decaytime | <primitive: return sc.CombC(_in, _maxdelaytime, _delaytime, _decaytime);> }
	CombL { :in :maxdelaytime :delaytime :decaytime | <primitive: return sc.CombL(_in, _maxdelaytime, _delaytime, _decaytime);> }
	CombN { :in :maxdelaytime :delaytime :decaytime | <primitive: return sc.CombN(_in, _maxdelaytime, _delaytime, _decaytime);> }
	Compander { :in :control :thresh :slopeBelow :slopeAbove :clampTime :relaxTime | <primitive: return sc.Compander(_in, _control, _thresh, _slopeBelow, _slopeAbove, _clampTime, _relaxTime);> }
	Convolution { :in :kernel :framesize | <primitive: return sc.Convolution(_in, _kernel, _framesize);> }
	Crackle { :chaosParam | <primitive: return sc.Crackle(_chaosParam);> }
	CuspL { :freq :a :b :xi | <primitive: return sc.CuspL(_freq, _a, _b, _xi);> }
	CuspN { :freq :a :b :xi | <primitive: return sc.CuspN(_freq, _a, _b, _xi);> }
	Dc { :in | <primitive: return sc.Dc(_in);> }
	Dbrown { :length :lo :hi :step | <primitive: return sc.Dbrown(_length, _lo, _hi, _step);> }
	Dbufrd { :bufnum :phase :loop | <primitive: return sc.Dbufrd(_bufnum, _phase, _loop);> }
	Dbufwr { :bufnum :phase :input :loop | <primitive: return sc.Dbufwr(_bufnum, _phase, _input, _loop);> }
	Decay { :in :decayTime | <primitive: return sc.Decay(_in, _decayTime);> }
	Decay2 { :in :attackTime :decayTime | <primitive: return sc.Decay2(_in, _attackTime, _decayTime);> }
	DecodeB2 { :numChan :w :x :y :orientation | <primitive: return sc.DecodeB2(_numChan, _w, _x, _y, _orientation);> }
	DegreeToKey { :bufnum :in :octave | <primitive: return sc.DegreeToKey(_bufnum, _in, _octave);> }
	Delay1 { :in | <primitive: return sc.Delay1(_in);> }
	Delay2 { :in | <primitive: return sc.Delay2(_in);> }
	DelayC { :in :maxdelaytime :delaytime | <primitive: return sc.DelayC(_in, _maxdelaytime, _delaytime);> }
	DelayL { :in :maxdelaytime :delaytime | <primitive: return sc.DelayL(_in, _maxdelaytime, _delaytime);> }
	DelayMap { :bufNum :in :dynamic :spec | <primitive: return sc.DelayMap(_bufNum, _in, _dynamic, _spec);> }
	DelayN { :in :maxdelaytime :delaytime | <primitive: return sc.DelayN(_in, _maxdelaytime, _delaytime);> }
	Demand { :trig :reset :demandUGens | <primitive: return sc.Demand(_trig, _reset, _demandUGens);> }
	DetectIndex { :bufnum :input | <primitive: return sc.DetectIndex(_bufnum, _input);> }
	DetectSilence { :in :amp :time :doneAction | <primitive: return sc.DetectSilence(_in, _amp, _time, _doneAction);> }
	Ddup { :n :in | <primitive: return sc.Ddup(_n, _in);> }
	Demultiplexer { :numChannels :input :selector | <primitive: return sc.Demultiplexer(_numChannels, _input, _selector);> }
	Dgeom { :start :grow :length | <primitive: return sc.Dgeom(_start, _grow, _length);> }
	Dibrown { :length :lo :hi :step | <primitive: return sc.Dibrown(_length, _lo, _hi, _step);> }
	Diwhite { :length :lo :hi | <primitive: return sc.Diwhite(_length, _lo, _hi);> }
	Drand { :repeats :list | <primitive: return sc.Drand(_repeats, _list);> }
	Dseq { :repeats :list | <primitive: return sc.Dseq(_repeats, _list);> }
	Dser { :repeats :list | <primitive: return sc.Dser(_repeats, _list);> }
	Dseries { :length :start :step | <primitive: return sc.Dseries(_length, _start, _step);> }
	Dshuf { :repeats :list | <primitive: return sc.Dshuf(_repeats, _list);> }
	Dswitch { :index :list | <primitive: return sc.Dswitch(_index, _list);> }
	Dswitch1 { :index :list | <primitive: return sc.Dswitch1(_index, _list);> }
	DurationGate { :dur |  <primitive: return sc.DurationGate(_dur);> }
	Dust { :density | <primitive: return sc.Dust(_density);> }
	Dust2 { :density | <primitive: return sc.Dust2(_density);> }
	Duty { :dur :reset :level | <primitive: return sc.Duty(_dur, _reset, 0, _level);> }
	Dwhite { :length :lo :hi | <primitive: return sc.Dwhite(_length, _lo, _hi);> }
	Dwrand { :repeats :weights :list | <primitive: return sc.Dwrand(_repeats, _weights, _list);> }
	Dxrand { :repeats :list | <primitive: return sc.Dxrand(_repeats, _list);> }
	EnvGen { :gate :levelScale :levelBias :timeScale :doneAction :envelope | <primitive: return sc.EnvGen(_gate, _levelScale, _levelBias, _timeScale, _doneAction, _envelope);> }
	EnvTrapezoid { :trig :dur :shape :skew | <primitive: return sc.EnvTrapezoid(_trig, _dur, _shape, _skew);> }
	ExpRand { :lo :hi | <primitive: return sc.ExpRand(_lo, _hi);> }
	FbSineC { :freq :im :fb :a :c :xi :yi | <primitive: return sc.FbSineC(_freq, _im, _fb, _a, _c, _xi, _yi);> }
	FbSineL { :freq :im :fb :a :c :xi :yi | <primitive: return sc.FbSineL(_freq, _im, _fb, _a, _c, _xi, _yi);> }
	Fft { :buffer :in :hop :wintype :active :winsize | <primitive: return sc.Fft(_buffer, _in, _hop, _wintype, _active, _winsize);> }
	Fos { :in :a0 :a1 :b1 | <primitive: return sc.Fos(_in, _a0, _a1, _b1);> }
	FSinOsc { :freq :iphase | <primitive: return sc.FSinOsc(_freq, _iphase);> }
	Fold { :in :lo :hi | <primitive: return sc.Fold(_in, _lo, _hi);> }
	Formant { :fundfreq :formfreq :bwfreq | <primitive: return sc.Formant(_fundfreq, _formfreq, _bwfreq);> }
	Formlet { :in :freq :attacktime :decaytime | <primitive: return sc.Formlet(_in, _freq, _attacktime, _decaytime);> }
	FreeVerb { :in :mix :room :damp | <primitive: return sc.FreeVerb(_in, _mix, _room, _damp);> }
	FreeVerb2 { :in :in2 :mix :room :damp | <primitive: return sc.FreeVerb2(_in, _in2, _mix, _room, _damp);> }
	FreqShift { :in :freq :phase | <primitive: return sc.FreqShift(_in, _freq, _phase);> }
	GVerb { :in :roomsize :revtime :damping :inputbw :spread :drylevel :earlyreflevel :taillevel :maxroomsize | <primitive: return sc.GVerb(_in, _roomsize, _revtime, _damping, _inputbw, _spread, _drylevel, _earlyreflevel, _taillevel, _maxroomsize);> }
	Gate { :in :trig | <primitive: return sc.Gate(_in, _trig);> }
	GbmanN { :freq :xi :yi | <primitive: return sc.GbmanN(_freq, _xi, _yi);> }
	Gendy1 { :ampdist :durdist :adparam :ddparam :minfreq :maxfreq :ampscale :durscale :initCPs :knum | <primitive: return sc.Gendy1(_ampdist, _durdist, _adparam, _ddparam, _minfreq, _maxfreq, _ampscale, _durscale, _initCPs, _knum);> }
	Gendy2 { :ampdist :durdist :adparam :ddparam :minfreq :maxfreq :ampscale :durscale :initCPs :knum :a :c | <primitive: return sc.Gendy2(_ampdist, _durdist, _adparam, _ddparam, _minfreq, _maxfreq, _ampscale, _durscale, _initCPs, _knum, _a, _c);> }
	Gendy3 { :ampdist :durdist :adparam :ddparam :freq :ampscale :durscale :initCPs :knum | <primitive: return sc.Gendy3(_ampdist, _durdist, _adparam, _ddparam, _freq, _ampscale, _durscale, _initCPs, _knum);> }
	GrainBuf { :numChan :trigger :dur :sndbuf :rate :pos :interp :pan :envbufnum :maxGrains | <primitive: return sc.GrainBuf(_numChan, _trigger, _dur, _sndbuf, _rate, _pos, _interp, _pan, _envbufnum, _maxGrains);> }
	GrainFm { :numChan :trigger :dur :carfreq :modfreq :index :pan :envbufnum :maxGrains | <primitive: return sc.GrainFm(_numChan, _trigger, _dur, _carfreq, _modfreq, _index, _pan, _envbufnum, _maxGrains);> }
	GrainSin { :numChan :trigger :dur :freq :pan :envbufnum :maxGrains | <primitive: return sc.GrainSin(_numChan, _trigger, _dur, _freq, _pan, _envbufnum, _maxGrains);> }
	Hpf { :in :freq | <primitive: return sc.Hpf(_in, _freq);> }
	Hpz1 { :in | <primitive: return sc.Hpz1(_in);> }
	Hpz2 { :in | <primitive: return sc.Hpz2(_in);> }
	Hasher { :in | <primitive: return sc.Hasher(_in);> }
	HenonC { :freq :a :b :x0 :x1 | <primitive: return sc.HenonC(_freq, _a, _b, _x0, _x1);> }
	HenonL { :freq :a :b :x0 :x1 | <primitive: return sc.HenonL(_freq, _a, _b, _x0, _x1);> }
	HenonN { :freq :a :b :x0 :x1 | <primitive: return sc.HenonN(_freq, _a, _b, _x0, _x1);> }
	Ifft { :buffer :wintype :winsize | <primitive: return sc.Ifft(_buffer, _wintype, _winsize);> }
	IRand { :lo :hi | <primitive: return sc.IRand(_lo, _hi);> }
	Impulse { :freq :phase | <primitive: return sc.Impulse(_freq, _phase);> }
	In { :numChan :bus | <primitive: return sc.In(_numChan, _bus);> }
	InFeedback { :numChan :bus | <primitive: return sc.InFeedback(_numChan, _bus);> }
	InRange { :in :lo :hi | <primitive: return sc.InRange(_in, _lo, _hi);> }
	Index { :bufnum :in | <primitive: return sc.Index(_bufnum, _in);> }
	IndexInBetween { :bufnum :in | <primitive: return sc.IndexInBetween(_bufnum, _in);> }
	Integrator { :in :coef | <primitive: return sc.Integrator(_in, _coef);> }
	K2A { :in | <primitive: return sc.K2A(_in);> }
	KeyState { :keycode :minval :maxval :lag | <primitive: return sc.KeyState(_keycode, _minval, _maxval, _lag);> }
	Klang { :freqscale :freqoffset :specificationsArrayRef | <primitive: return sc.Klang(_freqscale, _freqoffset, _specificationsArrayRef);> }
	Klank { :input :freqscale :freqoffset :decayscale :specificationsArrayRef | <primitive: return sc.Klank(_input, _freqscale, _freqoffset, _decayscale, _specificationsArrayRef);> }
	LfClipNoise { :freq | <primitive: return sc.LfClipNoise(_freq);> }
	LfCub { :freq :iphase | <primitive: return sc.LfCub(_freq, _iphase);> }
	LfdClipNoise { :freq | <primitive: return sc.LfdClipNoise(_freq);> }
	LfdNoise0 { :freq | <primitive: return sc.LfdNoise0(_freq);> }
	LfdNoise1 { :freq | <primitive: return sc.LfdNoise1(_freq);> }
	LfdNoise3 { :freq | <primitive: return sc.LfdNoise3(_freq);> }
	LfGauss { :duration :width :iphase :loop :doneAction | <primitive: return sc.LfGauss(_duration, _width, _iphase, _loop, _doneAction);> }
	LfNoise0 { :freq | <primitive: return sc.LfNoise0(_freq);> }
	LfNoise1 { :freq | <primitive: return sc.LfNoise1(_freq);> }
	LfNoise2 { :freq | <primitive: return sc.LfNoise2(_freq);> }
	LfPar { :freq :iphase | <primitive: return sc.LfPar(_freq, _iphase);> }
	LfPulse { :freq :iphase :width | <primitive: return sc.LfPulse(_freq, _iphase, _width);> }
	LfSaw { :freq :iphase | <primitive: return sc.LfSaw(_freq, _iphase);> }
	LfTri { :freq :iphase | <primitive: return sc.LfTri(_freq, _iphase);> }
	Lpf { :in :freq | <primitive: return sc.Lpf(_in, _freq);> }
	Lpz1 { :in | <primitive: return sc.Lpz1(_in);> }
	Lpz2 { :in | <primitive: return sc.Lpz2(_in);> }
	Lag { :in :lagTime | <primitive: return sc.Lag(_in, _lagTime);> }
	Lag2 { :in :lagTime | <primitive: return sc.Lag2(_in, _lagTime);> }
	Lag3 { :in :lagTime | <primitive: return sc.Lag3(_in, _lagTime);> }
	Lag3Ud { :in :lagTimeU :lagTimeD | <primitive: return sc.Lag3Ud(_in, _lagTimeU, _lagTimeD);> }
	LagUd { :in :lagTimeU :lagTimeD | <primitive: return sc.LagUd(_in, _lagTimeU, _lagTimeD);> }
	Latch { :in :trig | <primitive: return sc.Latch(_in, _trig);> }
	LatoocarfianC { :freq :a :b :c :d :xi :yi | <primitive: return sc.LatoocarfianC(_freq, _a, _b, _c, _d, _xi, _yi);> }
	LeakDc { :in :coef | <primitive: return sc.LeakDc(_in, _coef);> }
	Limiter { :in :level :dur | <primitive: return sc.Limiter(_in, _level, _dur);> }
	LinCongC { :freq :a :c :m :xi | <primitive: return sc.LinCongC(_freq, _a, _c, _m, _xi);> }
	LinExp { :in :srclo :srchi :dstlo :dsthi | <primitive: return sc.LinExp(_in, _srclo, _srchi, _dstlo, _dsthi);> }
	LinPan2 { :in :pos :level | <primitive: return sc.LinPan2(_in, _pos, _level);> }
	LinRand { :lo :hi :minmax | <primitive: return sc.LinRand(_lo, _hi, _minmax);> }
	LinXFade2 { :inA :inB :pan | <primitive: return sc.LinXFade2(_inA, _inB, _pan);> }
	(*Line { :start :end :dur :doneAction | <primitive: return sc.Line(_start, _end, _dur, _doneAction);> }*)
	Linen { :gate :attackTime :susLevel :releaseTime :doneAction | <primitive: return sc.Linen(_gate, _attackTime, _susLevel, _releaseTime, _doneAction);> }
	LocalBuf { :numChannels :numFrames | <primitive: return sc.LocalBuf(_numChannels, _numFrames);> }
	LocalIn { :numChan :default | <primitive: return sc.LocalIn(_numChan, _default);> }
	LocalOut { :channelsArray | <primitive: return sc.LocalOut(_channelsArray);> }
	Logistic { :chaosParam :freq :init | <primitive: return sc.Logistic(_chaosParam, _freq, _init);> }
	LorenzL { :freq :s :r :b :h :xi :yi :zi | <primitive: return sc.LorenzL(_freq, _s, _r, _b, _h, _xi, _yi, _zi);> }
	MantissaMask { :in :bits | <primitive: return sc.MantissaMask(_in, _bits);> }
	Median { :length :in | <primitive: return sc.Median(_length, _in);> }
	MidEq { :in :freq :rq :db | <primitive: return sc.MidEq(_in, _freq, _rq, _db);> }
	ModDif { :x :y :mod | <primitive: return sc.ModDif(_x, _y, _mod);> }
	MoogFf { :in :freq :gain :reset | <primitive: return sc.MoogFf(_in, _freq, _gain, _reset);> }
	MoogVcf { :in :fco :res | <primitive: return sc.MoogVcf(_in, _fco, _res);> }
	MouseButton { :minval :maxval :lag | <primitive: return sc.MouseButton(_minval, _maxval, _lag);> }
	MouseX { :minval :maxval :warp :lag | <primitive: return sc.MouseX(_minval, _maxval, _warp, _lag);> }
	MouseY { :minval :maxval :warp :lag | <primitive: return sc.MouseY(_minval, _maxval, _warp, _lag);> }
	Multiplexer { :selector :inputArray | <primitive: return sc.Multiplexer(_selector, _inputArray);> }
	MVerb { :in1 :in2 :dampingFreq :density :bandwidthFreq :decay :predelay :size :gain :mix :earlyMix | <primitive: return sc.MVerb(_in1, _in2, _dampingFreq, _density, _bandwidthFreq, _decay, _predelay, _size, _gain, _mix, _earlyMix);> }
	NRand { :lo :hi :n | <primitive: return sc.NRand(_lo, _hi, _n);> }
	Normalizer { :in :level :dur | <primitive: return sc.Normalizer(_in, _level, _dur);> }
	OnePole { :in :coef | <primitive: return sc.OnePole(_in, _coef);> }
	OneZero { :in :coef | <primitive: return sc.OneZero(_in, _coef);> }
	Osc { :bufnum :freq :phase | <primitive: return sc.Osc(_bufnum, _freq, _phase);> }
	Out { :bus :channelsArray | <primitive: return sc.Out(_bus, _channelsArray);> }
	PvBinScramble { :buffer :wipe :width :trig | <primitive: return sc.PvBinScramble(_buffer, _wipe, _width, _trig);> }
	PvDiffuser { :buffer :trig | <primitive: return sc.PvDiffuser(_buffer, _trig);> }
	PvRandComb { :buffer :wipe :trig | <primitive: return sc.PvRandComb(_buffer, _wipe, _trig);> }
	Pan2 { :in :pos :level | <primitive: return sc.Pan2(_in, _pos, _level);> }
	PanAz { :numChan :in :pos :level :width :orientation | <primitive: return sc.PanAz(_numChan, _in, _pos, _level, _width, _orientation);> }
	PanB { :in :azimuth :elevation :gain | <primitive: return sc.PanB(_in, _azimuth, _elevation, _gain);> }
	PanB2 { :input :azimuth :gain | <primitive: return sc.PanB2(_input, _azimuth, _gain);> }
	PeakFollower { :in :decay | <primitive: return sc.PeakFollower(_in, _decay);> }
	Phasor { :trig :rate :start :end :resetPos | <primitive: return sc.Phasor(_trig, _rate, _start, _end, _resetPos);> }
	Pitch { :in :initFreq :minFreq :maxFreq :execFreq :maxBinsPerOctave :median :ampThreshold :peakThreshold :downSample :clar | <primitive: return sc.Pitch(_in, _initFreq, _minFreq, _maxFreq, _execFreq, _maxBinsPerOctave, _median, _ampThreshold, _peakThreshold, _downSample, _clar);> }
	PitchShift { :in :windowSize :pitchRatio :pitchDispersion :timeDispersion | <primitive: return sc.PitchShift(_in, _windowSize, _pitchRatio, _pitchDispersion, _timeDispersion);> }
	PlayBuf { :numChan :bufnum :rate :trigger :startPos :loop :doneAction | <primitive: return sc.PlayBuf(_numChan, _bufnum, _rate, _trigger, _startPos, _loop, _doneAction);> }
	Pluck { :in :trig :maxdelaytime :delaytime :decaytime :coef | <primitive: return sc.Pluck(_in, _trig, _maxdelaytime, _delaytime, _decaytime, _coef);> }
	Pulse { :freq :width | <primitive: return sc.Pulse(_freq, _width);> }
	PulseCount { :trig :reset | <primitive: return sc.PulseCount(_trig, _reset);> }
	PulseDivider { :trig :div :start | <primitive: return sc.PulseDivider(_trig, _div, _start);> }
	QuadC { :freq :a :b :c :xi | <primitive: return sc.QuadC(_freq, _a, _b, _c, _xi);> }
	QuadL { :freq :a :b :c :xi | <primitive: return sc.QuadL(_freq, _a, _b, _c, _xi);> }
	Rhpf { :in :freq :rq | <primitive: return sc.Rhpf(_in, _freq, _rq);> }
	Rlpf { :in :freq :rq | <primitive: return sc.Rlpf(_in, _freq, _rq);> }
	Rand { :lo :hi | <primitive: return sc.Rand(_lo, _hi);> }
	RecordBuf { :bufnum :offset :recLevel :preLevel :run :loop :trigger :doneAction :inputArray | <primitive: return sc.RecordBuf(_bufnum, _offset, _recLevel, _preLevel, _run, _loop, _trigger, _doneAction, _inputArray);> }
	ReplaceOut { :bus :channelsArray | <primitive: return sc.ReplaceOut(_bus, _channelsArray);> }
	Resonz { :in :freq :bwr | <primitive: return sc.Resonz(_in, _freq, _bwr);> }
	Ringz { :in :freq :decaytime | <primitive: return sc.Ringz(_in, _freq, _decaytime);> }
	Rotate2 { :x :y :pos | <primitive: return sc.Rotate2(_x, _y, _pos);> }
	RunningMax { :in :trig | <primitive: return sc.RunningMax(_in, _trig);> }
	RunningSum { :in :numsamp | <primitive: return sc.RunningSum(_in, _numsamp);> }
	Sos { :in :a0 :a1 :a2 :b1 :b2 | <primitive: return sc.Sos(_in, _a0, _a1, _a2, _b1, _b2);> }
	SamplerIndex { :bufNum :size :mnn | <primitive: return sc.SamplerIndex(_bufNum, _size, _mnn);> }
	Sanitize { :in :replace | <primitive: return sc.Sanitize(_in, _replace);> }
	Saw { :freq | <primitive: return sc.Saw(_freq);> }
	Schmidt { :in :lo :hi | <primitive: return sc.Schmidt(_in, _lo, _hi);> }
	Select { :which :array | <primitive: return sc.Select(_which, _array);> }
	SetResetFf { :trig :reset | <primitive: return sc.SetResetFf(_trig, _reset);> }
	SinOsc { :freq :phase | <primitive: return sc.SinOsc(_freq, _phase);> }
	SinOscFb { :freq :feedback | <primitive: return sc.SinOscFb(_freq, _feedback);> }
	Slew { :in :up :dn | <primitive: return sc.Slew(_in, _up, _dn);> }
	Slope { :in | <primitive: return sc.Slope(_in);> }
	Spring { :in :spring :damp | <primitive: return sc.Spring(_in, _spring, _damp);> }
	StandardL { :freq :k :xi :yi | <primitive: return sc.StandardL(_freq, _k, _xi, _yi);> }
	StandardN { :freq :k :xi :yi | <primitive: return sc.StandardN(_freq, _k, _xi, _yi);> }
	Stepper { :trig :reset :min :max :step :resetval | <primitive: return sc.Stepper(_trig, _reset, _min, _max, _step, _resetval);> }
	Sum4 { :in0 :in1 :in2 :in3 | <primitive: return sc.Sum4(_in0, _in1, _in2, _in3);> }
	Sweep { :trig :rate | <primitive: return sc.Sweep(_trig, _rate);> }
	SyncSaw { :syncFreq :sawFreq | <primitive: return sc.SyncSaw(_syncFreq, _sawFreq);> }
	TableRand { :trig :bufnum | <primitive: return sc.TableRand(_trig, _bufnum);> }
	TDelay { :in :dur | <primitive: return sc.TDelay(_in, _dur);> }
	TDuty { :dur :reset :level | <primitive: return sc.TDuty(_dur, _reset, 0, _level, 0);> }
	TExpRand { :lo :hi :trig | <primitive: return sc.TExpRand(_lo, _hi, _trig);> }
	TGrains { :numChan :trigger :bufnum :rate :centerPos :dur :pan :amp :interp | <primitive: return sc.TGrains(_numChan, _trigger, _bufnum, _rate, _centerPos, _dur, _pan, _amp, _interp);> }
	TiRand { :lo :hi :trig | <primitive: return sc.TiRand(_lo, _hi, _trig);> }
	TRand { :lo :hi :trig | <primitive: return sc.TRand(_lo, _hi, _trig);> }
	Timer { :trig | <primitive: return sc.Timer(_trig);> }
	ToggleFf { :trig | <primitive: return sc.ToggleFf(_trig);> }
	Trig { :in :dur | <primitive: return sc.Trig(_in, _dur);> }
	Trig1 { :in :dur | <primitive: return sc.Trig1(_in, _dur);> }
	TwIndex { :input :normalize :array | <primitive: return sc.TwIndex(_input, _normalize, _array);> }
	TwoPole { :in :freq :radius | <primitive: return sc.TwoPole(_in, _freq, _radius);> }
	TwoZero { :in :freq :radius | <primitive: return sc.TwoZero(_in, _freq, _radius);> }
	VarSaw { :freq :iphase :width | <primitive: return sc.VarSaw(_freq, _iphase, _width);> }
	Vibrato { :freq :rate :depth :delay :onset :rateVariation :depthVariation :iphase :trig | <primitive: return sc.Vibrato(_freq, _rate, _depth, _delay, _onset, _rateVariation, _depthVariation, _iphase, _trig);> }
	Warp1 { :numChan :bufnum :pointer :freqScale :windowSize :envbufnum :overlaps :windowRandRatio :interp | <primitive: return sc.Warp1(_numChan, _bufnum, _pointer, _freqScale, _windowSize, _envbufnum, _overlaps, _windowRandRatio, _interp);> }
	Wrap { :in :lo :hi | <primitive: return sc.Wrap(_in, _lo, _hi);> }
	WrapIndex { :bufnum :in | <primitive: return sc.WrapIndex(_bufnum, _in);> }
	XFade2 { :inA :inB :pan :level | <primitive: return sc.XFade2(_inA, _inB, _pan, _level);> }
	(*XLine { :start :end :dur :doneAction | <primitive: return sc.XLine(_start, _end, _dur, _doneAction);> }*)
	ZeroCrossing { :in | <primitive: return sc.ZeroCrossing(_in);> }
	MaxLocalBufs { :count | <primitive: return sc.MaxLocalBufs(_count);> }
	MulAdd { :in :mul :add | <primitive: return sc.MulAdd(_in, _mul, _add);> }
	SetBuf { :buf :offset :length :array | <primitive: return sc.SetBuf(_buf, _offset, _length, _array);> }
}

(* Auto-generated *)
+[Array, SmallFloat, Ugen] {
	AnalogFoldOsc { :freq :amp | <primitive: return sc.AnalogFoldOsc(_freq, _amp);> }
	Bezier { :haltAfter :dx :freq :phase :param | <primitive: return sc.Bezier(_haltAfter, _dx, _freq, _phase, _param);> }
	CrossoverDistortion { :in :amp :smooth | <primitive: return sc.CrossoverDistortion(_in, _amp, _smooth);> }
	Dfm1 { :in :freq :res :inputgain :type :noiselevel | <primitive: return sc.Dfm1(_in, _freq, _res, _inputgain, _type, _noiselevel);> }
	DwgPluckedStiff { :freq :amp :gate :pos :c1 :c3 :inp :release :fB | <primitive: return sc.DwgPluckedStiff(_freq, _amp, _gate, _pos, _c1, _c3, _inp, _release, _fB);> }
	DustRange { :iotMin :iotMax | <primitive: return sc.DustRange(_iotMin, _iotMax);> }
	Dx7 { :bufnum :on :off :data :vc :mnn :vel :pw :mw :bc :fc | <primitive: return sc.Dx7(_bufnum, _on, _off, _data, _vc, _mnn, _vel, _pw, _mw, _bc, _fc);> }
	Dx7Env { :gate :data :r1 :r2 :r3 :r4 :l1 :l2 :l3 :l4 :ol | <primitive: return sc.Dx7Env(_gate, _data, _r1, _r2, _r3, _r4, _l1, _l2, _l3, _l4, _ol);> }
	ExpRandN { :numChan :lo :hi | <primitive: return sc.ExpRandN(_numChan, _lo, _hi);> }
	Fm7 { :ctlMatrix :modMatrix | <primitive: return sc.Fm7(_ctlMatrix, _modMatrix);> }
	Freezer { :bufnum :left :right :gain :increment :incrementOffset :incrementRandom :rightRandom :syncPhaseTrigger :randomizePhaseTrigger :numberOfLoops | <primitive: return sc.Freezer(_bufnum, _left, _right, _gain, _increment, _incrementOffset, _incrementRandom, _rightRandom, _syncPhaseTrigger, _randomizePhaseTrigger, _numberOfLoops);> }
	Friction { :in :friction :spring :damp :mass :beltmass | <primitive: return sc.Friction(_in, _friction, _spring, _damp, _mass, _beltmass);> }
	GreyholeRaw { :in1 :in2 :damping :delaytime :diffusion :feedback :moddepth :modfreq :size | <primitive: return sc.GreyholeRaw(_in1, _in2, _damping, _delaytime, _diffusion, _feedback, _moddepth, _modfreq, _size);> }
	LfBrownNoise1 { :freq :dev :dist | <primitive: return sc.LfBrownNoise1(_freq, _dev, _dist);> }
	LinRandN { :numChan :lo :hi :minmax | <primitive: return sc.LinRandN(_numChan, _lo, _hi, _minmax);> }
	MembraneCircle { :excitation :tension :loss | <primitive: return sc.MembraneCircle(_excitation, _tension, _loss);> }
	MiBraids { :pitch :timbre :color :model :trig :resamp :decim :bits :ws | <primitive: return sc.MiBraids(_pitch, _timbre, _color, _model, _trig, _resamp, _decim, _bits, _ws);> }
	MiClouds { :pit :pos :size :dens :tex :drywet :inGain :spread :rvb :fb :freeze :mode :lofi :trig :inputArray | <primitive: return sc.MiClouds(_pit, _pos, _size, _dens, _tex, _drywet, _inGain, _spread, _rvb, _fb, _freeze, _mode, _lofi, _trig, _inputArray);> }
	MiRings { :in :trig :pit :struct :bright :damp :pos :model :poly :internExciter :easteregg :bypass | <primitive: return sc.MiRings(_in, _trig, _pit, _struct, _bright, _damp, _pos, _model, _poly, _internExciter, _easteregg, _bypass);> }
	MoogLadder { :in :ffreq :res | <primitive: return sc.MoogLadder(_in, _ffreq, _res);> }
	ObxdFilter { :in :cutoff :resonance :multimode :bandpass :fourpole | <primitive: return sc.ObxdFilter(_in, _cutoff, _resonance, _multimode, _bandpass, _fourpole);> }
	Perlin3 { :x :y :z | <primitive: return sc.Perlin3(_x, _y, _z);> }
	Rcd { :clock :rotate :reset :div :spread :auto :len :down :gates | <primitive: return sc.Rcd(_clock, _rotate, _reset, _div, _spread, _auto, _len, _down, _gates);> }
	RandN { :numChan :lo :hi | <primitive: return sc.RandN(_numChan, _lo, _hi);> }
	Scm { :clock :bpm :rotate :slip :shuffle :skip :pw | <primitive: return sc.Scm(_clock, _bpm, _rotate, _slip, _shuffle, _skip, _pw);> }
	ShufflerB { :bufnum :readLocationMinima :readLocationMaxima :readIncrementMinima :readIncrementMaxima :durationMinima :durationMaxima :envelopeAmplitudeMinima :envelopeAmplitudeMaxima :envelopeShapeMinima :envelopeShapeMaxima :envelopeSkewMinima :envelopeSkewMaxima :stereoLocationMinima :stereoLocationMaxima :interOffsetTimeMinima :interOffsetTimeMaxima :ftableReadLocationIncrement :readIncrementQuanta :interOffsetTimeQuanta | <primitive: return sc.ShufflerB(_bufnum, _readLocationMinima, _readLocationMaxima, _readIncrementMinima, _readIncrementMaxima, _durationMinima, _durationMaxima, _envelopeAmplitudeMinima, _envelopeAmplitudeMaxima, _envelopeShapeMinima, _envelopeShapeMaxima, _envelopeSkewMinima, _envelopeSkewMaxima, _stereoLocationMinima, _stereoLocationMaxima, _interOffsetTimeMinima, _interOffsetTimeMaxima, _ftableReadLocationIncrement, _readIncrementQuanta, _interOffsetTimeQuanta);> }
	SinGrain { :trigger :dur :freq | <primitive: return sc.SinGrain(_trigger, _dur, _freq);> }
	SvfBp { :in :freq :q | <primitive: return sc.SvfBp(_in, _freq, _q);> }
	SvfHp { :in :freq :q | <primitive: return sc.SvfHp(_in, _freq, _q);> }
	SvfLp { :in :freq :q | <primitive: return sc.SvfLp(_in, _freq, _q);> }
	TLinRand { :lo :hi :minmax :trigger | <primitive: return sc.TLinRand(_lo, _hi, _minmax, _trigger);> }
	TScramble { :trigger :inputs | <primitive: return sc.TScramble(_trigger, _inputs);> }
	TrigAllocator { :numChannels :algorithm :in :dur | <primitive: return sc.TrigAllocator(_numChannels, _algorithm, _in, _dur);> }
	TrigRoundRobin { :numChannels :in | <primitive: return sc.TrigRoundRobin(_numChannels, _in);> }
	VbJonVerb { :in :decay :damping :inputbw :erfl :tail | <primitive: return sc.VbJonVerb(_in, _decay, _damping, _inputbw, _erfl, _tail);> }
	Vosim { :trig :freq :nCycles :decay | <primitive: return sc.Vosim(_trig, _freq, _nCycles, _decay);> }
	WaveLoss { :in :drop :outof :mode | <primitive: return sc.WaveLoss(_in, _drop, _outof, _mode);> }
	WDistances { :gate :x :y :z :coordinateArray | <primitive: return sc.WDistances(_gate, _x, _y, _z, _coordinateArray);> }
	WkNearest { :numChannels :gate :x :y :z :coordinateArray | <primitive: return sc.WkNearest(_numChannels, _gate, _x, _y, _z, _coordinateArray);> }
}

(* Auto-generated *)
+[Array, Ugen] {
	Neg { :self | <primitive: return sc.Neg(_self);> }
	Squared { :self | <primitive: return sc.Squared(_self);> }
	Cubed { :self | <primitive: return sc.Cubed(_self);> }
	Recip { :self | <primitive: return sc.Recip(_self);> }
	MidiCps { :self | <primitive: return sc.MidiCps(_self);> }
	CpsMidi { :self | <primitive: return sc.CpsMidi(_self);> }
	MidiRatio { :self | <primitive: return sc.MidiRatio(_self);> }
	RatioMidi { :self | <primitive: return sc.RatioMidi(_self);> }
	DbAmp { :self | <primitive: return sc.DbAmp(_self);> }
	AmpDb { :self | <primitive: return sc.AmpDb(_self);> }
	Distort { :self | <primitive: return sc.Distort(_self);> }
	SoftClip { :self | <primitive: return sc.SoftClip(_self);> }
}

(* Auto-generated *)
+[Array, SmallFloat, Ugen] {
	Abs { :self | <primitive: return sc.Abs(_self);> }
	Ceiling { :self | <primitive: return sc.Ceil(_self);> }
	Floor { :self | <primitive: return sc.Floor(_self);> }
	Frac { :self | <primitive: return sc.Frac(_self);> }
	Sign { :self | <primitive: return sc.Sign(_self);> }
	Sqrt { :self | <primitive: return sc.Sqrt(_self);> }
	Exp { :self | <primitive: return sc.Exp(_self);> }
	Log { :self | <primitive: return sc.Log(_self);> }
	Log2 { :self | <primitive: return sc.Log2(_self);> }
	Log10 { :self | <primitive: return sc.Log10(_self);> }
	Sin { :self | <primitive: return sc.Sin(_self);> }
	Cos { :self | <primitive: return sc.Cos(_self);> }
	Tan { :self | <primitive: return sc.Tan(_self);> }
	ArcSin { :self | <primitive: return sc.ArcSin(_self);> }
	ArcCos { :self | <primitive: return sc.ArcCos(_self);> }
	ArcTan { :self | <primitive: return sc.ArcTan(_self);> }
	Sinh { :self | <primitive: return sc.Sinh(_self);> }
	Cosh { :self | <primitive: return sc.Cosh(_self);> }
	Tanh { :self | <primitive: return sc.Tanh(_self);> }
	BiLinRand { :self | <primitive: return sc.BiLinRand(_self);> }
	LinRand { :self | <primitive: return sc.LinRand_(_self);> }
	Sum3Rand { :self | <primitive: return sc.Sum3Rand(_self);> }
	Coin { :self | <primitive: return sc.Coin(_self);> }

}

(* Auto-generated *)
+[Array, SmallFloat, Ugen] {
	Add { :self :anObject | <primitive: return sc.Add(_self, _anObject);> }
	Sub { :self :anObject | <primitive: return sc.Sub(_self, _anObject);> }
	Mul { :self :anObject | <primitive: return sc.Mul(_self, _anObject);> }
	Idiv { :self :anObject | <primitive: return sc.Idiv(_self, _anObject);> }
	Fdiv { :self :anObject | <primitive: return sc.Fdiv(_self, _anObject);> }
	Mod { :self :anObject | <primitive: return sc.Mod(_self, _anObject);> }
	Ne { :self :anObject | <primitive: return sc.Ne(_self, _anObject);> }
	Lt { :self :anObject | <primitive: return sc.Lt(_self, _anObject);> }
	Gt { :self :anObject | <primitive: return sc.Gt(_self, _anObject);> }
	Le { :self :anObject | <primitive: return sc.Le(_self, _anObject);> }
	Ge { :self :anObject | <primitive: return sc.Ge(_self, _anObject);> }
	Min { :self :anObject | <primitive: return sc.Min(_self, _anObject);> }
	Max { :self :anObject | <primitive: return sc.Max(_self, _anObject);> }
	BitAnd { :self :anObject | <primitive: return sc.BitAnd(_self, _anObject);> }
	BitOr { :self :anObject | <primitive: return sc.BitOr(_self, _anObject);> }
	Lcm { :self :anObject | <primitive: return sc.Lcm(_self, _anObject);> }
	Gcd { :self :anObject | <primitive: return sc.Gcd(_self, _anObject);> }
	RoundTo { :self :anObject | <primitive: return sc.RoundTo(_self, _anObject);> }
	Trunc { :self :anObject | <primitive: return sc.Trunc(_self, _anObject);> }
	Atan2 { :self :anObject | <primitive: return sc.Atan2(_self, _anObject);> }
	Hypot { :self :anObject | <primitive: return sc.Hypot(_self, _anObject);> }
	Pow { :self :anObject | <primitive: return sc.Pow(_self, _anObject);> }
	ShiftLeft { :self :anObject | <primitive: return sc.ShiftLeft(_self, _anObject);> }
	ShiftRight { :self :anObject | <primitive: return sc.ShiftRight(_self, _anObject);> }
	AmClip { :self :anObject | <primitive: return sc.AmClip(_self, _anObject);> }
	ScaleNeg { :self :anObject | <primitive: return sc.ScaleNeg(_self, _anObject);> }
	Clip2 { :self :anObject | <primitive: return sc.Clip2(_self, _anObject);> }
	Fold2 { :self :anObject | <primitive: return sc.Fold2(_self, _anObject);> }
	Wrap2 { :self :anObject | <primitive: return sc.Wrap2(_self, _anObject);> }
	Excess { :self :anObject | <primitive: return sc.Excess(_self, _anObject);> }
	Ring1 { :self :anObject | <primitive: return sc.Ring1(_self, _anObject);> }
	AbsDif { :self :anObject | <primitive: return sc.AbsDif(_self, _anObject);> }
	SqrDif { :self :anObject | <primitive: return sc.SqrDif(_self, _anObject);> }
	FirstArg { :self :anObject | <primitive: return sc.FirstArg(_self, _anObject);> }
	RandRange { :self :anObject | <primitive: return sc.RandRange(_self, _anObject);> }
	ExpRandRange { :self :anObject | <primitive: return sc.ExpRandRange(_self, _anObject);> }
}

+Ugen {

	(*
		ceiling { :self | <primitive: return sc.Ceil(_self);> }
		fractionPart { :self | <primitive: return sc.Frac(_self);> }
		negated { :self | <primitive: return sc.Neg(_self);> }
		reciprocal { :self | <primitive: return sc.Recip(_self);> }
	*)

	bitShiftLeft { :self :anObject |
		<primitive: return sc.ShiftLeft(_self, _anObject);>
	}

	bitShiftRight { :self :anObject |
		<primitive: return sc.ShiftRight(_self, _anObject);>
	}

	rounded { :self |
		RoundTo(self, 1)
	}

	truncateTo { :self :anObject |
		<primitive: return sc.Trunc(_self, _anObject);>
	}

	UnitCps { :self |
		(self * 100).MidiCps
	}

	+ { :self :anObject | <primitive: return sc.Add(_self, _anObject);> }
	* { :self :anObject | <primitive: return sc.Mul(_self, _anObject);> }
	- { :self :anObject | <primitive: return sc.Sub(_self, _anObject);> }
	/ { :self :anObject | <primitive: return sc.Fdiv(_self, _anObject);> }
	// { :self :anObject | <primitive: return sc.Idiv(_self, _anObject);> }
	% { :self :anObject | <primitive: return sc.Mod(_self, _anObject);> }
	= { :self :anObject | <primitive: return sc.Eq(_self, _anObject);> }
	~= { :self :anObject | <primitive: return sc.Ne(_self, _anObject);> }
	< { :self :anObject | <primitive: return sc.Lt(_self, _anObject);> }
	> { :self :anObject | <primitive: return sc.Gt(_self, _anObject);> }
	<= { :self :anObject | <primitive: return sc.Le(_self, _anObject);> }
	>= { :self :anObject | <primitive: return sc.Ge(_self, _anObject);> }
	^ { :self :anObject | <primitive: return sc.Pow(_self, _anObject);> }
	<< { :self :anObject | <primitive: return sc.ShiftLeft(_self, _anObject);> }
	>> { :self :anObject | <primitive: return sc.ShiftRight(_self, _anObject);> }

}
