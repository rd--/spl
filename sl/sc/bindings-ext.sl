+ Object {
	A2B { :a :b :c :d | <primitive: return sc.A2B(_a, _b, _c, _d);> }
	AY { :tonea :toneb :tonec :noise :control :vola :volb :volc :envfreq :envstyle :chiptype | <primitive: return sc.AY(_tonea, _toneb, _tonec, _noise, _control, _vola, _volb, _volc, _envfreq, _envstyle, _chiptype);> }
	AY8910 { :r0 :r1 :r2 :r3 :r4 :r5 :r6 :r7 :r8 :r9 :rA :rB :rC :rD :rate | <primitive: return sc.AY8910(_r0, _r1, _r2, _r3, _r4, _r5, _r6, _r7, _r8, _r9, _rA, _rB, _rC, _rD, _rate);> }
	Allpass1 { :in :freq | <primitive: return sc.Allpass1(_in, _freq);> }
	Allpass2 { :in :freq :rq | <primitive: return sc.Allpass2(_in, _freq, _rq);> }
	AmplitudeMod { :in :attackTime :releaseTime | <primitive: return sc.AmplitudeMod(_in, _attackTime, _releaseTime);> }
	AnalogBassDrum { :trig :infsustain :accent :freq :tone :decay :attackfm :selffm | <primitive: return sc.AnalogBassDrum(_trig, _infsustain, _accent, _freq, _tone, _decay, _attackfm, _selffm);> }
	AnalogFoldOsc { :freq :amp | <primitive: return sc.AnalogFoldOsc(_freq, _amp);> }
	AnalogPhaser { :input :lfoinput :skew :feedback :modulation :stages | <primitive: return sc.AnalogPhaser(_input, _lfoinput, _skew, _feedback, _modulation, _stages);> }
	AnalogPhaserMod { :input :skew :modulation :stages | <primitive: return sc.AnalogPhaserMod(_input, _skew, _modulation, _stages);> }
	AnalogPulseShaper { :pulseinput :width :decay :double | <primitive: return sc.AnalogPulseShaper(_pulseinput, _width, _decay, _double);> }
	AnalogSnareDrum { :trig :infsustain :accent :freq :tone :decay :snappy | <primitive: return sc.AnalogSnareDrum(_trig, _infsustain, _accent, _freq, _tone, _decay, _snappy);> }
	AnalogTape { :input :bias :saturation :drive :oversample :mode | <primitive: return sc.AnalogTape(_input, _bias, _saturation, _drive, _oversample, _mode);> }
	AnalogVintageDistortion { :input :drivegain :bias :lowgain :highgain :shelvingfreq :oversample | <primitive: return sc.AnalogVintageDistortion(_input, _drivegain, _bias, _lowgain, _highgain, _shelvingfreq, _oversample);> }
	AnalyseEvents2 { :in :bufnum :threshold :triggerid :circular :pitch | <primitive: return sc.AnalyseEvents2(_in, _bufnum, _threshold, _triggerid, _circular, _pitch);> }
	ArneodoCoulletTresser { :freq :alpha :h :xi :yi :zi | <primitive: return sc.ArneodoCoulletTresser(_freq, _alpha, _h, _xi, _yi, _zi);> }
	ArrayMax { :array | <primitive: return sc.ArrayMax(_array);> }
	ArrayMin { :array | <primitive: return sc.ArrayMin(_array);> }
	Astrocade { :reg0 :reg1 :reg2 :reg3 :reg4 :reg5 :reg6 :reg7 | <primitive: return sc.Astrocade(_reg0, _reg1, _reg2, _reg3, _reg4, _reg5, _reg6, _reg7);> }
	Atari2600 { :audc0 :audc1 :audf0 :audf1 :audv0 :audv1 :rate | <primitive: return sc.Atari2600(_audc0, _audc1, _audf0, _audf1, _audv0, _audv1, _rate);> }
	AtsAmp { :atsbuffer :partialNum :filePointer | <primitive: return sc.AtsAmp(_atsbuffer, _partialNum, _filePointer);> }
	AtsBand { :atsbuffer :band :filePointer | <primitive: return sc.AtsBand(_atsbuffer, _band, _filePointer);> }
	AtsFreq { :atsbuffer :partialNum :filePointer | <primitive: return sc.AtsFreq(_atsbuffer, _partialNum, _filePointer);> }
	AtsNoiSynth { :atsbuffer :numPartials :partialStart :partialSkip :filePointer :sinePct :noisePct :freqMul :freqAdd :numBands :bandStart :bandSkip | <primitive: return sc.AtsNoiSynth(_atsbuffer, _numPartials, _partialStart, _partialSkip, _filePointer, _sinePct, _noisePct, _freqMul, _freqAdd, _numBands, _bandStart, _bandSkip);> }
	AtsNoise { :atsbuffer :bandNum :filePointer | <primitive: return sc.AtsNoise(_atsbuffer, _bandNum, _filePointer);> }
	AtsParInfo { :atsbuffer :partialNum :filePointer | <primitive: return sc.AtsParInfo(_atsbuffer, _partialNum, _filePointer);> }
	AtsPartial { :atsbuffer :partial :filePointer :freqMul :freqAdd | <primitive: return sc.AtsPartial(_atsbuffer, _partial, _filePointer, _freqMul, _freqAdd);> }
	AtsSynth { :atsbuffer :numPartials :partialStart :partialSkip :filePointer :freqMul :freqAdd | <primitive: return sc.AtsSynth(_atsbuffer, _numPartials, _partialStart, _partialSkip, _filePointer, _freqMul, _freqAdd);> }
	AtsUGen { :maxSize | <primitive: return sc.AtsUGen(_maxSize);> }
	AttackSlope { :input :windowsize :peakpicksize :leak :energythreshold :sumthreshold :mingap :numslopesaveraged | <primitive: return sc.AttackSlope(_input, _windowsize, _peakpicksize, _leak, _energythreshold, _sumthreshold, _mingap, _numslopesaveraged);> }
	AudioMSG { :in :index | <primitive: return sc.AudioMSG(_in, _index);> }
	AverageOutput { :in :trig | <primitive: return sc.AverageOutput(_in, _trig);> }
	B2A { :w :x :y :z | <primitive: return sc.B2A(_w, _x, _y, _z);> }
	B2Ster { :w :x :y | <primitive: return sc.B2Ster(_w, _x, _y);> }
	B2UHJ { :w :x :y | <primitive: return sc.B2UHJ(_w, _x, _y);> }
	BBlockerBuf { :freq :bufnum :startpoint | <primitive: return sc.BBlockerBuf(_freq, _bufnum, _startpoint);> }
	BFDecode1 { :w :x :y :z :azimuth :elevation :wComp | <primitive: return sc.BFDecode1(_w, _x, _y, _z, _azimuth, _elevation, _wComp);> }
	BFDecoder { :maxSize | <primitive: return sc.BFDecoder(_maxSize);> }
	BFEncode1 { :in :azimuth :elevation :rho :gain :wComp | <primitive: return sc.BFEncode1(_in, _azimuth, _elevation, _rho, _gain, _wComp);> }
	BFEncode2 { :in :point_x :point_y :elevation :gain :wComp | <primitive: return sc.BFEncode2(_in, _point_x, _point_y, _elevation, _gain, _wComp);> }
	BFEncodeSter { :l :r :azimuth :width :elevation :rho :gain :wComp | <primitive: return sc.BFEncodeSter(_l, _r, _azimuth, _width, _elevation, _rho, _gain, _wComp);> }
	BFGrainPanner { :maxSize | <primitive: return sc.BFGrainPanner(_maxSize);> }
	BFManipulate { :w :x :y :z :rotate :tilt :tumble | <primitive: return sc.BFManipulate(_w, _x, _y, _z, _rotate, _tilt, _tumble);> }
	BFPanner { :maxSize | <primitive: return sc.BFPanner(_maxSize);> }
	BLBufRd { :bufnum :phase :ratio | <primitive: return sc.BLBufRd(_bufnum, _phase, _ratio);> }
	BLOsc { :freq :pulsewidth :waveform | <primitive: return sc.BLOsc(_freq, _pulsewidth, _waveform);> }
	BMoog { :in :freq :q :mode :saturation | <primitive: return sc.BMoog(_in, _freq, _q, _mode, _saturation);> }
	Balance { :in :test :hp :stor | <primitive: return sc.Balance(_in, _test, _hp, _stor);> }
	BeatStatistics { :fft :leak :numpreviousbeats | <primitive: return sc.BeatStatistics(_fft, _leak, _numpreviousbeats);> }
	Beep { :freq :vol | <primitive: return sc.Beep(_freq, _vol);> }
	BeepU { :maxSize | <primitive: return sc.BeepU(_maxSize);> }
	Bezier { :haltAfter :dx :freq :phase :param | <primitive: return sc.Bezier(_haltAfter, _dx, _freq, _phase, _param);> }
	BinData { :buffer :bin :overlaps | <primitive: return sc.BinData(_buffer, _bin, _overlaps);> }
	BlitB3 { :freq | <primitive: return sc.BlitB3(_freq);> }
	BlitB3D { :freq | <primitive: return sc.BlitB3D(_freq);> }
	BlitB3Saw { :freq :leak | <primitive: return sc.BlitB3Saw(_freq, _leak);> }
	BlitB3Square { :freq :leak | <primitive: return sc.BlitB3Square(_freq, _leak);> }
	BlitB3Tri { :freq :leak :leak2 | <primitive: return sc.BlitB3Tri(_freq, _leak, _leak2);> }
	Breakcore { :bufnum :capturein :capturetrigger :duration :ampdropout | <primitive: return sc.Breakcore(_bufnum, _capturein, _capturetrigger, _duration, _ampdropout);> }
	Brusselator { :reset :rate :mu :gamma :initx :inity | <primitive: return sc.Brusselator(_reset, _rate, _mu, _gamma, _initx, _inity);> }
	BufGrain { :trigger :dur :sndbuf :rate :pos :interp | <primitive: return sc.BufGrain(_trigger, _dur, _sndbuf, _rate, _pos, _interp);> }
	BufGrainB { :trigger :dur :sndbuf :rate :pos :envbuf :interp | <primitive: return sc.BufGrainB(_trigger, _dur, _sndbuf, _rate, _pos, _envbuf, _interp);> }
	BufGrainBBF { :trigger :dur :sndbuf :rate :pos :envbuf :azimuth :elevation :rho :interp :wComp | <primitive: return sc.BufGrainBBF(_trigger, _dur, _sndbuf, _rate, _pos, _envbuf, _azimuth, _elevation, _rho, _interp, _wComp);> }
	BufGrainBF { :trigger :dur :sndbuf :rate :pos :azimuth :elevation :rho :interp :wComp | <primitive: return sc.BufGrainBF(_trigger, _dur, _sndbuf, _rate, _pos, _azimuth, _elevation, _rho, _interp, _wComp);> }
	BufGrainI { :trigger :dur :sndbuf :rate :pos :envbuf1 :envbuf2 :ifac :interp | <primitive: return sc.BufGrainI(_trigger, _dur, _sndbuf, _rate, _pos, _envbuf1, _envbuf2, _ifac, _interp);> }
	BufGrainIBF { :trigger :dur :sndbuf :rate :pos :envbuf1 :envbuf2 :ifac :azimuth :elevation :rho :interp :wComp | <primitive: return sc.BufGrainIBF(_trigger, _dur, _sndbuf, _rate, _pos, _envbuf1, _envbuf2, _ifac, _azimuth, _elevation, _rho, _interp, _wComp);> }
	BufMax { :bufnum :gate | <primitive: return sc.BufMax(_bufnum, _gate);> }
	BufMin { :bufnum :gate | <primitive: return sc.BufMin(_bufnum, _gate);> }
	CQ_Diff { :in1 :in2 :databufnum | <primitive: return sc.CQ_Diff(_in1, _in2, _databufnum);> }
	Cepstrum { :cepbuf :fftchain | <primitive: return sc.Cepstrum(_cepbuf, _fftchain);> }
	Chen { :speed :a :b :c | <primitive: return sc.Chen(_speed, _a, _b, _c);> }
	Chromagram { :fft :fftsize :n :tuningbase :octaves :integrationflag :coeff :octaveratio :perframenormalize | <primitive: return sc.Chromagram(_fft, _fftsize, _n, _tuningbase, _octaves, _integrationflag, _coeff, _octaveratio, _perframenormalize);> }
	CircleRamp { :in :lagTime :circmin :circmax | <primitive: return sc.CircleRamp(_in, _lagTime, _circmin, _circmax);> }
	Clipper32 { :in :lo :hi | <primitive: return sc.Clipper32(_in, _lo, _hi);> }
	Clipper4 { :in :lo :hi | <primitive: return sc.Clipper4(_in, _lo, _hi);> }
	Clipper8 { :in :lo :hi | <primitive: return sc.Clipper8(_in, _lo, _hi);> }
	CombLP { :in :gate :maxdelaytime :delaytime :decaytime :coef | <primitive: return sc.CombLP(_in, _gate, _maxdelaytime, _delaytime, _decaytime, _coef);> }
	ComplexRes { :in :freq :decay | <primitive: return sc.ComplexRes(_in, _freq, _decay);> }
	Concat { :control :source :storesize :seektime :seekdur :matchlength :freezestore :zcr :lms :sc :st :randscore | <primitive: return sc.Concat(_control, _source, _storesize, _seektime, _seekdur, _matchlength, _freezestore, _zcr, _lms, _sc, _st, _randscore);> }
	Concat2 { :control :source :storesize :seektime :seekdur :matchlength :freezestore :zcr :lms :sc :st :randscore :threshold | <primitive: return sc.Concat2(_control, _source, _storesize, _seektime, _seekdur, _matchlength, _freezestore, _zcr, _lms, _sc, _st, _randscore, _threshold);> }
	Coyote { :in :trackFall :slowLag :fastLag :fastMul :thresh :minDur | <primitive: return sc.Coyote(_in, _trackFall, _slowLag, _fastLag, _fastMul, _thresh, _minDur);> }
	Crest { :in :numsamps :gate | <primitive: return sc.Crest(_in, _numsamps, _gate);> }
	CrossoverDistortion { :in :amp :smooth | <primitive: return sc.CrossoverDistortion(_in, _amp, _smooth);> }
	DCompressor { :input :sidechainIn :sidechain :ratio :threshold :attack :release :makeup :automakeup | <primitive: return sc.DCompressor(_input, _sidechainIn, _sidechain, _ratio, _threshold, _attack, _release, _makeup, _automakeup);> }
	dfm1 { :in :freq :res :inputgain :type :noiselevel | <primitive: return sc.DFM1(_in, _freq, _res, _inputgain, _type, _noiselevel);> }
	DNoiseRing { :change :chance :shift :numBits :resetval | <primitive: return sc.DNoiseRing(_change, _chance, _shift, _numBits, _resetval);> }
	DPW3Tri { :freq | <primitive: return sc.DPW3Tri(_freq);> }
	DPW4Saw { :freq | <primitive: return sc.DPW4Saw(_freq);> }
	DWGBowed { :freq :velb :force :gate :pos :release :c1 :c3 :impZ :fB | <primitive: return sc.DWGBowed(_freq, _velb, _force, _gate, _pos, _release, _c1, _c3, _impZ, _fB);> }
	DWGBowedSimple { :freq :velb :force :gate :pos :release :c1 :c3 | <primitive: return sc.DWGBowedSimple(_freq, _velb, _force, _gate, _pos, _release, _c1, _c3);> }
	DWGBowedTor { :freq :velb :force :gate :pos :release :c1 :c3 :impZ :fB :mistune :c1tor :c3tor :iZtor | <primitive: return sc.DWGBowedTor(_freq, _velb, _force, _gate, _pos, _release, _c1, _c3, _impZ, _fB, _mistune, _c1tor, _c3tor, _iZtor);> }
	DWGPlucked { :freq :amp :gate :pos :c1 :c3 :inp :release | <primitive: return sc.DWGPlucked(_freq, _amp, _gate, _pos, _c1, _c3, _inp, _release);> }
	DWGPlucked2 { :freq :amp :gate :pos :c1 :c3 :inp :release :mistune :mp :gc | <primitive: return sc.DWGPlucked2(_freq, _amp, _gate, _pos, _c1, _c3, _inp, _release, _mistune, _mp, _gc);> }
	DwgPluckedStiff { :freq :amp :gate :pos :c1 :c3 :inp :release :fB | <primitive: return sc.DWGPluckedStiff(_freq, _amp, _gate, _pos, _c1, _c3, _inp, _release, _fB);> }
	DWGSoundBoard { :inp :c1 :c3 :mix :d1 :d2 :d3 :d4 :d5 :d6 :d7 :d8 | <primitive: return sc.DWGSoundBoard(_inp, _c1, _c3, _mix, _d1, _d2, _d3, _d4, _d5, _d6, _d7, _d8);> }
	Dbrown2 { :lo :hi :step :dist :length | <primitive: return sc.Dbrown2(_lo, _hi, _step, _dist, _length);> }
	DbufTag { :bufnum :v :axiom :rules :recycle :mode | <primitive: return sc.DbufTag(_bufnum, _v, _axiom, _rules, _recycle, _mode);> }
	Decimator { :in :rate :bits | <primitive: return sc.Decimator(_in, _rate, _bits);> }
	DelayMap { :bufnum :in :dynamic :spec | <primitive: return sc.DelayMap(_bufnum, _in, _dynamic, _spec);> }
	DelaySet { :in :spec | <primitive: return sc.DelaySet(_in, _spec);> }
	DelaySetBuf { :bufnum :in :spec | <primitive: return sc.DelaySetBuf(_bufnum, _in, _spec);> }
	DetaBlockerBuf { :bufnum :startpoint | <primitive: return sc.DetaBlockerBuf(_bufnum, _startpoint);> }
	Dfsm { :rules :n :rgen | <primitive: return sc.Dfsm(_rules, _n, _rgen);> }
	Dgauss { :lo :hi :length | <primitive: return sc.Dgauss(_lo, _hi, _length);> }
	DiodeRingMod { :car :mod | <primitive: return sc.DiodeRingMod(_car, _mod);> }
	Disintegrator { :in :probability :multiplier | <primitive: return sc.Disintegrator(_in, _probability, _multiplier);> }
	Dl { :numChannels :inputArray | <primitive: return sc.Dl(_numChannels, _inputArray);> }
	Dneuromodule { :numChan :dt :theta :x :weights | <primitive: return sc.Dneuromodule(_numChan, _dt, _theta, _x, _weights);> }
	DoubleNestedAllpassC { :in :maxdelay1 :delay1 :gain1 :maxdelay2 :delay2 :gain2 :maxdelay3 :delay3 :gain3 | <primitive: return sc.DoubleNestedAllpassC(_in, _maxdelay1, _delay1, _gain1, _maxdelay2, _delay2, _gain2, _maxdelay3, _delay3, _gain3);> }
	DoubleNestedAllpassL { :in :maxdelay1 :delay1 :gain1 :maxdelay2 :delay2 :gain2 :maxdelay3 :delay3 :gain3 | <primitive: return sc.DoubleNestedAllpassL(_in, _maxdelay1, _delay1, _gain1, _maxdelay2, _delay2, _gain2, _maxdelay3, _delay3, _gain3);> }
	DoubleNestedAllpassN { :in :maxdelay1 :delay1 :gain1 :maxdelay2 :delay2 :gain2 :maxdelay3 :delay3 :gain3 | <primitive: return sc.DoubleNestedAllpassN(_in, _maxdelay1, _delay1, _gain1, _maxdelay2, _delay2, _gain2, _maxdelay3, _delay3, _gain3);> }
	DoubleWell { :reset :ratex :ratey :f :w :delta :initx :inity | <primitive: return sc.DoubleWell(_reset, _ratex, _ratey, _f, _w, _delta, _initx, _inity);> }
	DoubleWell2 { :reset :ratex :ratey :f :w :delta :initx :inity | <primitive: return sc.DoubleWell2(_reset, _ratex, _ratey, _f, _w, _delta, _initx, _inity);> }
	DoubleWell3 { :reset :rate :f :delta :initx :inity | <primitive: return sc.DoubleWell3(_reset, _rate, _f, _delta, _initx, _inity);> }
	DriveNoise { :in :amount :multi | <primitive: return sc.DriveNoise(_in, _amount, _multi);> }
	DrumTrack { :in :lock :dynleak :tempowt :phasewt :basswt :patternwt :prior :kicksensitivity :snaresensitivity :debugmode | <primitive: return sc.DrumTrack(_in, _lock, _dynleak, _tempowt, _phasewt, _basswt, _patternwt, _prior, _kicksensitivity, _snaresensitivity, _debugmode);> }
	Dtag { :bufsize :v :axiom :rules :recycle :mode | <primitive: return sc.Dtag(_bufsize, _v, _axiom, _rules, _recycle, _mode);> }
	DustRange { :iotMin :iotMax | <primitive: return sc.DustRange(_iotMin, _iotMax);> }
	Dx7 { :bufnum :on :off :data :vc :mnn :vel :pw :mw :bc :fc | <primitive: return sc.Dx7(_bufnum, _on, _off, _data, _vc, _mnn, _vel, _pw, _mw, _bc, _fc);> }
	Dx7Env { :gate :data :r1 :r2 :r3 :r4 :l1 :l2 :l3 :l4 :ol | <primitive: return sc.Dx7Env(_gate, _data, _r1, _r2, _r3, _r4, _l1, _l2, _l3, _l4, _ol);> }
	EnvDetect { :in :attack :release | <primitive: return sc.EnvDetect(_in, _attack, _release);> }
	EnvFollow { :input :decaycoeff | <primitive: return sc.EnvFollow(_input, _decaycoeff);> }
	ExpRandN { :numChan :lo :hi | <primitive: return sc.ExpRandN(_numChan, _lo, _hi);> }
	FFTComplexDev { :buffer :rectify :powthresh | <primitive: return sc.FFTComplexDev(_buffer, _rectify, _powthresh);> }
	FFTCrest { :buffer :freqlo :freqhi | <primitive: return sc.FFTCrest(_buffer, _freqlo, _freqhi);> }
	FFTDiffMags { :bufferA :bufferB | <primitive: return sc.FFTDiffMags(_bufferA, _bufferB);> }
	FFTFlux { :buffer :normalise | <primitive: return sc.FFTFlux(_buffer, _normalise);> }
	FFTFluxPos { :buffer :normalise | <primitive: return sc.FFTFluxPos(_buffer, _normalise);> }
	FFTMKL { :buffer :epsilon | <primitive: return sc.FFTMKL(_buffer, _epsilon);> }
	FFTPeak { :buffer :freqlo :freqhi | <primitive: return sc.FFTPeak(_buffer, _freqlo, _freqhi);> }
	FFTPhaseDev { :buffer :weight :powthresh | <primitive: return sc.FFTPhaseDev(_buffer, _weight, _powthresh);> }
	FFTPower { :buffer :square | <primitive: return sc.FFTPower(_buffer, _square);> }
	FFTSlope { :buffer | <primitive: return sc.FFTSlope(_buffer);> }
	FFTSpread { :buffer :centroid | <primitive: return sc.FFTSpread(_buffer, _centroid);> }
	FFTSubbandFlatness { :chain :cutfreqs | <primitive: return sc.FFTSubbandFlatness(_chain, _cutfreqs);> }
	FFTSubbandFlux { :chain :cutfreqs :posonly | <primitive: return sc.FFTSubbandFlux(_chain, _cutfreqs, _posonly);> }
	FFTSubbandPower { :chain :cutfreqs :square :scalemode | <primitive: return sc.FFTSubbandPower(_chain, _cutfreqs, _square, _scalemode);> }
	Fm7 { :ctlMatrix :modMatrix | <primitive: return sc.FM7(_ctlMatrix, _modMatrix);> }
	FMGrain { :trigger :dur :carfreq :modfreq :index | <primitive: return sc.FMGrain(_trigger, _dur, _carfreq, _modfreq, _index);> }
	FMGrainB { :trigger :dur :carfreq :modfreq :index :envbuf | <primitive: return sc.FMGrainB(_trigger, _dur, _carfreq, _modfreq, _index, _envbuf);> }
	FMGrainBBF { :trigger :dur :carfreq :modfreq :index :envbuf :azimuth :elevation :rho :wComp | <primitive: return sc.FMGrainBBF(_trigger, _dur, _carfreq, _modfreq, _index, _envbuf, _azimuth, _elevation, _rho, _wComp);> }
	FMGrainBF { :trigger :dur :carfreq :modfreq :index :azimuth :elevation :rho :wComp | <primitive: return sc.FMGrainBF(_trigger, _dur, _carfreq, _modfreq, _index, _azimuth, _elevation, _rho, _wComp);> }
	FMGrainI { :trigger :dur :carfreq :modfreq :index :envbuf1 :envbuf2 :ifac | <primitive: return sc.FMGrainI(_trigger, _dur, _carfreq, _modfreq, _index, _envbuf1, _envbuf2, _ifac);> }
	FMGrainIBF { :trigger :dur :carfreq :modfreq :index :envbuf1 :envbuf2 :ifac :azimuth :elevation :rho :wComp | <primitive: return sc.FMGrainIBF(_trigger, _dur, _carfreq, _modfreq, _index, _envbuf1, _envbuf2, _ifac, _azimuth, _elevation, _rho, _wComp);> }
	FMHDecode1 { :w :x :y :z :r :s :t :u :v :azimuth :elevation | <primitive: return sc.FMHDecode1(_w, _x, _y, _z, _r, _s, _t, _u, _v, _azimuth, _elevation);> }
	FMHEncode0 { :in :azimuth :elevation :gain | <primitive: return sc.FMHEncode0(_in, _azimuth, _elevation, _gain);> }
	FMHEncode1 { :in :azimuth :elevation :rho :gain :wComp | <primitive: return sc.FMHEncode1(_in, _azimuth, _elevation, _rho, _gain, _wComp);> }
	FMHEncode2 { :in :point_x :point_y :elevation :gain :wComp | <primitive: return sc.FMHEncode2(_in, _point_x, _point_y, _elevation, _gain, _wComp);> }
	FeatureSave { :features :trig | <primitive: return sc.FeatureSave(_features, _trig);> }
	Fhn2DC { :minfreq :maxfreq :urate :wrate :b0 :b1 :i :u0 :w0 | <primitive: return sc.Fhn2DC(_minfreq, _maxfreq, _urate, _wrate, _b0, _b1, _i, _u0, _w0);> }
	Fhn2DL { :minfreq :maxfreq :urate :wrate :b0 :b1 :i :u0 :w0 | <primitive: return sc.Fhn2DL(_minfreq, _maxfreq, _urate, _wrate, _b0, _b1, _i, _u0, _w0);> }
	Fhn2DN { :minfreq :maxfreq :urate :wrate :b0 :b1 :i :u0 :w0 | <primitive: return sc.Fhn2DN(_minfreq, _maxfreq, _urate, _wrate, _b0, _b1, _i, _u0, _w0);> }
	FhnTrig { :minfreq :maxfreq :urate :wrate :b0 :b1 :i :u0 :w0 | <primitive: return sc.FhnTrig(_minfreq, _maxfreq, _urate, _wrate, _b0, _b1, _i, _u0, _w0);> }
	FincoSprottL { :freq :a :h :xi :yi :zi | <primitive: return sc.FincoSprottL(_freq, _a, _h, _xi, _yi, _zi);> }
	FincoSprottM { :freq :a :b :h :xi :yi :zi | <primitive: return sc.FincoSprottM(_freq, _a, _b, _h, _xi, _yi, _zi);> }
	FincoSprottS { :freq :a :b :h :xi :yi :zi | <primitive: return sc.FincoSprottS(_freq, _a, _b, _h, _xi, _yi, _zi);> }
	FitzHughNagumo { :reset :rateu :ratew :b0 :b1 :initu :initw | <primitive: return sc.FitzHughNagumo(_reset, _rateu, _ratew, _b0, _b1, _initu, _initw);> }
	FrameCompare { :buffer1 :buffer2 :wAmount | <primitive: return sc.FrameCompare(_buffer1, _buffer2, _wAmount);> }
	Freezer { :bufnum :left :right :gain :increment :incrementOffset :incrementRandom :rightRandom :syncPhaseTrigger :randomizePhaseTrigger :numberOfLoops | <primitive: return sc.Freezer(_bufnum, _left, _right, _gain, _increment, _incrementOffset, _incrementRandom, _rightRandom, _syncPhaseTrigger, _randomizePhaseTrigger, _numberOfLoops);> }
	Friction { :in :friction :spring :damp :mass :beltmass | <primitive: return sc.Friction(_in, _friction, _spring, _damp, _mass, _beltmass);> }
	Gammatone { :input :centrefrequency :bandwidth | <primitive: return sc.Gammatone(_input, _centrefrequency, _bandwidth);> }
	GaussClass { :in :bufnum :gate | <primitive: return sc.GaussClass(_in, _bufnum, _gate);> }
	GaussTrig { :freq :dev | <primitive: return sc.GaussTrig(_freq, _dev);> }
	Gbman2DC { :minfreq :maxfreq :x0 :y0 | <primitive: return sc.Gbman2DC(_minfreq, _maxfreq, _x0, _y0);> }
	Gbman2DL { :minfreq :maxfreq :x0 :y0 | <primitive: return sc.Gbman2DL(_minfreq, _maxfreq, _x0, _y0);> }
	Gbman2DN { :minfreq :maxfreq :x0 :y0 | <primitive: return sc.Gbman2DN(_minfreq, _maxfreq, _x0, _y0);> }
	GbmanTrig { :minfreq :maxfreq :x0 :y0 | <primitive: return sc.GbmanTrig(_minfreq, _maxfreq, _x0, _y0);> }
	Gendy4 { :ampdist :durdist :adparam :ddparam :minfreq :maxfreq :ampscale :durscale :initCPs :knum | <primitive: return sc.Gendy4(_ampdist, _durdist, _adparam, _ddparam, _minfreq, _maxfreq, _ampscale, _durscale, _initCPs, _knum);> }
	Gendy5 { :ampdist :durdist :adparam :ddparam :minfreq :maxfreq :ampscale :durscale :initCPs :knum | <primitive: return sc.Gendy5(_ampdist, _durdist, _adparam, _ddparam, _minfreq, _maxfreq, _ampscale, _durscale, _initCPs, _knum);> }
	Getenv { :key :defaultval | <primitive: return sc.Getenv(_key, _defaultval);> }
	GlitchBPF { :in :freq :rq | <primitive: return sc.GlitchBPF(_in, _freq, _rq);> }
	GlitchBRF { :in :freq :rq | <primitive: return sc.GlitchBRF(_in, _freq, _rq);> }
	GlitchHPF { :in :freq | <primitive: return sc.GlitchHPF(_in, _freq);> }
	GlitchRHPF { :in :freq :rq | <primitive: return sc.GlitchRHPF(_in, _freq, _rq);> }
	Goertzel { :in :bufsize :freq :hop | <primitive: return sc.Goertzel(_in, _bufsize, _freq, _hop);> }
	GrainBufJ { :numChannels :trigger :dur :sndbuf :rate :pos :loop :interp :grainAmp :pan :envbufnum :maxGrains | <primitive: return sc.GrainBufJ(_numChannels, _trigger, _dur, _sndbuf, _rate, _pos, _loop, _interp, _grainAmp, _pan, _envbufnum, _maxGrains);> }
	GrainFMJ { :numChannels :trigger :dur :carfreq :modfreq :index :grainAmp :pan :envbufnum :maxGrains | <primitive: return sc.GrainFMJ(_numChannels, _trigger, _dur, _carfreq, _modfreq, _index, _grainAmp, _pan, _envbufnum, _maxGrains);> }
	GrainInJ { :numChannels :trigger :dur :in :grainAmp :pan :envbufnum :maxGrains | <primitive: return sc.GrainInJ(_numChannels, _trigger, _dur, _in, _grainAmp, _pan, _envbufnum, _maxGrains);> }
	GrainSinJ { :numChannels :trigger :dur :freq :grainAmp :pan :envbufnum :maxGrains | <primitive: return sc.GrainSinJ(_numChannels, _trigger, _dur, _freq, _grainAmp, _pan, _envbufnum, _maxGrains);> }
	GravityGrid { :reset :rate :newx :newy :bufnum | <primitive: return sc.GravityGrid(_reset, _rate, _newx, _newy, _bufnum);> }
	GravityGrid2 { :reset :rate :newx :newy :bufnum | <primitive: return sc.GravityGrid2(_reset, _rate, _newx, _newy, _bufnum);> }
	GreyholeRaw { :in1 :in2 :damping :delaytime :diffusion :feedback :moddepth :modfreq :size | <primitive: return sc.GreyholeRaw(_in1, _in2, _damping, _delaytime, _diffusion, _feedback, _moddepth, _modfreq, _size);> }
	HairCell { :input :spontaneousrate :boostrate :restorerate :loss | <primitive: return sc.HairCell(_input, _spontaneousrate, _boostrate, _restorerate, _loss);> }
	HarmonicOsc { :freq :firstharmonic :amplitudes | <primitive: return sc.HarmonicOsc(_freq, _firstharmonic, _amplitudes);> }
	Henon2DC { :minfreq :maxfreq :a :b :x0 :y0 | <primitive: return sc.Henon2DC(_minfreq, _maxfreq, _a, _b, _x0, _y0);> }
	Henon2DL { :minfreq :maxfreq :a :b :x0 :y0 | <primitive: return sc.Henon2DL(_minfreq, _maxfreq, _a, _b, _x0, _y0);> }
	Henon2DN { :minfreq :maxfreq :a :b :x0 :y0 | <primitive: return sc.Henon2DN(_minfreq, _maxfreq, _a, _b, _x0, _y0);> }
	HenonTrig { :minfreq :maxfreq :a :b :x0 :y0 | <primitive: return sc.HenonTrig(_minfreq, _maxfreq, _a, _b, _x0, _y0);> }
	ICepstrum { :cepchain :fftbuf | <primitive: return sc.ICepstrum(_cepchain, _fftbuf);> }
	IIRFilter { :in :freq :rq | <primitive: return sc.IIRFilter(_in, _freq, _rq);> }
	IRandN { :numChan :lo :hi | <primitive: return sc.IRandN(_numChan, _lo, _hi);> }
	InGrain { :trigger :dur :in | <primitive: return sc.InGrain(_trigger, _dur, _in);> }
	InGrainB { :trigger :dur :in :envbuf | <primitive: return sc.InGrainB(_trigger, _dur, _in, _envbuf);> }
	InGrainBBF { :trigger :dur :in :envbuf :azimuth :elevation :rho :wComp | <primitive: return sc.InGrainBBF(_trigger, _dur, _in, _envbuf, _azimuth, _elevation, _rho, _wComp);> }
	InGrainBF { :trigger :dur :in :azimuth :elevation :rho :wComp | <primitive: return sc.InGrainBF(_trigger, _dur, _in, _azimuth, _elevation, _rho, _wComp);> }
	InGrainI { :trigger :dur :in :envbuf1 :envbuf2 :ifac | <primitive: return sc.InGrainI(_trigger, _dur, _in, _envbuf1, _envbuf2, _ifac);> }
	InGrainIBF { :trigger :dur :in :envbuf1 :envbuf2 :ifac :azimuth :elevation :rho :wComp | <primitive: return sc.InGrainIBF(_trigger, _dur, _in, _envbuf1, _envbuf2, _ifac, _azimuth, _elevation, _rho, _wComp);> }
	InsideOut { :in | <primitive: return sc.InsideOut(_in);> }
	Instruction { :bufnum | <primitive: return sc.Instruction(_bufnum);> }
	JPverbRaw { :in1 :in2 :damp :earlydiff :highband :highx :lowband :lowx :mdepth :mfreq :midx :size :t60 | <primitive: return sc.JPverbRaw(_in1, _in2, _damp, _earlydiff, _highband, _highx, _lowband, _lowx, _mdepth, _mfreq, _midx, _size, _t60);> }
	KMeansRT { :bufnum :inputdata :k :gate :reset :learn | <primitive: return sc.KMeansRT(_bufnum, _inputdata, _k, _gate, _reset, _learn);> }
	KeyClarity { :chain :keydecay :chromaleak | <primitive: return sc.KeyClarity(_chain, _keydecay, _chromaleak);> }
	KeyMode { :chain :keydecay :chromaleak | <primitive: return sc.KeyMode(_chain, _keydecay, _chromaleak);> }
	KmeansToBPSet1 { :freq :numdatapoints :maxnummeans :nummeans :tnewdata :tnewmeans :soft :bufnum | <primitive: return sc.KmeansToBPSet1(_freq, _numdatapoints, _maxnummeans, _nummeans, _tnewdata, _tnewmeans, _soft, _bufnum);> }
	LADSPA { :nChans :id :args | <primitive: return sc.LADSPA(_nChans, _id, _args);> }
	LFBrownNoise0 { :freq :dev :dist | <primitive: return sc.LFBrownNoise0(_freq, _dev, _dist);> }
	LfBrownNoise1 { :freq :dev :dist | <primitive: return sc.LFBrownNoise1(_freq, _dev, _dist);> }
	LFBrownNoise2 { :freq :dev :dist | <primitive: return sc.LFBrownNoise2(_freq, _dev, _dist);> }
	LPCAnalyzer { :input :source :n :p :testE :delta :windowtype | <primitive: return sc.LPCAnalyzer(_input, _source, _n, _p, _testE, _delta, _windowtype);> }
	LPCError { :input :p | <primitive: return sc.LPCError(_input, _p);> }
	LPCSynth { :buffer :signal :pointer | <primitive: return sc.LPCSynth(_buffer, _signal, _pointer);> }
	LPCVals { :buffer :pointer | <primitive: return sc.LPCVals(_buffer, _pointer);> }
	LPF1 { :in :freq | <primitive: return sc.LPF1(_in, _freq);> }
	LPF18 { :in :freq :res :dist | <primitive: return sc.LPF18(_in, _freq, _res, _dist);> }
	LPFVS6 { :in :freq :slope | <primitive: return sc.LPFVS6(_in, _freq, _slope);> }
	LPG { :input :controlinput :controloffset :controlscale :vca :resonance :lowpassmode :linearity | <primitive: return sc.LPG(_input, _controlinput, _controloffset, _controlscale, _vca, _resonance, _lowpassmode, _linearity);> }
	LTI { :input :bufnuma :bufnumb | <primitive: return sc.LTI(_input, _bufnuma, _bufnumb);> }
	LagC { :in :timeUp :curveUp :timeDown :curveDown | <primitive: return sc.LagC(_in, _timeUp, _curveUp, _timeDown, _curveDown);> }
	Latoocarfian2DC { :minfreq :maxfreq :a :b :c :d :x0 :y0 | <primitive: return sc.Latoocarfian2DC(_minfreq, _maxfreq, _a, _b, _c, _d, _x0, _y0);> }
	Latoocarfian2DL { :minfreq :maxfreq :a :b :c :d :x0 :y0 | <primitive: return sc.Latoocarfian2DL(_minfreq, _maxfreq, _a, _b, _c, _d, _x0, _y0);> }
	Latoocarfian2DN { :minfreq :maxfreq :a :b :c :d :x0 :y0 | <primitive: return sc.Latoocarfian2DN(_minfreq, _maxfreq, _a, _b, _c, _d, _x0, _y0);> }
	LatoocarfianTrig { :minfreq :maxfreq :a :b :c :d :x0 :y0 | <primitive: return sc.LatoocarfianTrig(_minfreq, _maxfreq, _a, _b, _c, _d, _x0, _y0);> }
	LinRandN { :numChan :lo :hi :minmax | <primitive: return sc.LinRandN(_numChan, _lo, _hi, _minmax);> }
	ListTrig { :bufnum :reset :offset :numframes | <primitive: return sc.ListTrig(_bufnum, _reset, _offset, _numframes);> }
	ListTrig2 { :bufnum :reset :numframes | <primitive: return sc.ListTrig2(_bufnum, _reset, _numframes);> }
	Logger { :inputArray :trig :bufnum :reset | <primitive: return sc.Logger(_inputArray, _trig, _bufnum, _reset);> }
	LoopBuf { :numChan :bufnum :rate :gate :startPos :startLoop :endLoop :interpolation | <primitive: return sc.LoopBuf(_numChan, _bufnum, _rate, _gate, _startPos, _startLoop, _endLoop, _interpolation);> }
	LoopSet { :bufnum :left :right :gain :increment :spec | <primitive: return sc.LoopSet(_bufnum, _left, _right, _gain, _increment, _spec);> }
	Lorenz2DC { :minfreq :maxfreq :s :r :b :h :x0 :y0 :z0 | <primitive: return sc.Lorenz2DC(_minfreq, _maxfreq, _s, _r, _b, _h, _x0, _y0, _z0);> }
	Lorenz2DL { :minfreq :maxfreq :s :r :b :h :x0 :y0 :z0 | <primitive: return sc.Lorenz2DL(_minfreq, _maxfreq, _s, _r, _b, _h, _x0, _y0, _z0);> }
	Lorenz2DN { :minfreq :maxfreq :s :r :b :h :x0 :y0 :z0 | <primitive: return sc.Lorenz2DN(_minfreq, _maxfreq, _s, _r, _b, _h, _x0, _y0, _z0);> }
	LorenzTrig { :minfreq :maxfreq :s :r :b :h :x0 :y0 :z0 | <primitive: return sc.LorenzTrig(_minfreq, _maxfreq, _s, _r, _b, _h, _x0, _y0, _z0);> }
	Lores { :in :freq :res | <primitive: return sc.Lores(_in, _freq, _res);> }
	LotkaVolterra { :freq :a :b :c :d :h :xi :yi | <primitive: return sc.LotkaVolterra(_freq, _a, _b, _c, _d, _h, _xi, _yi);> }
	MCLDChaosGen { :maxSize | <primitive: return sc.MCLDChaosGen(_maxSize);> }
	MzPokey { :audf1 :audc1 :audf2 :audc2 :audf3 :audc3 :audf4 :audc4 :audctl | <primitive: return sc.MZPokey(_audf1, _audc1, _audf2, _audc2, _audf3, _audc3, _audf4, _audc4, _audctl);> }
	MarkovSynth { :in :isRecording :waitTime :tableSize | <primitive: return sc.MarkovSynth(_in, _isRecording, _waitTime, _tableSize);> }
	MatchingP { :dict :in :dictsize :ntofind :hop :method | <primitive: return sc.MatchingP(_dict, _in, _dictsize, _ntofind, _hop, _method);> }
	MatchingPResynth { :dict :method :trigger :residual :activs | <primitive: return sc.MatchingPResynth(_dict, _method, _trigger, _residual, _activs);> }
	Max { :in :numsamp | <primitive: return sc.Max(_in, _numsamp);> }
	Maxamp { :in :numSamps | <primitive: return sc.Maxamp(_in, _numSamps);> }
	MdaPiano { :freq :gate :vel :decay :release :hard :velhard :muffle :velmuff :velcurve :stereo :tune :random :stretch :sustain | <primitive: return sc.MdaPiano(_freq, _gate, _vel, _decay, _release, _hard, _velhard, _muffle, _velmuff, _velcurve, _stereo, _tune, _random, _stretch, _sustain);> }
	MeanTriggered { :in :trig :length | <primitive: return sc.MeanTriggered(_in, _trig, _length);> }
	Meddis { :input | <primitive: return sc.Meddis(_input);> }
	MedianSeparation { :fft :fftharmonic :fftpercussive :fftsize :mediansize :hardorsoft :p :medianormax | <primitive: return sc.MedianSeparation(_fft, _fftharmonic, _fftpercussive, _fftsize, _mediansize, _hardorsoft, _p, _medianormax);> }
	MedianTriggered { :in :trig :length | <primitive: return sc.MedianTriggered(_in, _trig, _length);> }
	MembraneCircle { :excitation :tension :loss | <primitive: return sc.MembraneCircle(_excitation, _tension, _loss);> }
	MembraneHexagon { :excitation :tension :loss | <primitive: return sc.MembraneHexagon(_excitation, _tension, _loss);> }
	Metro { :bpm :numBeats | <primitive: return sc.Metro(_bpm, _numBeats);> }
	MiBraids { :pitch :timbre :color :model :trig :resamp :decim :bits :ws | <primitive: return sc.MiBraids(_pitch, _timbre, _color, _model, _trig, _resamp, _decim, _bits, _ws);> }
	MiClouds { :pit :pos :size :dens :tex :drywet :in_gain :spread :rvb :fb :freeze :mode :lofi :trig :inputArray | <primitive: return sc.MiClouds(_pit, _pos, _size, _dens, _tex, _drywet, _in_gain, _spread, _rvb, _fb, _freeze, _mode, _lofi, _trig, _inputArray);> }
	MiElements { :blow_in :strike_in :gate :pit :strength :contour :bow_level :blow_level :strike_level :flow :mallet :bow_timb :blow_timb :strike_timb :geom :bright :damp :pos :space :model :easteregg | <primitive: return sc.MiElements(_blow_in, _strike_in, _gate, _pit, _strength, _contour, _bow_level, _blow_level, _strike_level, _flow, _mallet, _bow_timb, _blow_timb, _strike_timb, _geom, _bright, _damp, _pos, _space, _model, _easteregg);> }
	MiGrids { :bpm :map_x :map_y :chaos :bd_density :sd_density :hh_density :mode :swing :config | <primitive: return sc.MiGrids(_bpm, _map_x, _map_y, _chaos, _bd_density, _sd_density, _hh_density, _mode, _swing, _config);> }
	MiMu { :in :gain :bypass | <primitive: return sc.MiMu(_in, _gain, _bypass);> }
	MiOmi { :audio_in :gate :pit :contour :detune :level1 :level2 :ratio1 :ratio2 :fm1 :fm2 :fb :xfb :filter_mode :cutoff :reson :strength :env :rotate :space | <primitive: return sc.MiOmi(_audio_in, _gate, _pit, _contour, _detune, _level1, _level2, _ratio1, _ratio2, _fm1, _fm2, _fb, _xfb, _filter_mode, _cutoff, _reson, _strength, _env, _rotate, _space);> }
	MiPlaits { :pitch :engine :harm :timbre :morph :trigger :level :fm_mod :timb_mod :morph_mod :decay :lpg_colour | <primitive: return sc.MiPlaits(_pitch, _engine, _harm, _timbre, _morph, _trigger, _level, _fm_mod, _timb_mod, _morph_mod, _decay, _lpg_colour);> }
	MiRings { :in :trig :pit :struct :bright :damp :pos :model :poly :intern_exciter :easteregg :bypass | <primitive: return sc.MiRings(_in, _trig, _pit, _struct, _bright, _damp, _pos, _model, _poly, _intern_exciter, _easteregg, _bypass);> }
	MiRipples { :in :cf :reson :drive | <primitive: return sc.MiRipples(_in, _cf, _reson, _drive);> }
	MiTides { :freq :shape :slope :smooth :shift :trig :clock :output_mode :ramp_mode :ratio :rate | <primitive: return sc.MiTides(_freq, _shape, _slope, _smooth, _shift, _trig, _clock, _output_mode, _ramp_mode, _ratio, _rate);> }
	MiVerb { :time :drywet :damp :hp :freeze :diff :inputArray | <primitive: return sc.MiVerb(_time, _drywet, _damp, _hp, _freeze, _diff, _inputArray);> }
	MiWarps { :carrier :modulator :lev1 :lev2 :algo :timb :osc :freq :vgain :easteregg | <primitive: return sc.MiWarps(_carrier, _modulator, _lev1, _lev2, _algo, _timb, _osc, _freq, _vgain, _easteregg);> }
	MonoGrain { :in :winsize :grainrate :winrandpct | <primitive: return sc.MonoGrain(_in, _winsize, _grainrate, _winrandpct);> }
	MonoGrainBF { :in :winsize :grainrate :winrandpct :azimuth :azrand :elevation :elrand :rho | <primitive: return sc.MonoGrainBF(_in, _winsize, _grainrate, _winrandpct, _azimuth, _azrand, _elevation, _elrand, _rho);> }
	MoogLadder { :in :ffreq :res | <primitive: return sc.MoogLadder(_in, _ffreq, _res);> }
	MoogVcf { :in :fco :res | <primitive: return sc.MoogVCF(_in, _fco, _res);> }
	NL { :input :bufnuma :bufnumb :guard1 :guard2 | <primitive: return sc.NL(_input, _bufnuma, _bufnumb, _guard1, _guard2);> }
	NL2 { :input :bufnum :maxsizea :maxsizeb :guard1 :guard2 | <primitive: return sc.NL2(_input, _bufnum, _maxsizea, _maxsizeb, _guard1, _guard2);> }
	NLFiltC { :input :a :b :d :c :l | <primitive: return sc.NLFiltC(_input, _a, _b, _d, _c, _l);> }
	NLFiltL { :input :a :b :d :c :l | <primitive: return sc.NLFiltL(_input, _a, _b, _d, _c, _l);> }
	NLFiltN { :input :a :b :d :c :l | <primitive: return sc.NLFiltN(_input, _a, _b, _d, _c, _l);> }
	NTube { :input :lossarray :karray :delaylengtharray | <primitive: return sc.NTube(_input, _lossarray, _karray, _delaylengtharray);> }
	NearestN { :treebuf :in :gate :num | <primitive: return sc.NearestN(_treebuf, _in, _gate, _num);> }
	NeedleRect { :rate :imgWidth :imgHeight :rectX :rectY :rectW :rectH | <primitive: return sc.NeedleRect(_rate, _imgWidth, _imgHeight, _rectX, _rectY, _rectW, _rectH);> }
	NeoFormant { :formantfreq :carrierfreq :phaseshift | <primitive: return sc.NeoFormant(_formantfreq, _carrierfreq, _phaseshift);> }
	NeoVarSawOsc { :freq :pw :waveshape | <primitive: return sc.NeoVarSawOsc(_freq, _pw, _waveshape);> }
	Nes2 { :trig :a0 :a1 :a2 :a3 :b0 :b1 :b2 :b3 :c0 :c2 :c3 :d0 :d2 :d3 :e0 :e1 :e2 :e3 :smask | <primitive: return sc.Nes2(_trig, _a0, _a1, _a2, _a3, _b0, _b1, _b2, _b3, _c0, _c2, _c3, _d0, _d2, _d3, _e0, _e1, _e2, _e3, _smask);> }
	NestedAllpassC { :in :maxdelay1 :delay1 :gain1 :maxdelay2 :delay2 :gain2 | <primitive: return sc.NestedAllpassC(_in, _maxdelay1, _delay1, _gain1, _maxdelay2, _delay2, _gain2);> }
	NestedAllpassL { :in :maxdelay1 :delay1 :gain1 :maxdelay2 :delay2 :gain2 | <primitive: return sc.NestedAllpassL(_in, _maxdelay1, _delay1, _gain1, _maxdelay2, _delay2, _gain2);> }
	NestedAllpassN { :in :maxdelay1 :delay1 :gain1 :maxdelay2 :delay2 :gain2 | <primitive: return sc.NestedAllpassN(_in, _maxdelay1, _delay1, _gain1, _maxdelay2, _delay2, _gain2);> }
	OSFold4 { :in :lo :hi | <primitive: return sc.OSFold4(_in, _lo, _hi);> }
	OSFold8 { :in :lo :hi | <primitive: return sc.OSFold8(_in, _lo, _hi);> }
	OSTrunc4 { :in :quant | <primitive: return sc.OSTrunc4(_in, _quant);> }
	OSTrunc8 { :in :quant | <primitive: return sc.OSTrunc8(_in, _quant);> }
	OSWrap4 { :in :lo :hi | <primitive: return sc.OSWrap4(_in, _lo, _hi);> }
	OSWrap8 { :in :lo :hi | <primitive: return sc.OSWrap8(_in, _lo, _hi);> }
	ObxdFilter { :in :cutoff :resonance :multimode :bandpass :fourpole | <primitive: return sc.ObxdFilter(_in, _cutoff, _resonance, _multimode, _bandpass, _fourpole);> }
	OnsetStatistics { :input :windowsize :hopsize | <primitive: return sc.OnsetStatistics(_input, _windowsize, _hopsize);> }
	Oregonator { :reset :rate :epsilon :mu :q :initx :inity :initz | <primitive: return sc.Oregonator(_reset, _rate, _epsilon, _mu, _q, _initx, _inity, _initz);> }
	OscBank { :freq :gain :saw8 :square8 :saw4 :square4 :saw2 :square2 :saw1 | <primitive: return sc.OscBank(_freq, _gain, _saw8, _square8, _saw4, _square4, _saw2, _square2, _saw1);> }
	OteyPiano { :freq :vel :t_gate :rmin :rmax :rampl :rampr :rcore :lmin :lmax :lampl :lampr :rho :e :zb :zh :mh :k :alpha :p :hpos :loss :detune :hammer_type | <primitive: return sc.OteyPiano(_freq, _vel, _t_gate, _rmin, _rmax, _rampl, _rampr, _rcore, _lmin, _lmax, _lampl, _lampr, _rho, _e, _zb, _zh, _mh, _k, _alpha, _p, _hpos, _loss, _detune, _hammer_type);> }
	OteyPianoStrings { :freq :vel :t_gate :rmin :rmax :rampl :rampr :rcore :lmin :lmax :lampl :lampr :rho :e :zb :zh :mh :k :alpha :p :hpos :loss :detune :hammer_type | <primitive: return sc.OteyPianoStrings(_freq, _vel, _t_gate, _rmin, _rmax, _rampl, _rampr, _rcore, _lmin, _lmax, _lampl, _lampr, _rho, _e, _zb, _zh, _mh, _k, _alpha, _p, _hpos, _loss, _detune, _hammer_type);> }
	OteySoundBoard { :inp :c1 :c3 :mix | <primitive: return sc.OteySoundBoard(_inp, _c1, _c3, _mix);> }
	PVInfo { :pvbuffer :binNum :filePointer | <primitive: return sc.PVInfo(_pvbuffer, _binNum, _filePointer);> }
	PVSynth { :pvbuffer :numBins :binStart :binSkip :filePointer :freqMul :freqAdd | <primitive: return sc.PVSynth(_pvbuffer, _numBins, _binStart, _binSkip, _filePointer, _freqMul, _freqAdd);> }
	PV_BinBufRd { :buffer :playbuf :point :binStart :binSkip :numBins :clear | <primitive: return sc.PV_BinBufRd(_buffer, _playbuf, _point, _binStart, _binSkip, _numBins, _clear);> }
	PV_BinDelay { :buffer :maxdelay :delaybuf :fbbuf :hop | <primitive: return sc.PV_BinDelay(_buffer, _maxdelay, _delaybuf, _fbbuf, _hop);> }
	PV_BinFilter { :buffer :start :end | <primitive: return sc.PV_BinFilter(_buffer, _start, _end);> }
	PV_BinPlayBuf { :buffer :playbuf :rate :offset :binStart :binSkip :numBins :loop :clear | <primitive: return sc.PV_BinPlayBuf(_buffer, _playbuf, _rate, _offset, _binStart, _binSkip, _numBins, _loop, _clear);> }
	PV_BufRd { :buffer :playbuf :point | <primitive: return sc.PV_BufRd(_buffer, _playbuf, _point);> }
	PV_CommonMag { :bufferA :bufferB :tolerance :remove | <primitive: return sc.PV_CommonMag(_bufferA, _bufferB, _tolerance, _remove);> }
	PV_CommonMul { :bufferA :bufferB :tolerance :remove | <primitive: return sc.PV_CommonMul(_bufferA, _bufferB, _tolerance, _remove);> }
	PV_Compander { :buffer :thresh :slopeBelow :slopeAbove | <primitive: return sc.PV_Compander(_buffer, _thresh, _slopeBelow, _slopeAbove);> }
	PV_Cutoff { :bufferA :bufferB :wipe | <primitive: return sc.PV_Cutoff(_bufferA, _bufferB, _wipe);> }
	PV_DecayTable { :fft_buf :decay_rate_buf :history_buf | <primitive: return sc.PV_DecayTable(_fft_buf, _decay_rate_buf, _history_buf);> }
	PV_EvenBin { :buffer | <primitive: return sc.PV_EvenBin(_buffer);> }
	PV_ExtractRepeat { :buffer :loopbuf :loopdur :memorytime :which :ffthop :thresh | <primitive: return sc.PV_ExtractRepeat(_buffer, _loopbuf, _loopdur, _memorytime, _which, _ffthop, _thresh);> }
	PV_Freeze { :buffer :freeze | <primitive: return sc.PV_Freeze(_buffer, _freeze);> }
	PV_FreqBuffer { :buffer :databuffer | <primitive: return sc.PV_FreqBuffer(_buffer, _databuffer);> }
	PV_Invert { :buffer | <primitive: return sc.PV_Invert(_buffer);> }
	PV_MagBuffer { :buffer :databuffer | <primitive: return sc.PV_MagBuffer(_buffer, _databuffer);> }
	PV_MagExp { :buffer | <primitive: return sc.PV_MagExp(_buffer);> }
	PV_MagGate { :buffer :thresh :remove | <primitive: return sc.PV_MagGate(_buffer, _thresh, _remove);> }
	PV_MagLog { :buffer | <primitive: return sc.PV_MagLog(_buffer);> }
	PV_MagMap { :buffer :mapbuf | <primitive: return sc.PV_MagMap(_buffer, _mapbuf);> }
	PV_MagMinus { :bufferA :bufferB :remove | <primitive: return sc.PV_MagMinus(_bufferA, _bufferB, _remove);> }
	PV_MagMulAdd { :buffer | <primitive: return sc.PV_MagMulAdd(_buffer);> }
	PV_MagScale { :bufferA :bufferB | <primitive: return sc.PV_MagScale(_bufferA, _bufferB);> }
	PV_MagSmooth { :buffer :factor | <primitive: return sc.PV_MagSmooth(_buffer, _factor);> }
	PV_MagSubtract { :bufferA :bufferB :zerolimit | <primitive: return sc.PV_MagSubtract(_bufferA, _bufferB, _zerolimit);> }
	PV_MaxMagN { :buffer :numbins | <primitive: return sc.PV_MaxMagN(_buffer, _numbins);> }
	PV_MinMagN { :buffer :numbins | <primitive: return sc.PV_MinMagN(_buffer, _numbins);> }
	PV_Morph { :bufferA :bufferB :morph | <primitive: return sc.PV_Morph(_bufferA, _bufferB, _morph);> }
	PV_NoiseSynthF { :buffer :threshold :numFrames :initflag | <primitive: return sc.PV_NoiseSynthF(_buffer, _threshold, _numFrames, _initflag);> }
	PV_NoiseSynthP { :buffer :threshold :numFrames :initflag | <primitive: return sc.PV_NoiseSynthP(_buffer, _threshold, _numFrames, _initflag);> }
	PV_OddBin { :buffer | <primitive: return sc.PV_OddBin(_buffer);> }
	PV_PartialSynthF { :buffer :threshold :numFrames :initflag | <primitive: return sc.PV_PartialSynthF(_buffer, _threshold, _numFrames, _initflag);> }
	PV_PartialSynthP { :buffer :threshold :numFrames :initflag | <primitive: return sc.PV_PartialSynthP(_buffer, _threshold, _numFrames, _initflag);> }
	PV_PitchShift { :buffer :ratio | <primitive: return sc.PV_PitchShift(_buffer, _ratio);> }
	PV_PlayBuf { :buffer :playbuf :rate :offset :loop | <primitive: return sc.PV_PlayBuf(_buffer, _playbuf, _rate, _offset, _loop);> }
	PV_RecordBuf { :buffer :recbuf :offset :run :loop :hop :wintype | <primitive: return sc.PV_RecordBuf(_buffer, _recbuf, _offset, _run, _loop, _hop, _wintype);> }
	PV_SoftWipe { :bufferA :bufferB :wipe | <primitive: return sc.PV_SoftWipe(_bufferA, _bufferB, _wipe);> }
	PV_SpectralEnhance { :buffer :numPartials :ratio :strength | <primitive: return sc.PV_SpectralEnhance(_buffer, _numPartials, _ratio, _strength);> }
	PV_SpectralMap { :buffer :specBuffer :floor :freeze :mode :norm :window | <primitive: return sc.PV_SpectralMap(_buffer, _specBuffer, _floor, _freeze, _mode, _norm, _window);> }
	PV_Split { :bufferA :bufferB | <primitive: return sc.PV_Split(_bufferA, _bufferB);> }
	PV_Whiten { :chain :trackbufnum :relaxtime :floor :smear :bindownsample | <primitive: return sc.PV_Whiten(_chain, _trackbufnum, _relaxtime, _floor, _smear, _bindownsample);> }
	PV_XFade { :bufferA :bufferB :fade | <primitive: return sc.PV_XFade(_bufferA, _bufferB, _fade);> }
	PanX { :numChans :in :pos :level :width | <primitive: return sc.PanX(_numChans, _in, _pos, _level, _width);> }
	PanX2D { :numChansX :numChansY :in :posX :posY :level :widthX :widthY | <primitive: return sc.PanX2D(_numChansX, _numChansY, _in, _posX, _posY, _level, _widthX, _widthY);> }
	PeakEQ2 { :in :freq :rs :db | <primitive: return sc.PeakEQ2(_in, _freq, _rs, _db);> }
	PeakEQ4 { :in :freq :rs :db | <primitive: return sc.PeakEQ4(_in, _freq, _rs, _db);> }
	Perlin3 { :x :y :z | <primitive: return sc.Perlin3(_x, _y, _z);> }
	PermMod { :in :freq | <primitive: return sc.PermMod(_in, _freq);> }
	PermModArray { :in :freq :pattern | <primitive: return sc.PermModArray(_in, _freq, _pattern);> }
	PermModT { :in :outfreq :infreq | <primitive: return sc.PermModT(_in, _outfreq, _infreq);> }
	PhasorModal { :input :freq :decay :damp :amp :phase | <primitive: return sc.PhasorModal(_input, _freq, _decay, _damp, _amp, _phase);> }
	PlaneTree { :treebuf :in :gate | <primitive: return sc.PlaneTree(_treebuf, _in, _gate);> }
	Pokey { :audf1 :audc1 :audf2 :audc2 :audf3 :audc3 :audf4 :audc4 :audctl | <primitive: return sc.Pokey(_audf1, _audc1, _audf2, _audc2, _audf3, _audc3, _audf4, _audc4, _audctl);> }
	PosRatio { :in :period :thresh | <primitive: return sc.PosRatio(_in, _period, _thresh);> }
	PrintVal { :in :numblocks :id | <primitive: return sc.PrintVal(_in, _numblocks, _id);> }
	Qitch { :in :databufnum :ampThreshold :algoflag :ampbufnum :minfreq :maxfreq | <primitive: return sc.Qitch(_in, _databufnum, _ampThreshold, _algoflag, _ampbufnum, _minfreq, _maxfreq);> }
	Rcd { :clock :rotate :reset :div :spread :auto :len :down :gates | <primitive: return sc.RCD(_clock, _rotate, _reset, _div, _spread, _auto, _len, _down, _gates);> }
	RLPFD { :in :ffreq :res :dist | <primitive: return sc.RLPFD(_in, _ffreq, _res, _dist);> }
	RMAFoodChainL { :freq :a1 :b1 :d1 :a2 :b2 :d2 :k :r :h :xi :yi :zi | <primitive: return sc.RMAFoodChainL(_freq, _a1, _b1, _d1, _a2, _b2, _d2, _k, _r, _h, _xi, _yi, _zi);> }
	RMEQ { :in :freq :rq :k | <primitive: return sc.RMEQ(_in, _freq, _rq, _k);> }
	RMEQSuite { :maxSize | <primitive: return sc.RMEQSuite(_maxSize);> }
	RMS { :in :lpFreq | <primitive: return sc.RMS(_in, _lpFreq);> }
	RMShelf { :in :freq :k | <primitive: return sc.RMShelf(_in, _freq, _k);> }
	RMShelf2 { :in :freq :k | <primitive: return sc.RMShelf2(_in, _freq, _k);> }
	RandN { :numChan :lo :hi | <primitive: return sc.RandN(_numChan, _lo, _hi);> }
	RedDPCMdecode { :in | <primitive: return sc.RedDPCMdecode(_in);> }
	RedDPCMencode { :in :round | <primitive: return sc.RedDPCMencode(_in, _round);> }
	RedLbyl { :in :thresh :samples | <primitive: return sc.RedLbyl(_in, _thresh, _samples);> }
	RedNoise { :clock | <primitive: return sc.RedNoise(_clock);> }
	RedPhasor { :trig :rate :start :end :loop :loopstart :loopend | <primitive: return sc.RedPhasor(_trig, _rate, _start, _end, _loop, _loopstart, _loopend);> }
	RedPhasor2 { :trig :rate :start :end :loop :loopstart :loopend | <primitive: return sc.RedPhasor2(_trig, _rate, _start, _end, _loop, _loopstart, _loopend);> }
	RegaliaMitraEQ { :in :freq :rq :k | <primitive: return sc.RegaliaMitraEQ(_in, _freq, _rq, _k);> }
	Resonator { :input :freq :position :resolution :structure :brightness :damping | <primitive: return sc.Resonator(_input, _freq, _position, _resolution, _structure, _brightness, _damping);> }
	Rongs { :trigger :sustain :f0 :structure :brightness :damping :accent :stretch :position :loss :modeNum :cosFreq | <primitive: return sc.Rongs(_trigger, _sustain, _f0, _structure, _brightness, _damping, _accent, _stretch, _position, _loss, _modeNum, _cosFreq);> }
	RosslerL { :freq :a :b :c :h :xi :yi :zi | <primitive: return sc.RosslerL(_freq, _a, _b, _c, _h, _xi, _yi, _zi);> }
	RosslerResL { :in :stiff :freq :a :b :c :h :xi :yi :zi | <primitive: return sc.RosslerResL(_in, _stiff, _freq, _a, _b, _c, _h, _xi, _yi, _zi);> }
	Rotate { :w :x :y :z :rotate | <primitive: return sc.Rotate(_w, _x, _y, _z, _rotate);> }
	Scm { :clock :bpm :rotate :slip :shuffle :skip :pw | <primitive: return sc.SCM(_clock, _bpm, _rotate, _slip, _shuffle, _skip, _pw);> }
	SID6581f { :freqLo0 :freqHi0 :pwLo0 :pwHi0 :ctrl0 :atkDcy0 :susRel0 :freqLo1 :freqHi1 :pwLo1 :pwHi1 :ctrl1 :atkDcy1 :susRel1 :freqLo2 :freqHi2 :pwLo2 :pwHi2 :ctrl2 :atkDcy2 :susRel2 :fcLo :fcHi :resFilt :modeVol :rate | <primitive: return sc.SID6581f(_freqLo0, _freqHi0, _pwLo0, _pwHi0, _ctrl0, _atkDcy0, _susRel0, _freqLo1, _freqHi1, _pwLo1, _pwHi1, _ctrl1, _atkDcy1, _susRel1, _freqLo2, _freqHi2, _pwLo2, _pwHi2, _ctrl2, _atkDcy2, _susRel2, _fcLo, _fcHi, _resFilt, _modeVol, _rate);> }
	SLOnset { :input :memorysize1 :before :after :threshold :hysteresis | <primitive: return sc.SLOnset(_input, _memorysize1, _before, _after, _threshold, _hysteresis);> }
	SMS { :input :maxpeaks :currentpeaks :tolerance :noisefloor :freqmult :freqadd :formantpreserve :useifft :ampmult :graphicsbufnum | <primitive: return sc.SMS(_input, _maxpeaks, _currentpeaks, _tolerance, _noisefloor, _freqmult, _freqadd, _formantpreserve, _useifft, _ampmult, _graphicsbufnum);> }
	SN76489 { :tone0 :tone1 :tone2 :noise :vol0 :vol1 :vol2 :vol3 :rate | <primitive: return sc.SN76489(_tone0, _tone1, _tone2, _noise, _vol0, _vol1, _vol2, _vol3, _rate);> }
	SOMAreaWr { :bufnum :inputdata :coords :netsize :numdims :nhood :gate | <primitive: return sc.SOMAreaWr(_bufnum, _inputdata, _coords, _netsize, _numdims, _nhood, _gate);> }
	SOMRd { :bufnum :inputdata :netsize :numdims :gate | <primitive: return sc.SOMRd(_bufnum, _inputdata, _netsize, _numdims, _gate);> }
	SOMTrain { :bufnum :inputdata :netsize :numdims :traindur :nhood :gate :initweight | <primitive: return sc.SOMTrain(_bufnum, _inputdata, _netsize, _numdims, _traindur, _nhood, _gate, _initweight);> }
	SVF { :signal :cutoff :res :lowpass :bandpass :highpass :notch :peak | <primitive: return sc.SVF(_signal, _cutoff, _res, _lowpass, _bandpass, _highpass, _notch, _peak);> }
	SamplerIndex { :buf :size :mnn | <primitive: return sc.SamplerIndex(_buf, _size, _mnn);> }
	SawDpw { :freq :iphase | <primitive: return sc.SawDPW(_freq, _iphase);> }
	SensoryDissonance { :fft :maxpeaks :peakthreshold :norm :clamp | <primitive: return sc.SensoryDissonance(_fft, _maxpeaks, _peakthreshold, _norm, _clamp);> }
	ShufflerB { :bufnum :readLocationMinima :readLocationMaxima :readIncrementMinima :readIncrementMaxima :durationMinima :durationMaxima :envelopeAmplitudeMinima :envelopeAmplitudeMaxima :envelopeShapeMinima :envelopeShapeMaxima :envelopeSkewMinima :envelopeSkewMaxima :stereoLocationMinima :stereoLocationMaxima :interOffsetTimeMinima :interOffsetTimeMaxima :ftableReadLocationIncrement :readIncrementQuanta :interOffsetTimeQuanta | <primitive: return sc.ShufflerB(_bufnum, _readLocationMinima, _readLocationMaxima, _readIncrementMinima, _readIncrementMaxima, _durationMinima, _durationMaxima, _envelopeAmplitudeMinima, _envelopeAmplitudeMaxima, _envelopeShapeMinima, _envelopeShapeMaxima, _envelopeSkewMinima, _envelopeSkewMaxima, _stereoLocationMinima, _stereoLocationMaxima, _interOffsetTimeMinima, _interOffsetTimeMaxima, _ftableReadLocationIncrement, _readIncrementQuanta, _interOffsetTimeQuanta);> }
	ShufflerL { :in :fragmentSize :maxDelay | <primitive: return sc.ShufflerL(_in, _fragmentSize, _maxDelay);> }
	Sieve1 { :bufnum :gap :alternate | <primitive: return sc.Sieve1(_bufnum, _gap, _alternate);> }
	SinGrain { :trigger :dur :freq | <primitive: return sc.SinGrain(_trigger, _dur, _freq);> }
	SinGrainB { :trigger :dur :freq :envbuf | <primitive: return sc.SinGrainB(_trigger, _dur, _freq, _envbuf);> }
	SinGrainBBF { :trigger :dur :freq :envbuf :azimuth :elevation :rho :wComp | <primitive: return sc.SinGrainBBF(_trigger, _dur, _freq, _envbuf, _azimuth, _elevation, _rho, _wComp);> }
	SinGrainBF { :trigger :dur :freq :azimuth :elevation :rho :wComp | <primitive: return sc.SinGrainBF(_trigger, _dur, _freq, _azimuth, _elevation, _rho, _wComp);> }
	SinGrainI { :trigger :dur :freq :envbuf1 :envbuf2 :ifac | <primitive: return sc.SinGrainI(_trigger, _dur, _freq, _envbuf1, _envbuf2, _ifac);> }
	SinGrainIBF { :trigger :dur :freq :envbuf1 :envbuf2 :ifac :azimuth :elevation :rho :wComp | <primitive: return sc.SinGrainIBF(_trigger, _dur, _freq, _envbuf1, _envbuf2, _ifac, _azimuth, _elevation, _rho, _wComp);> }
	SinTone { :freq :phase | <primitive: return sc.SinTone(_freq, _phase);> }
	SineShaper { :in :limit | <primitive: return sc.SineShaper(_in, _limit);> }
	SkipNeedle { :range :rate :offset | <primitive: return sc.SkipNeedle(_range, _rate, _offset);> }
	Slide { :in :slideup :slidedown | <primitive: return sc.Slide(_in, _slideup, _slidedown);> }
	Slub { :trig :spike | <primitive: return sc.Slub(_trig, _spike);> }
	SmoothDecimator { :in :rate :smoothing | <primitive: return sc.SmoothDecimator(_in, _rate, _smoothing);> }
	SoftClipAmp { :in :pregain | <primitive: return sc.SoftClipAmp(_in, _pregain);> }
	SoftClipAmp4 { :in :pregain | <primitive: return sc.SoftClipAmp4(_in, _pregain);> }
	SoftClipAmp8 { :in :pregain | <primitive: return sc.SoftClipAmp8(_in, _pregain);> }
	SoftClipper4 { :in | <primitive: return sc.SoftClipper4(_in);> }
	SoftClipper8 { :in | <primitive: return sc.SoftClipper8(_in);> }
	SortBuf { :bufnum :sortrate :reset | <primitive: return sc.SortBuf(_bufnum, _sortrate, _reset);> }
	SpectralEntropy { :numChan :fft :fftsize :numbands | <primitive: return sc.SpectralEntropy(_numChan, _fft, _fftsize, _numbands);> }
	Spreader { :in :theta :filtsPerOctave | <primitive: return sc.Spreader(_in, _theta, _filtsPerOctave);> }
	SpruceBudworm { :reset :rate :k1 :k2 :alpha :beta :mu :rho :initx :inity | <primitive: return sc.SpruceBudworm(_reset, _rate, _k1, _k2, _alpha, _beta, _mu, _rho, _initx, _inity);> }
	Squiz { :in :pitchratio :zcperchunk :memlen | <primitive: return sc.Squiz(_in, _pitchratio, _zcperchunk, _memlen);> }
	Standard2DC { :minfreq :maxfreq :k :x0 :y0 | <primitive: return sc.Standard2DC(_minfreq, _maxfreq, _k, _x0, _y0);> }
	Standard2DL { :minfreq :maxfreq :k :x0 :y0 | <primitive: return sc.Standard2DL(_minfreq, _maxfreq, _k, _x0, _y0);> }
	Standard2DN { :minfreq :maxfreq :k :x0 :y0 | <primitive: return sc.Standard2DN(_minfreq, _maxfreq, _k, _x0, _y0);> }
	StandardTrig { :minfreq :maxfreq :k :x0 :y0 | <primitive: return sc.StandardTrig(_minfreq, _maxfreq, _k, _x0, _y0);> }
	StkBandedWG { :freq :instr :bowpressure :bowmotion :integration :modalresonance :bowvelocity :setstriking :trig | <primitive: return sc.StkBandedWG(_freq, _instr, _bowpressure, _bowmotion, _integration, _modalresonance, _bowvelocity, _setstriking, _trig);> }
	StkBeeThree { :freq :op4gain :op3gain :lfospeed :lfodepth :adsrtarget :trig | <primitive: return sc.StkBeeThree(_freq, _op4gain, _op3gain, _lfospeed, _lfodepth, _adsrtarget, _trig);> }
	StkBlowHole { :freq :reedstiffness :noisegain :tonehole :register :breathpressure | <primitive: return sc.StkBlowHole(_freq, _reedstiffness, _noisegain, _tonehole, _register, _breathpressure);> }
	StkBowed { :freq :bowpressure :bowposition :vibfreq :vibgain :loudness :gate :attackrate :decayrate | <primitive: return sc.StkBowed(_freq, _bowpressure, _bowposition, _vibfreq, _vibgain, _loudness, _gate, _attackrate, _decayrate);> }
	StkClarinet { :freq :reedstiffness :noisegain :vibfreq :vibgain :breathpressure :trig | <primitive: return sc.StkClarinet(_freq, _reedstiffness, _noisegain, _vibfreq, _vibgain, _breathpressure, _trig);> }
	StkFlute { :freq :jetDelay :noisegain :jetRatio | <primitive: return sc.StkFlute(_freq, _jetDelay, _noisegain, _jetRatio);> }
	StkGlobals { :showWarnings :printErrors :rawfilepath | <primitive: return sc.StkGlobals(_showWarnings, _printErrors, _rawfilepath);> }
	StkInst { :freq :gate :onamp :offamp :instNumber :args | <primitive: return sc.StkInst(_freq, _gate, _onamp, _offamp, _instNumber, _args);> }
	StkMandolin { :freq :bodysize :pickposition :stringdamping :stringdetune :aftertouch :trig | <primitive: return sc.StkMandolin(_freq, _bodysize, _pickposition, _stringdamping, _stringdetune, _aftertouch, _trig);> }
	StkModalBar { :freq :instrument :stickhardness :stickposition :vibratogain :vibratofreq :directstickmix :volume :trig | <primitive: return sc.StkModalBar(_freq, _instrument, _stickhardness, _stickposition, _vibratogain, _vibratofreq, _directstickmix, _volume, _trig);> }
	StkMoog { :freq :filterQ :sweeprate :vibfreq :vibgain :gain :trig | <primitive: return sc.StkMoog(_freq, _filterQ, _sweeprate, _vibfreq, _vibgain, _gain, _trig);> }
	StkPluck { :freq :decay | <primitive: return sc.StkPluck(_freq, _decay);> }
	StkSaxofony { :freq :reedstiffness :reedaperture :noisegain :blowposition :vibratofrequency :vibratogain :breathpressure :trig | <primitive: return sc.StkSaxofony(_freq, _reedstiffness, _reedaperture, _noisegain, _blowposition, _vibratofrequency, _vibratogain, _breathpressure, _trig);> }
	StkShakers { :instr :energy :decay :objects :resfreq | <primitive: return sc.StkShakers(_instr, _energy, _decay, _objects, _resfreq);> }
	StkVoicForm { :freq :vuvmix :vowelphon :vibfreq :vibgain :loudness :trig | <primitive: return sc.StkVoicForm(_freq, _vuvmix, _vowelphon, _vibfreq, _vibgain, _loudness, _trig);> }
	Streson { :input :delayTime :res | <primitive: return sc.Streson(_input, _delayTime, _res);> }
	StringVoice { :trig :infsustain :freq :accent :structure :brightness :damping | <primitive: return sc.StringVoice(_trig, _infsustain, _freq, _accent, _structure, _brightness, _damping);> }
	Summer { :trig :step :reset :resetval | <primitive: return sc.Summer(_trig, _step, _reset, _resetval);> }
	SvfBp { :in :freq :q | <primitive: return sc.SvfBp(_in, _freq, _q);> }
	SvfHp { :in :freq :q | <primitive: return sc.SvfHp(_in, _freq, _q);> }
	SvfLp { :in :freq :q | <primitive: return sc.SvfLp(_in, _freq, _q);> }
	SwitchDelay { :in :drylevel :wetlevel :delaytime :delayfactor :maxdelaytime | <primitive: return sc.SwitchDelay(_in, _drylevel, _wetlevel, _delaytime, _delayfactor, _maxdelaytime);> }
	TBetaRand { :lo :hi :prob1 :prob2 :trig | <primitive: return sc.TBetaRand(_lo, _hi, _prob1, _prob2, _trig);> }
	TBrownRand { :lo :hi :dev :dist :trig | <primitive: return sc.TBrownRand(_lo, _hi, _dev, _dist, _trig);> }
	TExpRandN { :numChan :lo :hi :trigger | <primitive: return sc.TExpRandN(_numChan, _lo, _hi, _trigger);> }
	TGaussRand { :lo :hi :trig | <primitive: return sc.TGaussRand(_lo, _hi, _trig);> }
	TGrains2 { :numChan :trigger :bufnum :rate :centerPos :dur :pan :amp :att :dec :interp | <primitive: return sc.TGrains2(_numChan, _trigger, _bufnum, _rate, _centerPos, _dur, _pan, _amp, _att, _dec, _interp);> }
	TGrains3 { :numChan :trigger :bufnum :rate :centerPos :dur :pan :amp :att :dec :window :interp | <primitive: return sc.TGrains3(_numChan, _trigger, _bufnum, _rate, _centerPos, _dur, _pan, _amp, _att, _dec, _window, _interp);> }
	TLinRand { :lo :hi :minmax :trigger | <primitive: return sc.TLinRand(_lo, _hi, _minmax, _trigger);> }
	TLinRandN { :numChan :lo :hi :minmax :trigger | <primitive: return sc.TLinRandN(_numChan, _lo, _hi, _minmax, _trigger);> }
	TPV { :chain :windowsize :hopsize :maxpeaks :currentpeaks :freqmult :tolerance :noisefloor | <primitive: return sc.TPV(_chain, _windowsize, _hopsize, _maxpeaks, _currentpeaks, _freqmult, _tolerance, _noisefloor);> }
	TRandN { :numChan :lo :hi :trigger | <primitive: return sc.TRandN(_numChan, _lo, _hi, _trigger);> }
	TScramble { :trigger :inputs | <primitive: return sc.TScramble(_trigger, _inputs);> }
	TTendency { :trigger :dist :parX :parY :parA :parB | <primitive: return sc.TTendency(_trigger, _dist, _parX, _parY, _parA, _parB);> }
	Tartini { :in :threshold :n :k :overlap :smallCutoff | <primitive: return sc.Tartini(_in, _threshold, _n, _k, _overlap, _smallCutoff);> }
	TermanWang { :input :reset :ratex :ratey :alpha :beta :eta :initx :inity | <primitive: return sc.TermanWang(_input, _reset, _ratex, _ratey, _alpha, _beta, _eta, _initx, _inity);> }
	TextVU { :trig :in :label :width :reset :ana | <primitive: return sc.TextVU(_trig, _in, _label, _width, _reset, _ana);> }
	Tilt { :w :x :y :z :tilt | <primitive: return sc.Tilt(_w, _x, _y, _z, _tilt);> }
	TracePlay { :bufnum :degree :rate :axis | <primitive: return sc.TracePlay(_bufnum, _degree, _rate, _axis);> }
	TraceRead { :bufnum :degree :index :axis | <primitive: return sc.TraceRead(_bufnum, _degree, _index, _axis);> }
	TrigAvg { :in :trig | <primitive: return sc.TrigAvg(_in, _trig);> }
	Tumble { :w :x :y :z :tilt | <primitive: return sc.Tumble(_w, _x, _y, _z, _tilt);> }
	TwoTube { :input :k :loss :d1length :d2length | <primitive: return sc.TwoTube(_input, _k, _loss, _d1length, _d2length);> }
	UHJ2B { :ls :rs | <primitive: return sc.UHJ2B(_ls, _rs);> }
	VBAP { :numChan :in :bufnum :azimuth :elevation :spread | <primitive: return sc.VBAP(_numChan, _in, _bufnum, _azimuth, _elevation, _spread);> }
	VBChebyFilt { :in :freq :mode :order | <primitive: return sc.VBChebyFilt(_in, _freq, _mode, _order);> }
	VBFourses { :smoother :freqarray | <primitive: return sc.VBFourses(_smoother, _freqarray);> }
	VbJonVerb { :in :decay :damping :inputbw :erfl :tail | <primitive: return sc.VBJonVerb(_in, _decay, _damping, _inputbw, _erfl, _tail);> }
	VBPVoc { :numChannels :bufnum :playpos :fftsize | <primitive: return sc.VBPVoc(_numChannels, _bufnum, _playpos, _fftsize);> }
	VMScan2D { :bufnum | <primitive: return sc.VMScan2D(_bufnum);> }
	Vosim { :trig :freq :nCycles :decay | <primitive: return sc.VOSIM(_trig, _freq, _nCycles, _decay);> }
	VarShapeOsc { :freq :pw :waveshape :sync :syncfreq | <primitive: return sc.VarShapeOsc(_freq, _pw, _waveshape, _sync, _syncfreq);> }
	VosimOsc { :freq :form1freq :form2freq :shape | <primitive: return sc.VosimOsc(_freq, _form1freq, _form2freq, _shape);> }
	WAmp { :in :winSize | <primitive: return sc.WAmp(_in, _winSize);> }
	WalshHadamard { :input :which | <primitive: return sc.WalshHadamard(_input, _which);> }
	WarpZ { :numChan :bufnum :pointer :freqScale :windowSize :envbufnum :overlaps :windowRandRatio :interp :zeroSearch :zeroStart | <primitive: return sc.WarpZ(_numChan, _bufnum, _pointer, _freqScale, _windowSize, _envbufnum, _overlaps, _windowRandRatio, _interp, _zeroSearch, _zeroStart);> }
	WaveLoss { :in :drop :outof :mode | <primitive: return sc.WaveLoss(_in, _drop, _outof, _mode);> }
	WaveTerrain { :bufnum :x :y :xsize :ysize | <primitive: return sc.WaveTerrain(_bufnum, _x, _y, _xsize, _ysize);> }
	WaveletDaub { :input :n :which | <primitive: return sc.WaveletDaub(_input, _n, _which);> }
	WeaklyNonlinear { :input :reset :ratex :ratey :freq :initx :inity :alpha :xexponent :beta :yexponent | <primitive: return sc.WeaklyNonlinear(_input, _reset, _ratex, _ratey, _freq, _initx, _inity, _alpha, _xexponent, _beta, _yexponent);> }
	WeaklyNonlinear2 { :input :reset :ratex :ratey :freq :initx :inity :alpha :xexponent :beta :yexponent | <primitive: return sc.WeaklyNonlinear2(_input, _reset, _ratex, _ratey, _freq, _initx, _inity, _alpha, _xexponent, _beta, _yexponent);> }
	Werner { :input :freq :damp :feedback :drive :oversample | <primitive: return sc.Werner(_input, _freq, _damp, _feedback, _drive, _oversample);> }
	WrapSummer { :trig :step :min :max :reset :resetval | <primitive: return sc.WrapSummer(_trig, _step, _min, _max, _reset, _resetval);> }
	ZOsc { :freq :formantfreq :shape :mode | <primitive: return sc.ZOsc(_freq, _formantfreq, _shape, _mode);> }
}
