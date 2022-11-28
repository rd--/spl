+ Void {
	BlockSize { <primitive: return sc.BlockSize();> }
	BrownNoise { <primitive: return sc.BrownNoise();> }
	ClipNoise { <primitive: return sc.ClipNoise();> }
	ControlDur { <primitive: return sc.ControlDur();> }
	ControlRate { <primitive: return sc.ControlRate();> }
	GrayNoise { <primitive: return sc.GrayNoise();> }
	InfoUGenBase { <primitive: return sc.InfoUGenBase();> }
	NodeID { <primitive: return sc.NodeID();> }
	NumAudioBuses { <primitive: return sc.NumAudioBuses();> }
	NumBuffers { <primitive: return sc.NumBuffers();> }
	NumControlBuses { <primitive: return sc.NumControlBuses();> }
	NumInputBuses { <primitive: return sc.NumInputBuses();> }
	NumOutputBuses { <primitive: return sc.NumOutputBuses();> }
	NumRunningSynths { <primitive: return sc.NumRunningSynths();> }
	PinkNoise { <primitive: return sc.PinkNoise();> }
	RadiansPerSample { <primitive: return sc.RadiansPerSample();> }
	SampleDur { <primitive: return sc.SampleDur();> }
	SampleRate { <primitive: return sc.SampleRate();> }
	SubsampleOffset { <primitive: return sc.SubsampleOffset();> }
	WhiteNoise { <primitive: return sc.WhiteNoise();> }
}

+ Object {
	BinaryOpUGen { :a :b | <primitive: return sc.BinaryOpUGen(_a, _b);> }
	UnaryOpUGen { :a | <primitive: return sc.UnaryOpUGen(_a);> }
	A2K { :in | <primitive: return sc.A2K(_in);> }
	Apf { :in :freq :radius | <primitive: return sc.APF(_in, _freq, _radius);> }
	AllpassC { :in :maxdelaytime :delaytime :decaytime | <primitive: return sc.AllpassC(_in, _maxdelaytime, _delaytime, _decaytime);> }
	AllpassL { :in :maxdelaytime :delaytime :decaytime | <primitive: return sc.AllpassL(_in, _maxdelaytime, _delaytime, _decaytime);> }
	AllpassN { :in :maxdelaytime :delaytime :decaytime | <primitive: return sc.AllpassN(_in, _maxdelaytime, _delaytime, _decaytime);> }
	AmpComp { :freq :root :exp | <primitive: return sc.AmpComp(_freq, _root, _exp);> }
	AmpCompA { :freq :root :minAmp :rootAmp | <primitive: return sc.AmpCompA(_freq, _root, _minAmp, _rootAmp);> }
	Amplitude { :in :attackTime :releaseTime | <primitive: return sc.Amplitude(_in, _attackTime, _releaseTime);> }
	BAllPass { :in :freq :rq | <primitive: return sc.BAllPass(_in, _freq, _rq);> }
	BBandPass { :in :freq :bw | <primitive: return sc.BBandPass(_in, _freq, _bw);> }
	BBandStop { :in :freq :bw | <primitive: return sc.BBandStop(_in, _freq, _bw);> }
	BHiPass { :in :freq :rq | <primitive: return sc.BHiPass(_in, _freq, _rq);> }
	BHiShelf { :in :freq :rs :db | <primitive: return sc.BHiShelf(_in, _freq, _rs, _db);> }
	BLowPass { :in :freq :rq | <primitive: return sc.BLowPass(_in, _freq, _rq);> }
	BLowShelf { :in :freq :rs :db | <primitive: return sc.BLowShelf(_in, _freq, _rs, _db);> }
	Bpf { :in :freq :rq | <primitive: return sc.BPF(_in, _freq, _rq);> }
	Bpz2 { :in | <primitive: return sc.BPZ2(_in);> }
	BPeakEq { :in :freq :rq :db | <primitive: return sc.BPeakEQ(_in, _freq, _rq, _db);> }
	Brf { :in :freq :rq | <primitive: return sc.BRF(_in, _freq, _rq);> }
	Brz2 { :in | <primitive: return sc.BRZ2(_in);> }
	Balance2 { :left :right :pos :level | <primitive: return sc.Balance2(_left, _right, _pos, _level);> }
	Ball { :in :g :damp :friction | <primitive: return sc.Ball(_in, _g, _damp, _friction);> }
	BeatTrack { :chain :lock | <primitive: return sc.BeatTrack(_chain, _lock);> }
	BeatTrack2 { :busindex :numfeatures :windowsize :phaseaccuracy :lock :weightingscheme | <primitive: return sc.BeatTrack2(_busindex, _numfeatures, _windowsize, _phaseaccuracy, _lock, _weightingscheme);> }
	BiPanB2 { :inA :inB :azimuth :gain | <primitive: return sc.BiPanB2(_inA, _inB, _azimuth, _gain);> }
	Blip { :freq :numharm | <primitive: return sc.Blip(_freq, _numharm);> }
	BufAllpassC { :buf :in :delaytime :decaytime | <primitive: return sc.BufAllpassC(_buf, _in, _delaytime, _decaytime);> }
	BufAllpassL { :buf :in :delaytime :decaytime | <primitive: return sc.BufAllpassL(_buf, _in, _delaytime, _decaytime);> }
	BufAllpassN { :buf :in :delaytime :decaytime | <primitive: return sc.BufAllpassN(_buf, _in, _delaytime, _decaytime);> }
	BufChannels { :bufnum | <primitive: return sc.BufChannels(_bufnum);> }
	BufCombC { :buf :in :delaytime :decaytime | <primitive: return sc.BufCombC(_buf, _in, _delaytime, _decaytime);> }
	BufCombL { :buf :in :delaytime :decaytime | <primitive: return sc.BufCombL(_buf, _in, _delaytime, _decaytime);> }
	BufCombN { :buf :in :delaytime :decaytime | <primitive: return sc.BufCombN(_buf, _in, _delaytime, _decaytime);> }
	BufDelayC { :buf :in :delaytime | <primitive: return sc.BufDelayC(_buf, _in, _delaytime);> }
	BufDelayL { :buf :in :delaytime | <primitive: return sc.BufDelayL(_buf, _in, _delaytime);> }
	BufDelayN { :buf :in :delaytime | <primitive: return sc.BufDelayN(_buf, _in, _delaytime);> }
	BufDur { :bufnum | <primitive: return sc.BufDur(_bufnum);> }
	BufFrames { :bufnum | <primitive: return sc.BufFrames(_bufnum);> }
	BufRateScale { :bufnum | <primitive: return sc.BufRateScale(_bufnum);> }
	BufRd { :numChan :bufnum :phase :loop :interpolation | <primitive: return sc.BufRd(_numChan, _bufnum, _phase, _loop, _interpolation);> }
	BufSampleRate { :bufnum | <primitive: return sc.BufSampleRate(_bufnum);> }
	BufSamples { :bufnum | <primitive: return sc.BufSamples(_bufnum);> }
	BufWr { :bufnum :phase :loop :inputArray | <primitive: return sc.BufWr(_bufnum, _phase, _loop, _inputArray);> }
	COsc { :bufnum :freq :beats | <primitive: return sc.COsc(_bufnum, _freq, _beats);> }
	CheckBadValues { :in :id :post | <primitive: return sc.CheckBadValues(_in, _id, _post);> }
	ClearBuf { :buf | <primitive: return sc.ClearBuf(_buf);> }
	Clip { :in :lo :hi | <primitive: return sc.Clip(_in, _lo, _hi);> }
	CoinGate { :prob :in | <primitive: return sc.CoinGate(_prob, _in);> }
	CombC { :in :maxdelaytime :delaytime :decaytime | <primitive: return sc.CombC(_in, _maxdelaytime, _delaytime, _decaytime);> }
	CombL { :in :maxdelaytime :delaytime :decaytime | <primitive: return sc.CombL(_in, _maxdelaytime, _delaytime, _decaytime);> }
	CombN { :in :maxdelaytime :delaytime :decaytime | <primitive: return sc.CombN(_in, _maxdelaytime, _delaytime, _decaytime);> }
	Compander { :in :control :thresh :slopeBelow :slopeAbove :clampTime :relaxTime | <primitive: return sc.Compander(_in, _control, _thresh, _slopeBelow, _slopeAbove, _clampTime, _relaxTime);> }
	CompanderD { :in :thresh :slopeBelow :slopeAbove :clampTime :relaxTime | <primitive: return sc.CompanderD(_in, _thresh, _slopeBelow, _slopeAbove, _clampTime, _relaxTime);> }
	Convolution { :in :kernel :framesize | <primitive: return sc.Convolution(_in, _kernel, _framesize);> }
	Convolution2 { :in :kernel :trigger :framesize | <primitive: return sc.Convolution2(_in, _kernel, _trigger, _framesize);> }
	Convolution2L { :in :kernel :trigger :framesize :crossfade | <primitive: return sc.Convolution2L(_in, _kernel, _trigger, _framesize, _crossfade);> }
	Convolution3 { :in :kernel :trigger :framesize | <primitive: return sc.Convolution3(_in, _kernel, _trigger, _framesize);> }
	Crackle { :chaosParam | <primitive: return sc.Crackle(_chaosParam);> }
	CuspL { :freq :a :b :xi | <primitive: return sc.CuspL(_freq, _a, _b, _xi);> }
	CuspN { :freq :a :b :xi | <primitive: return sc.CuspN(_freq, _a, _b, _xi);> }
	Dc { :in | <primitive: return sc.DC(_in);> }
	Dbrown { :length :lo :hi :step | <primitive: return sc.Dbrown(_length, _lo, _hi, _step);> }
	Dbufrd { :bufnum :phase :loop | <primitive: return sc.Dbufrd(_bufnum, _phase, _loop);> }
	Dbufwr { :bufnum :phase :input :loop | <primitive: return sc.Dbufwr(_bufnum, _phase, _input, _loop);> }
	Dconst { :sum :in :tolerance | <primitive: return sc.Dconst(_sum, _in, _tolerance);> }
	Decay { :in :decayTime | <primitive: return sc.Decay(_in, _decayTime);> }
	Decay2 { :in :attackTime :decayTime | <primitive: return sc.Decay2(_in, _attackTime, _decayTime);> }
	DecodeB2 { :numChan :w :x :y :orientation | <primitive: return sc.DecodeB2(_numChan, _w, _x, _y, _orientation);> }
	DegreeToKey { :bufnum :in :octave | <primitive: return sc.DegreeToKey(_bufnum, _in, _octave);> }
	DelTapRd { :buffer :phase :delTime :interp | <primitive: return sc.DelTapRd(_buffer, _phase, _delTime, _interp);> }
	DelTapWr { :buffer :in | <primitive: return sc.DelTapWr(_buffer, _in);> }
	Delay1 { :in | <primitive: return sc.Delay1(_in);> }
	Delay2 { :in | <primitive: return sc.Delay2(_in);> }
	DelayC { :in :maxdelaytime :delaytime | <primitive: return sc.DelayC(_in, _maxdelaytime, _delaytime);> }
	DelayL { :in :maxdelaytime :delaytime | <primitive: return sc.DelayL(_in, _maxdelaytime, _delaytime);> }
	DelayN { :in :maxdelaytime :delaytime | <primitive: return sc.DelayN(_in, _maxdelaytime, _delaytime);> }
	Demand { :trig :reset :demandUGens | <primitive: return sc.Demand(_trig, _reset, _demandUGens);> }
	DemandEnvGen { :level :dur :shape :curve :gate :reset :levelScale :levelBias :timeScale :doneAction | <primitive: return sc.DemandEnvGen(_level, _dur, _shape, _curve, _gate, _reset, _levelScale, _levelBias, _timeScale, _doneAction);> }
	DetectIndex { :bufnum :in | <primitive: return sc.DetectIndex(_bufnum, _in);> }
	DetectSilence { :in :amp :time :doneAction | <primitive: return sc.DetectSilence(_in, _amp, _time, _doneAction);> }
	Dgeom { :length :start :grow | <primitive: return sc.Dgeom(_length, _start, _grow);> }
	Dibrown { :length :lo :hi :step | <primitive: return sc.Dibrown(_length, _lo, _hi, _step);> }
	DiskIn { :numChan :bufnum :loop | <primitive: return sc.DiskIn(_numChan, _bufnum, _loop);> }
	DiskOut { :bufnum :channelsArray | <primitive: return sc.DiskOut(_bufnum, _channelsArray);> }
	Diwhite { :length :lo :hi | <primitive: return sc.Diwhite(_length, _lo, _hi);> }
	Done { :src | <primitive: return sc.Done(_src);> }
	Dpoll { :in :label :run :trigid | <primitive: return sc.Dpoll(_in, _label, _run, _trigid);> }
	Drand { :repeats :list | <primitive: return sc.Drand(_repeats, _list);> }
	Dreset { :in :reset | <primitive: return sc.Dreset(_in, _reset);> }
	Dseq { :repeats :list | <primitive: return sc.Dseq(_repeats, _list);> }
	Dser { :repeats :list | <primitive: return sc.Dser(_repeats, _list);> }
	Dseries { :length :start :step | <primitive: return sc.Dseries(_length, _start, _step);> }
	Dshuf { :repeats :list | <primitive: return sc.Dshuf(_repeats, _list);> }
	Dstutter { :n :in | <primitive: return sc.Dstutter(_n, _in);> }
	Dswitch { :index :list | <primitive: return sc.Dswitch(_index, _list);> }
	Dswitch1 { :index :list | <primitive: return sc.Dswitch1(_index, _list);> }
	Dunique { :source :maxBufferSize :protected | <primitive: return sc.Dunique(_source, _maxBufferSize, _protected);> }
	Dust { :density | <primitive: return sc.Dust(_density);> }
	Dust2 { :density | <primitive: return sc.Dust2(_density);> }
	Duty { :dur :reset :doneAction :level | <primitive: return sc.Duty(_dur, _reset, _doneAction, _level);> }
	Dwhite { :length :lo :hi | <primitive: return sc.Dwhite(_length, _lo, _hi);> }
	Dwrand { :repeats :weights :list | <primitive: return sc.Dwrand(_repeats, _weights, _list);> }
	Dxrand { :repeats :list | <primitive: return sc.Dxrand(_repeats, _list);> }
	EnvGen { :gate :levelScale :levelBias :timeScale :doneAction :envelope | <primitive: return sc.EnvGen(_gate, _levelScale, _levelBias, _timeScale, _doneAction, _envelope);> }
	ExpRand { :lo :hi | <primitive: return sc.ExpRand(_lo, _hi);> }
	FbSineC { :freq :im :fb :a :c :xi :yi | <primitive: return sc.FBSineC(_freq, _im, _fb, _a, _c, _xi, _yi);> }
	FbSineL { :freq :im :fb :a :c :xi :yi | <primitive: return sc.FBSineL(_freq, _im, _fb, _a, _c, _xi, _yi);> }
	FBSineN { :freq :im :fb :a :c :xi :yi | <primitive: return sc.FBSineN(_freq, _im, _fb, _a, _c, _xi, _yi);> }
	Fft { :buffer :in :hop :wintype :active :winsize | <primitive: return sc.FFT(_buffer, _in, _hop, _wintype, _active, _winsize);> }
	Fos { :in :a0 :a1 :b1 | <primitive: return sc.FOS(_in, _a0, _a1, _b1);> }
	FSinOsc { :freq :iphase | <primitive: return sc.FSinOsc(_freq, _iphase);> }
	Fold { :in :lo :hi | <primitive: return sc.Fold(_in, _lo, _hi);> }
	Formant { :fundfreq :formfreq :bwfreq | <primitive: return sc.Formant(_fundfreq, _formfreq, _bwfreq);> }
	Formlet { :in :freq :attacktime :decaytime | <primitive: return sc.Formlet(_in, _freq, _attacktime, _decaytime);> }
	Free { :trig :id | <primitive: return sc.Free(_trig, _id);> }
	FreeSelf { :in | <primitive: return sc.FreeSelf(_in);> }
	FreeSelfWhenDone { :src | <primitive: return sc.FreeSelfWhenDone(_src);> }
	FreeVerb { :in :mix :room :damp | <primitive: return sc.FreeVerb(_in, _mix, _room, _damp);> }
	FreeVerb2 { :in :in2 :mix :room :damp | <primitive: return sc.FreeVerb2(_in, _in2, _mix, _room, _damp);> }
	FreqShift { :in :freq :phase | <primitive: return sc.FreqShift(_in, _freq, _phase);> }
	GVerb { :in :roomsize :revtime :damping :inputbw :spread :drylevel :earlyreflevel :taillevel :maxroomsize | <primitive: return sc.GVerb(_in, _roomsize, _revtime, _damping, _inputbw, _spread, _drylevel, _earlyreflevel, _taillevel, _maxroomsize);> }
	Gate { :in :trig | <primitive: return sc.Gate(_in, _trig);> }
	GbmanL { :freq :xi :yi | <primitive: return sc.GbmanL(_freq, _xi, _yi);> }
	GbmanN { :freq :xi :yi | <primitive: return sc.GbmanN(_freq, _xi, _yi);> }
	Gendy1 { :ampdist :durdist :adparam :ddparam :minfreq :maxfreq :ampscale :durscale :initCPs :knum | <primitive: return sc.Gendy1(_ampdist, _durdist, _adparam, _ddparam, _minfreq, _maxfreq, _ampscale, _durscale, _initCPs, _knum);> }
	Gendy2 { :ampdist :durdist :adparam :ddparam :minfreq :maxfreq :ampscale :durscale :initCPs :knum :a :c | <primitive: return sc.Gendy2(_ampdist, _durdist, _adparam, _ddparam, _minfreq, _maxfreq, _ampscale, _durscale, _initCPs, _knum, _a, _c);> }
	Gendy3 { :ampdist :durdist :adparam :ddparam :freq :ampscale :durscale :initCPs :knum | <primitive: return sc.Gendy3(_ampdist, _durdist, _adparam, _ddparam, _freq, _ampscale, _durscale, _initCPs, _knum);> }
	GrainBuf { :numChan :trigger :dur :sndbuf :rate :pos :interp :pan :envbufnum :maxGrains | <primitive: return sc.GrainBuf(_numChan, _trigger, _dur, _sndbuf, _rate, _pos, _interp, _pan, _envbufnum, _maxGrains);> }
	GrainFm { :numChan :trigger :dur :carfreq :modfreq :index :pan :envbufnum :maxGrains | <primitive: return sc.GrainFM(_numChan, _trigger, _dur, _carfreq, _modfreq, _index, _pan, _envbufnum, _maxGrains);> }
	GrainIn { :numChan :trigger :dur :in :pan :envbufnum :maxGrains | <primitive: return sc.GrainIn(_numChan, _trigger, _dur, _in, _pan, _envbufnum, _maxGrains);> }
	GrainSin { :numChan :trigger :dur :freq :pan :envbufnum :maxGrains | <primitive: return sc.GrainSin(_numChan, _trigger, _dur, _freq, _pan, _envbufnum, _maxGrains);> }
	Hpf { :in :freq | <primitive: return sc.HPF(_in, _freq);> }
	Hpz1 { :in | <primitive: return sc.HPZ1(_in);> }
	Hpz2 { :in | <primitive: return sc.HPZ2(_in);> }
	Hasher { :in | <primitive: return sc.Hasher(_in);> }
	HenonC { :freq :a :b :x0 :x1 | <primitive: return sc.HenonC(_freq, _a, _b, _x0, _x1);> }
	HenonL { :freq :a :b :x0 :x1 | <primitive: return sc.HenonL(_freq, _a, _b, _x0, _x1);> }
	HenonN { :freq :a :b :x0 :x1 | <primitive: return sc.HenonN(_freq, _a, _b, _x0, _x1);> }
	Hilbert { :in | <primitive: return sc.Hilbert(_in);> }
	IEnvGen { :index :envelope | <primitive: return sc.IEnvGen(_index, _envelope);> }
	Ifft { :buffer :wintype :winsize | <primitive: return sc.IFFT(_buffer, _wintype, _winsize);> }
	IRand { :lo :hi | <primitive: return sc.IRand(_lo, _hi);> }
	Impulse { :freq :phase | <primitive: return sc.Impulse(_freq, _phase);> }
	In { :numChan :bus | <primitive: return sc.In(_numChan, _bus);> }
	InFeedback { :numChan :bus | <primitive: return sc.InFeedback(_numChan, _bus);> }
	InRange { :in :lo :hi | <primitive: return sc.InRange(_in, _lo, _hi);> }
	InRect { :x :y :rect | <primitive: return sc.InRect(_x, _y, _rect);> }
	InTrig { :numChan :bus | <primitive: return sc.InTrig(_numChan, _bus);> }
	Index { :bufnum :in | <primitive: return sc.Index(_bufnum, _in);> }
	IndexInBetween { :bufnum :in | <primitive: return sc.IndexInBetween(_bufnum, _in);> }
	IndexL { :bufnum :in | <primitive: return sc.IndexL(_bufnum, _in);> }
	Integrator { :in :coef | <primitive: return sc.Integrator(_in, _coef);> }
	K2A { :in | <primitive: return sc.K2A(_in);> }
	KeyState { :keycode :minval :maxval :lag | <primitive: return sc.KeyState(_keycode, _minval, _maxval, _lag);> }
	KeyTrack { :chain :keydecay :chromaleak | <primitive: return sc.KeyTrack(_chain, _keydecay, _chromaleak);> }
	Klang { :freqscale :freqoffset :specificationsArrayRef | <primitive: return sc.Klang(_freqscale, _freqoffset, _specificationsArrayRef);> }
	Klank { :input :freqscale :freqoffset :decayscale :specificationsArrayRef | <primitive: return sc.Klank(_input, _freqscale, _freqoffset, _decayscale, _specificationsArrayRef);> }
	LfClipNoise { :freq | <primitive: return sc.LFClipNoise(_freq);> }
	LfCub { :freq :iphase | <primitive: return sc.LFCub(_freq, _iphase);> }
	LFDClipNoise { :freq | <primitive: return sc.LFDClipNoise(_freq);> }
	LFDNoise0 { :freq | <primitive: return sc.LFDNoise0(_freq);> }
	LfdNoise1 { :freq | <primitive: return sc.LFDNoise1(_freq);> }
	LfdNoise3 { :freq | <primitive: return sc.LFDNoise3(_freq);> }
	LfGauss { :duration :width :iphase :loop :doneAction | <primitive: return sc.LFGauss(_duration, _width, _iphase, _loop, _doneAction);> }
	LfNoise0 { :freq | <primitive: return sc.LFNoise0(_freq);> }
	LfNoise1 { :freq | <primitive: return sc.LFNoise1(_freq);> }
	LfNoise2 { :freq | <primitive: return sc.LFNoise2(_freq);> }
	LfPar { :freq :iphase | <primitive: return sc.LFPar(_freq, _iphase);> }
	LfPulse { :freq :iphase :width | <primitive: return sc.LFPulse(_freq, _iphase, _width);> }
	LfSaw { :freq :iphase | <primitive: return sc.LFSaw(_freq, _iphase);> }
	LfTri { :freq :iphase | <primitive: return sc.LFTri(_freq, _iphase);> }
	Lpf { :in :freq | <primitive: return sc.LPF(_in, _freq);> }
	Lpz1 { :in | <primitive: return sc.LPZ1(_in);> }
	Lpz2 { :in | <primitive: return sc.LPZ2(_in);> }
	Lag { :in :lagTime | <primitive: return sc.Lag(_in, _lagTime);> }
	Lag2 { :in :lagTime | <primitive: return sc.Lag2(_in, _lagTime);> }
	Lag2UD { :in :lagTimeU :lagTimeD | <primitive: return sc.Lag2UD(_in, _lagTimeU, _lagTimeD);> }
	Lag3 { :in :lagTime | <primitive: return sc.Lag3(_in, _lagTime);> }
	Lag3Ud { :in :lagTimeU :lagTimeD | <primitive: return sc.Lag3UD(_in, _lagTimeU, _lagTimeD);> }
	LagIn { :numChan :bus :lag | <primitive: return sc.LagIn(_numChan, _bus, _lag);> }
	LagUd { :in :lagTimeU :lagTimeD | <primitive: return sc.LagUD(_in, _lagTimeU, _lagTimeD);> }
	LastValue { :in :diff | <primitive: return sc.LastValue(_in, _diff);> }
	Latch { :in :trig | <primitive: return sc.Latch(_in, _trig);> }
	LatoocarfianC { :freq :a :b :c :d :xi :yi | <primitive: return sc.LatoocarfianC(_freq, _a, _b, _c, _d, _xi, _yi);> }
	LatoocarfianL { :freq :a :b :c :d :xi :yi | <primitive: return sc.LatoocarfianL(_freq, _a, _b, _c, _d, _xi, _yi);> }
	LatoocarfianN { :freq :a :b :c :d :xi :yi | <primitive: return sc.LatoocarfianN(_freq, _a, _b, _c, _d, _xi, _yi);> }
	LeakDc { :in :coef | <primitive: return sc.LeakDC(_in, _coef);> }
	LeastChange { :a :b | <primitive: return sc.LeastChange(_a, _b);> }
	Limiter { :in :level :dur | <primitive: return sc.Limiter(_in, _level, _dur);> }
	LinCongC { :freq :a :c :m :xi | <primitive: return sc.LinCongC(_freq, _a, _c, _m, _xi);> }
	LinCongL { :freq :a :c :m :xi | <primitive: return sc.LinCongL(_freq, _a, _c, _m, _xi);> }
	LinCongN { :freq :a :c :m :xi | <primitive: return sc.LinCongN(_freq, _a, _c, _m, _xi);> }
	LinExp { :in :srclo :srchi :dstlo :dsthi | <primitive: return sc.LinExp(_in, _srclo, _srchi, _dstlo, _dsthi);> }
	LinPan2 { :in :pos :level | <primitive: return sc.LinPan2(_in, _pos, _level);> }
	LinRand { :lo :hi :minmax | <primitive: return sc.LinRand(_lo, _hi, _minmax);> }
	LinXFade2 { :inA :inB :pan | <primitive: return sc.LinXFade2(_inA, _inB, _pan);> }
	Line { :start :end :dur :doneAction | <primitive: return sc.Line(_start, _end, _dur, _doneAction);> }
	Linen { :gate :attackTime :susLevel :releaseTime :doneAction | <primitive: return sc.Linen(_gate, _attackTime, _susLevel, _releaseTime, _doneAction);> }
	LocalBuf { :numChannels :numFrames | <primitive: return sc.LocalBuf(_numChannels, _numFrames);> }
	LocalIn { :numChan :default | <primitive: return sc.LocalIn(_numChan, _default);> }
	LocalOut { :channelsArray | <primitive: return sc.LocalOut(_channelsArray);> }
	Logistic { :chaosParam :freq :init | <primitive: return sc.Logistic(_chaosParam, _freq, _init);> }
	LorenzL { :freq :s :r :b :h :xi :yi :zi | <primitive: return sc.LorenzL(_freq, _s, _r, _b, _h, _xi, _yi, _zi);> }
	Loudness { :chain :smask :tmask | <primitive: return sc.Loudness(_chain, _smask, _tmask);> }
	MFCC { :chain :numcoeff | <primitive: return sc.MFCC(_chain, _numcoeff);> }
	MantissaMask { :in :bits | <primitive: return sc.MantissaMask(_in, _bits);> }
	Median { :length :in | <primitive: return sc.Median(_length, _in);> }
	MidEq { :in :freq :rq :db | <primitive: return sc.MidEQ(_in, _freq, _rq, _db);> }
	ModDif { :x :y :mod | <primitive: return sc.ModDif(_x, _y, _mod);> }
	MoogFf { :in :freq :gain :reset | <primitive: return sc.MoogFF(_in, _freq, _gain, _reset);> }
	MostChange { :a :b | <primitive: return sc.MostChange(_a, _b);> }
	MouseButton { :minval :maxval :lag | <primitive: return sc.MouseButton(_minval, _maxval, _lag);> }
	MouseX { :minval :maxval :warp :lag | <primitive: return sc.MouseX(_minval, _maxval, _warp, _lag);> }
	MouseY { :minval :maxval :warp :lag | <primitive: return sc.MouseY(_minval, _maxval, _warp, _lag);> }
	NRand { :lo :hi :n | <primitive: return sc.NRand(_lo, _hi, _n);> }
	Normalizer { :in :level :dur | <primitive: return sc.Normalizer(_in, _level, _dur);> }
	OffsetOut { :bus :channelsArray | <primitive: return sc.OffsetOut(_bus, _channelsArray);> }
	OnePole { :in :coef | <primitive: return sc.OnePole(_in, _coef);> }
	OneZero { :in :coef | <primitive: return sc.OneZero(_in, _coef);> }
	Onsets { :chain :threshold :odftype :relaxtime :floor :mingap :medianspan :whtype :rawodf | <primitive: return sc.Onsets(_chain, _threshold, _odftype, _relaxtime, _floor, _mingap, _medianspan, _whtype, _rawodf);> }
	Osc { :bufnum :freq :phase | <primitive: return sc.Osc(_bufnum, _freq, _phase);> }
	OscN { :bufnum :freq :phase | <primitive: return sc.OscN(_bufnum, _freq, _phase);> }
	Out { :bus :channelsArray | <primitive: return sc.Out(_bus, _channelsArray);> }
	PSinGrain { :freq :dur :amp | <primitive: return sc.PSinGrain(_freq, _dur, _amp);> }
	PV_Add { :bufferA :bufferB | <primitive: return sc.PV_Add(_bufferA, _bufferB);> }
	PV_BinScramble { :buffer :wipe :width :trig | <primitive: return sc.PV_BinScramble(_buffer, _wipe, _width, _trig);> }
	PV_BinShift { :buffer :stretch :shift :interp | <primitive: return sc.PV_BinShift(_buffer, _stretch, _shift, _interp);> }
	PV_BinWipe { :bufferA :bufferB :wipe | <primitive: return sc.PV_BinWipe(_bufferA, _bufferB, _wipe);> }
	PV_BrickWall { :buffer :wipe | <primitive: return sc.PV_BrickWall(_buffer, _wipe);> }
	PV_ConformalMap { :buffer :areal :aimag | <primitive: return sc.PV_ConformalMap(_buffer, _areal, _aimag);> }
	PV_Conj { :buffer | <primitive: return sc.PV_Conj(_buffer);> }
	PV_Copy { :bufferA :bufferB | <primitive: return sc.PV_Copy(_bufferA, _bufferB);> }
	PV_CopyPhase { :bufferA :bufferB | <primitive: return sc.PV_CopyPhase(_bufferA, _bufferB);> }
	PvDiffuser { :buffer :trig | <primitive: return sc.PV_Diffuser(_buffer, _trig);> }
	PV_Div { :bufferA :bufferB | <primitive: return sc.PV_Div(_bufferA, _bufferB);> }
	PV_HainsworthFoote { :maxSize | <primitive: return sc.PV_HainsworthFoote(_maxSize);> }
	PV_JensenAndersen { :maxSize | <primitive: return sc.PV_JensenAndersen(_maxSize);> }
	PV_LocalMax { :buffer :threshold | <primitive: return sc.PV_LocalMax(_buffer, _threshold);> }
	PV_MagAbove { :buffer :threshold | <primitive: return sc.PV_MagAbove(_buffer, _threshold);> }
	PV_MagBelow { :buffer :threshold | <primitive: return sc.PV_MagBelow(_buffer, _threshold);> }
	PV_MagClip { :buffer :threshold | <primitive: return sc.PV_MagClip(_buffer, _threshold);> }
	PV_MagDiv { :bufferA :bufferB :zeroed | <primitive: return sc.PV_MagDiv(_bufferA, _bufferB, _zeroed);> }
	PV_MagFreeze { :buffer :freeze | <primitive: return sc.PV_MagFreeze(_buffer, _freeze);> }
	PV_MagMul { :bufferA :bufferB | <primitive: return sc.PV_MagMul(_bufferA, _bufferB);> }
	PV_MagNoise { :buffer | <primitive: return sc.PV_MagNoise(_buffer);> }
	PV_MagShift { :buffer :stretch :shift | <primitive: return sc.PV_MagShift(_buffer, _stretch, _shift);> }
	PV_MagSmear { :buffer :bins | <primitive: return sc.PV_MagSmear(_buffer, _bins);> }
	PV_MagSquared { :buffer | <primitive: return sc.PV_MagSquared(_buffer);> }
	PV_Max { :bufferA :bufferB | <primitive: return sc.PV_Max(_bufferA, _bufferB);> }
	PV_Min { :bufferA :bufferB | <primitive: return sc.PV_Min(_bufferA, _bufferB);> }
	PV_Mul { :bufferA :bufferB | <primitive: return sc.PV_Mul(_bufferA, _bufferB);> }
	PV_PhaseShift { :buffer :shift :integrate | <primitive: return sc.PV_PhaseShift(_buffer, _shift, _integrate);> }
	PV_PhaseShift270 { :buffer | <primitive: return sc.PV_PhaseShift270(_buffer);> }
	PV_PhaseShift90 { :buffer | <primitive: return sc.PV_PhaseShift90(_buffer);> }
	PvRandComb { :buffer :wipe :trig | <primitive: return sc.PV_RandComb(_buffer, _wipe, _trig);> }
	PV_RandWipe { :bufferA :bufferB :wipe :trig | <primitive: return sc.PV_RandWipe(_bufferA, _bufferB, _wipe, _trig);> }
	PV_RectComb { :buffer :numTeeth :phase :width | <primitive: return sc.PV_RectComb(_buffer, _numTeeth, _phase, _width);> }
	PV_RectComb2 { :bufferA :bufferB :numTeeth :phase :width | <primitive: return sc.PV_RectComb2(_bufferA, _bufferB, _numTeeth, _phase, _width);> }
	Pan2 { :in :pos :level | <primitive: return sc.Pan2(_in, _pos, _level);> }
	Pan4 { :in :xpos :ypos :level | <primitive: return sc.Pan4(_in, _xpos, _ypos, _level);> }
	PanAz { :numChan :in :pos :level :width :orientation | <primitive: return sc.PanAz(_numChan, _in, _pos, _level, _width, _orientation);> }
	PanB { :in :azimuth :elevation :gain | <primitive: return sc.PanB(_in, _azimuth, _elevation, _gain);> }
	PanB2 { :in :azimuth :gain | <primitive: return sc.PanB2(_in, _azimuth, _gain);> }
	PartConv { :in :fftsize :irbufnum | <primitive: return sc.PartConv(_in, _fftsize, _irbufnum);> }
	Pause { :gate :id | <primitive: return sc.Pause(_gate, _id);> }
	PauseSelf { :in | <primitive: return sc.PauseSelf(_in);> }
	PauseSelfWhenDone { :src | <primitive: return sc.PauseSelfWhenDone(_src);> }
	Peak { :in :trig | <primitive: return sc.Peak(_in, _trig);> }
	PeakFollower { :in :decay | <primitive: return sc.PeakFollower(_in, _decay);> }
	Phasor { :trig :rate :start :end :resetPos | <primitive: return sc.Phasor(_trig, _rate, _start, _end, _resetPos);> }
	Pitch { :in :initFreq :minFreq :maxFreq :execFreq :maxBinsPerOctave :median :ampThreshold :peakThreshold :downSample :clar | <primitive: return sc.Pitch(_in, _initFreq, _minFreq, _maxFreq, _execFreq, _maxBinsPerOctave, _median, _ampThreshold, _peakThreshold, _downSample, _clar);> }
	PitchShift { :in :windowSize :pitchRatio :pitchDispersion :timeDispersion | <primitive: return sc.PitchShift(_in, _windowSize, _pitchRatio, _pitchDispersion, _timeDispersion);> }
	PlayBuf { :numChan :bufnum :rate :trigger :startPos :loop :doneAction | <primitive: return sc.PlayBuf(_numChan, _bufnum, _rate, _trigger, _startPos, _loop, _doneAction);> }
	Pluck { :in :trig :maxdelaytime :delaytime :decaytime :coef | <primitive: return sc.Pluck(_in, _trig, _maxdelaytime, _delaytime, _decaytime, _coef);> }
	Poll { :trig :in :trigid :label | <primitive: return sc.Poll(_trig, _in, _trigid, _label);> }
	Pulse { :freq :width | <primitive: return sc.Pulse(_freq, _width);> }
	PulseCount { :trig :reset | <primitive: return sc.PulseCount(_trig, _reset);> }
	PulseDivider { :trig :div :start | <primitive: return sc.PulseDivider(_trig, _div, _start);> }
	QuadC { :freq :a :b :c :xi | <primitive: return sc.QuadC(_freq, _a, _b, _c, _xi);> }
	QuadL { :freq :a :b :c :xi | <primitive: return sc.QuadL(_freq, _a, _b, _c, _xi);> }
	QuadN { :freq :a :b :c :xi | <primitive: return sc.QuadN(_freq, _a, _b, _c, _xi);> }
	Rhpf { :in :freq :rq | <primitive: return sc.RHPF(_in, _freq, _rq);> }
	Rlpf { :in :freq :rq | <primitive: return sc.RLPF(_in, _freq, _rq);> }
	Ramp { :in :lagTime | <primitive: return sc.Ramp(_in, _lagTime);> }
	Rand { :lo :hi | <primitive: return sc.Rand(_lo, _hi);> }
	RandID { :id | <primitive: return sc.RandID(_id);> }
	RandSeed { :trig :seed | <primitive: return sc.RandSeed(_trig, _seed);> }
	RecordBuf { :bufnum :offset :recLevel :preLevel :run :loop :trigger :doneAction :inputArray | <primitive: return sc.RecordBuf(_bufnum, _offset, _recLevel, _preLevel, _run, _loop, _trigger, _doneAction, _inputArray);> }
	ReplaceOut { :bus :channelsArray | <primitive: return sc.ReplaceOut(_bus, _channelsArray);> }
	Resonz { :in :freq :bwr | <primitive: return sc.Resonz(_in, _freq, _bwr);> }
	Ringz { :in :freq :decaytime | <primitive: return sc.Ringz(_in, _freq, _decaytime);> }
	Rotate2 { :x :y :pos | <primitive: return sc.Rotate2(_x, _y, _pos);> }
	RunningMax { :in :trig | <primitive: return sc.RunningMax(_in, _trig);> }
	RunningMin { :in :trig | <primitive: return sc.RunningMin(_in, _trig);> }
	RunningSum { :in :numsamp | <primitive: return sc.RunningSum(_in, _numsamp);> }
	Sos { :in :a0 :a1 :a2 :b1 :b2 | <primitive: return sc.SOS(_in, _a0, _a1, _a2, _b1, _b2);> }
	Sanitize { :in :replace | <primitive: return sc.Sanitize(_in, _replace);> }
	Saw { :freq | <primitive: return sc.Saw(_freq);> }
	Schmidt { :in :lo :hi | <primitive: return sc.Schmidt(_in, _lo, _hi);> }
	Select { :which :array | <primitive: return sc.Select(_which, _array);> }
	SendTrig { :in :id :value | <primitive: return sc.SendTrig(_in, _id, _value);> }
	SetResetFf { :trig :reset | <primitive: return sc.SetResetFF(_trig, _reset);> }
	Shaper { :bufnum :in | <primitive: return sc.Shaper(_bufnum, _in);> }
	SinOsc { :freq :phase | <primitive: return sc.SinOsc(_freq, _phase);> }
	SinOscFb { :freq :feedback | <primitive: return sc.SinOscFB(_freq, _feedback);> }
	Slew { :in :up :dn | <primitive: return sc.Slew(_in, _up, _dn);> }
	Slope { :in | <primitive: return sc.Slope(_in);> }
	SpecCentroid { :buffer | <primitive: return sc.SpecCentroid(_buffer);> }
	SpecFlatness { :buffer | <primitive: return sc.SpecFlatness(_buffer);> }
	SpecPcile { :buffer :fraction :interpolate | <primitive: return sc.SpecPcile(_buffer, _fraction, _interpolate);> }
	Spring { :in :spring :damp | <primitive: return sc.Spring(_in, _spring, _damp);> }
	StandardL { :freq :k :xi :yi | <primitive: return sc.StandardL(_freq, _k, _xi, _yi);> }
	StandardN { :freq :k :xi :yi | <primitive: return sc.StandardN(_freq, _k, _xi, _yi);> }
	Stepper { :trig :reset :min :max :step :resetval | <primitive: return sc.Stepper(_trig, _reset, _min, _max, _step, _resetval);> }
	StereoConvolution2L { :in :kernelL :kernelR :trigger :framesize :crossfade | <primitive: return sc.StereoConvolution2L(_in, _kernelL, _kernelR, _trigger, _framesize, _crossfade);> }
	Sum3 { :in0 :in1 :in2 | <primitive: return sc.Sum3(_in0, _in1, _in2);> }
	Sum4 { :in0 :in1 :in2 :in3 | <primitive: return sc.Sum4(_in0, _in1, _in2, _in3);> }
	Sweep { :trig :rate | <primitive: return sc.Sweep(_trig, _rate);> }
	SyncSaw { :syncFreq :sawFreq | <primitive: return sc.SyncSaw(_syncFreq, _sawFreq);> }
	T2A { :in :offset | <primitive: return sc.T2A(_in, _offset);> }
	T2K { :in | <primitive: return sc.T2K(_in);> }
	TBall { :in :g :damp :friction | <primitive: return sc.TBall(_in, _g, _damp, _friction);> }
	TDelay { :in :dur | <primitive: return sc.TDelay(_in, _dur);> }
	TDuty { :dur :reset :doneAction :level :gapFirst | <primitive: return sc.TDuty(_dur, _reset, _doneAction, _level, _gapFirst);> }
	TExpRand { :lo :hi :trig | <primitive: return sc.TExpRand(_lo, _hi, _trig);> }
	TGrains { :numChan :trigger :bufnum :rate :centerPos :dur :pan :amp :interp | <primitive: return sc.TGrains(_numChan, _trigger, _bufnum, _rate, _centerPos, _dur, _pan, _amp, _interp);> }
	TiRand { :lo :hi :trig | <primitive: return sc.TIRand(_lo, _hi, _trig);> }
	TRand { :lo :hi :trig | <primitive: return sc.TRand(_lo, _hi, _trig);> }
	TWindex { :in :normalize :array | <primitive: return sc.TWindex(_in, _normalize, _array);> }
	Timer { :trig | <primitive: return sc.Timer(_trig);> }
	ToggleFf { :trig | <primitive: return sc.ToggleFF(_trig);> }
	Trig { :in :dur | <primitive: return sc.Trig(_in, _dur);> }
	Trig1 { :in :dur | <primitive: return sc.Trig1(_in, _dur);> }
	TwoPole { :in :freq :radius | <primitive: return sc.TwoPole(_in, _freq, _radius);> }
	TwoZero { :in :freq :radius | <primitive: return sc.TwoZero(_in, _freq, _radius);> }
	VDiskIn { :numChan :bufnum :rate :loop :sendID | <primitive: return sc.VDiskIn(_numChan, _bufnum, _rate, _loop, _sendID);> }
	VOsc { :bufpos :freq :phase | <primitive: return sc.VOsc(_bufpos, _freq, _phase);> }
	VOsc3 { :bufpos :freq1 :freq2 :freq3 | <primitive: return sc.VOsc3(_bufpos, _freq1, _freq2, _freq3);> }
	VarLag { :in :time :curvature :warp :start | <primitive: return sc.VarLag(_in, _time, _curvature, _warp, _start);> }
	VarSaw { :freq :iphase :width | <primitive: return sc.VarSaw(_freq, _iphase, _width);> }
	Vibrato { :freq :rate :depth :delay :onset :rateVariation :depthVariation :iphase :trig | <primitive: return sc.Vibrato(_freq, _rate, _depth, _delay, _onset, _rateVariation, _depthVariation, _iphase, _trig);> }
	Warp1 { :numChan :bufnum :pointer :freqScale :windowSize :envbufnum :overlaps :windowRandRatio :interp | <primitive: return sc.Warp1(_numChan, _bufnum, _pointer, _freqScale, _windowSize, _envbufnum, _overlaps, _windowRandRatio, _interp);> }
	Wrap { :in :lo :hi | <primitive: return sc.Wrap(_in, _lo, _hi);> }
	WrapIndex { :bufnum :in | <primitive: return sc.WrapIndex(_bufnum, _in);> }
	XFade2 { :inA :inB :pan :level | <primitive: return sc.XFade2(_inA, _inB, _pan, _level);> }
	XLine { :start :end :dur :doneAction | <primitive: return sc.XLine(_start, _end, _dur, _doneAction);> }
	XOut { :bus :xfade :channelsArray | <primitive: return sc.XOut(_bus, _xfade, _channelsArray);> }
	ZeroCrossing { :in | <primitive: return sc.ZeroCrossing(_in);> }
	MaxLocalBufs { :count | <primitive: return sc.MaxLocalBufs(_count);> }
	MulAdd { :in :mul :add | <primitive: return sc.MulAdd(_in, _mul, _add);> }
	SetBuf { :buf :offset :length :array | <primitive: return sc.SetBuf(_buf, _offset, _length, _array);> }
}
