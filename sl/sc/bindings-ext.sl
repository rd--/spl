+ Object {
	A2B { arg a, b, c, d; <primitive: return sc.A2B(_a, _b, _c, _d);> }
	AY { arg tonea, toneb, tonec, noise, control, vola, volb, volc, envfreq, envstyle, chiptype; <primitive: return sc.AY(_tonea, _toneb, _tonec, _noise, _control, _vola, _volb, _volc, _envfreq, _envstyle, _chiptype);> }
	AY8910 { arg r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, rA, rB, rC, rD, rate; <primitive: return sc.AY8910(_r0, _r1, _r2, _r3, _r4, _r5, _r6, _r7, _r8, _r9, _rA, _rB, _rC, _rD, _rate);> }
	Allpass1 { arg in, freq; <primitive: return sc.Allpass1(_in, _freq);> }
	Allpass2 { arg in, freq, rq; <primitive: return sc.Allpass2(_in, _freq, _rq);> }
	AmplitudeMod { arg in, attackTime, releaseTime; <primitive: return sc.AmplitudeMod(_in, _attackTime, _releaseTime);> }
	AnalogBassDrum { arg trig, infsustain, accent, freq, tone, decay, attackfm, selffm; <primitive: return sc.AnalogBassDrum(_trig, _infsustain, _accent, _freq, _tone, _decay, _attackfm, _selffm);> }
	AnalogFoldOsc { arg freq, amp; <primitive: return sc.AnalogFoldOsc(_freq, _amp);> }
	AnalogPhaser { arg input, lfoinput, skew, feedback, modulation, stages; <primitive: return sc.AnalogPhaser(_input, _lfoinput, _skew, _feedback, _modulation, _stages);> }
	AnalogPhaserMod { arg input, skew, modulation, stages; <primitive: return sc.AnalogPhaserMod(_input, _skew, _modulation, _stages);> }
	AnalogPulseShaper { arg pulseinput, width, decay, double; <primitive: return sc.AnalogPulseShaper(_pulseinput, _width, _decay, _double);> }
	AnalogSnareDrum { arg trig, infsustain, accent, freq, tone, decay, snappy; <primitive: return sc.AnalogSnareDrum(_trig, _infsustain, _accent, _freq, _tone, _decay, _snappy);> }
	AnalogTape { arg input, bias, saturation, drive, oversample, mode; <primitive: return sc.AnalogTape(_input, _bias, _saturation, _drive, _oversample, _mode);> }
	AnalogVintageDistortion { arg input, drivegain, bias, lowgain, highgain, shelvingfreq, oversample; <primitive: return sc.AnalogVintageDistortion(_input, _drivegain, _bias, _lowgain, _highgain, _shelvingfreq, _oversample);> }
	AnalyseEvents2 { arg in, bufnum, threshold, triggerid, circular, pitch; <primitive: return sc.AnalyseEvents2(_in, _bufnum, _threshold, _triggerid, _circular, _pitch);> }
	ArneodoCoulletTresser { arg freq, alpha, h, xi, yi, zi; <primitive: return sc.ArneodoCoulletTresser(_freq, _alpha, _h, _xi, _yi, _zi);> }
	ArrayMax { arg array; <primitive: return sc.ArrayMax(_array);> }
	ArrayMin { arg array; <primitive: return sc.ArrayMin(_array);> }
	Astrocade { arg reg0, reg1, reg2, reg3, reg4, reg5, reg6, reg7; <primitive: return sc.Astrocade(_reg0, _reg1, _reg2, _reg3, _reg4, _reg5, _reg6, _reg7);> }
	Atari2600 { arg audc0, audc1, audf0, audf1, audv0, audv1, rate; <primitive: return sc.Atari2600(_audc0, _audc1, _audf0, _audf1, _audv0, _audv1, _rate);> }
	AtsAmp { arg atsbuffer, partialNum, filePointer; <primitive: return sc.AtsAmp(_atsbuffer, _partialNum, _filePointer);> }
	AtsBand { arg atsbuffer, band, filePointer; <primitive: return sc.AtsBand(_atsbuffer, _band, _filePointer);> }
	AtsFreq { arg atsbuffer, partialNum, filePointer; <primitive: return sc.AtsFreq(_atsbuffer, _partialNum, _filePointer);> }
	AtsNoiSynth { arg atsbuffer, numPartials, partialStart, partialSkip, filePointer, sinePct, noisePct, freqMul, freqAdd, numBands, bandStart, bandSkip; <primitive: return sc.AtsNoiSynth(_atsbuffer, _numPartials, _partialStart, _partialSkip, _filePointer, _sinePct, _noisePct, _freqMul, _freqAdd, _numBands, _bandStart, _bandSkip);> }
	AtsNoise { arg atsbuffer, bandNum, filePointer; <primitive: return sc.AtsNoise(_atsbuffer, _bandNum, _filePointer);> }
	AtsParInfo { arg atsbuffer, partialNum, filePointer; <primitive: return sc.AtsParInfo(_atsbuffer, _partialNum, _filePointer);> }
	AtsPartial { arg atsbuffer, partial, filePointer, freqMul, freqAdd; <primitive: return sc.AtsPartial(_atsbuffer, _partial, _filePointer, _freqMul, _freqAdd);> }
	AtsSynth { arg atsbuffer, numPartials, partialStart, partialSkip, filePointer, freqMul, freqAdd; <primitive: return sc.AtsSynth(_atsbuffer, _numPartials, _partialStart, _partialSkip, _filePointer, _freqMul, _freqAdd);> }
	AtsUGen { arg maxSize; <primitive: return sc.AtsUGen(_maxSize);> }
	AttackSlope { arg input, windowsize, peakpicksize, leak, energythreshold, sumthreshold, mingap, numslopesaveraged; <primitive: return sc.AttackSlope(_input, _windowsize, _peakpicksize, _leak, _energythreshold, _sumthreshold, _mingap, _numslopesaveraged);> }
	AudioMSG { arg in, index; <primitive: return sc.AudioMSG(_in, _index);> }
	AverageOutput { arg in, trig; <primitive: return sc.AverageOutput(_in, _trig);> }
	B2A { arg w, x, y, z; <primitive: return sc.B2A(_w, _x, _y, _z);> }
	B2Ster { arg w, x, y; <primitive: return sc.B2Ster(_w, _x, _y);> }
	B2UHJ { arg w, x, y; <primitive: return sc.B2UHJ(_w, _x, _y);> }
	BBlockerBuf { arg freq, bufnum, startpoint; <primitive: return sc.BBlockerBuf(_freq, _bufnum, _startpoint);> }
	BFDecode1 { arg w, x, y, z, azimuth, elevation, wComp; <primitive: return sc.BFDecode1(_w, _x, _y, _z, _azimuth, _elevation, _wComp);> }
	BFDecoder { arg maxSize; <primitive: return sc.BFDecoder(_maxSize);> }
	BFEncode1 { arg in, azimuth, elevation, rho, gain, wComp; <primitive: return sc.BFEncode1(_in, _azimuth, _elevation, _rho, _gain, _wComp);> }
	BFEncode2 { arg in, point_x, point_y, elevation, gain, wComp; <primitive: return sc.BFEncode2(_in, _point_x, _point_y, _elevation, _gain, _wComp);> }
	BFEncodeSter { arg l, r, azimuth, width, elevation, rho, gain, wComp; <primitive: return sc.BFEncodeSter(_l, _r, _azimuth, _width, _elevation, _rho, _gain, _wComp);> }
	BFGrainPanner { arg maxSize; <primitive: return sc.BFGrainPanner(_maxSize);> }
	BFManipulate { arg w, x, y, z, rotate, tilt, tumble; <primitive: return sc.BFManipulate(_w, _x, _y, _z, _rotate, _tilt, _tumble);> }
	BFPanner { arg maxSize; <primitive: return sc.BFPanner(_maxSize);> }
	BLBufRd { arg bufnum, phase, ratio; <primitive: return sc.BLBufRd(_bufnum, _phase, _ratio);> }
	BLOsc { arg freq, pulsewidth, waveform; <primitive: return sc.BLOsc(_freq, _pulsewidth, _waveform);> }
	BMoog { arg in, freq, q, mode, saturation; <primitive: return sc.BMoog(_in, _freq, _q, _mode, _saturation);> }
	Balance { arg in, test, hp, stor; <primitive: return sc.Balance(_in, _test, _hp, _stor);> }
	BeatStatistics { arg fft, leak, numpreviousbeats; <primitive: return sc.BeatStatistics(_fft, _leak, _numpreviousbeats);> }
	Beep { arg freq, vol; <primitive: return sc.Beep(_freq, _vol);> }
	BeepU { arg maxSize; <primitive: return sc.BeepU(_maxSize);> }
	Bezier { arg haltAfter, dx, freq, phase, param; <primitive: return sc.Bezier(_haltAfter, _dx, _freq, _phase, _param);> }
	BinData { arg buffer, bin, overlaps; <primitive: return sc.BinData(_buffer, _bin, _overlaps);> }
	BlitB3 { arg freq; <primitive: return sc.BlitB3(_freq);> }
	BlitB3D { arg freq; <primitive: return sc.BlitB3D(_freq);> }
	BlitB3Saw { arg freq, leak; <primitive: return sc.BlitB3Saw(_freq, _leak);> }
	BlitB3Square { arg freq, leak; <primitive: return sc.BlitB3Square(_freq, _leak);> }
	BlitB3Tri { arg freq, leak, leak2; <primitive: return sc.BlitB3Tri(_freq, _leak, _leak2);> }
	Breakcore { arg bufnum, capturein, capturetrigger, duration, ampdropout; <primitive: return sc.Breakcore(_bufnum, _capturein, _capturetrigger, _duration, _ampdropout);> }
	Brusselator { arg reset, rate, mu, gamma, initx, inity; <primitive: return sc.Brusselator(_reset, _rate, _mu, _gamma, _initx, _inity);> }
	BufGrain { arg trigger, dur, sndbuf, rate, pos, interp; <primitive: return sc.BufGrain(_trigger, _dur, _sndbuf, _rate, _pos, _interp);> }
	BufGrainB { arg trigger, dur, sndbuf, rate, pos, envbuf, interp; <primitive: return sc.BufGrainB(_trigger, _dur, _sndbuf, _rate, _pos, _envbuf, _interp);> }
	BufGrainBBF { arg trigger, dur, sndbuf, rate, pos, envbuf, azimuth, elevation, rho, interp, wComp; <primitive: return sc.BufGrainBBF(_trigger, _dur, _sndbuf, _rate, _pos, _envbuf, _azimuth, _elevation, _rho, _interp, _wComp);> }
	BufGrainBF { arg trigger, dur, sndbuf, rate, pos, azimuth, elevation, rho, interp, wComp; <primitive: return sc.BufGrainBF(_trigger, _dur, _sndbuf, _rate, _pos, _azimuth, _elevation, _rho, _interp, _wComp);> }
	BufGrainI { arg trigger, dur, sndbuf, rate, pos, envbuf1, envbuf2, ifac, interp; <primitive: return sc.BufGrainI(_trigger, _dur, _sndbuf, _rate, _pos, _envbuf1, _envbuf2, _ifac, _interp);> }
	BufGrainIBF { arg trigger, dur, sndbuf, rate, pos, envbuf1, envbuf2, ifac, azimuth, elevation, rho, interp, wComp; <primitive: return sc.BufGrainIBF(_trigger, _dur, _sndbuf, _rate, _pos, _envbuf1, _envbuf2, _ifac, _azimuth, _elevation, _rho, _interp, _wComp);> }
	BufMax { arg bufnum, gate; <primitive: return sc.BufMax(_bufnum, _gate);> }
	BufMin { arg bufnum, gate; <primitive: return sc.BufMin(_bufnum, _gate);> }
	CQ_Diff { arg in1, in2, databufnum; <primitive: return sc.CQ_Diff(_in1, _in2, _databufnum);> }
	Cepstrum { arg cepbuf, fftchain; <primitive: return sc.Cepstrum(_cepbuf, _fftchain);> }
	Chen { arg speed, a, b, c; <primitive: return sc.Chen(_speed, _a, _b, _c);> }
	Chromagram { arg fft, fftsize, n, tuningbase, octaves, integrationflag, coeff, octaveratio, perframenormalize; <primitive: return sc.Chromagram(_fft, _fftsize, _n, _tuningbase, _octaves, _integrationflag, _coeff, _octaveratio, _perframenormalize);> }
	CircleRamp { arg in, lagTime, circmin, circmax; <primitive: return sc.CircleRamp(_in, _lagTime, _circmin, _circmax);> }
	Clipper32 { arg in, lo, hi; <primitive: return sc.Clipper32(_in, _lo, _hi);> }
	Clipper4 { arg in, lo, hi; <primitive: return sc.Clipper4(_in, _lo, _hi);> }
	Clipper8 { arg in, lo, hi; <primitive: return sc.Clipper8(_in, _lo, _hi);> }
	CombLP { arg in, gate, maxdelaytime, delaytime, decaytime, coef; <primitive: return sc.CombLP(_in, _gate, _maxdelaytime, _delaytime, _decaytime, _coef);> }
	ComplexRes { arg in, freq, decay; <primitive: return sc.ComplexRes(_in, _freq, _decay);> }
	Concat { arg control, source, storesize, seektime, seekdur, matchlength, freezestore, zcr, lms, sc, st, randscore; <primitive: return sc.Concat(_control, _source, _storesize, _seektime, _seekdur, _matchlength, _freezestore, _zcr, _lms, _sc, _st, _randscore);> }
	Concat2 { arg control, source, storesize, seektime, seekdur, matchlength, freezestore, zcr, lms, sc, st, randscore, threshold; <primitive: return sc.Concat2(_control, _source, _storesize, _seektime, _seekdur, _matchlength, _freezestore, _zcr, _lms, _sc, _st, _randscore, _threshold);> }
	Coyote { arg in, trackFall, slowLag, fastLag, fastMul, thresh, minDur; <primitive: return sc.Coyote(_in, _trackFall, _slowLag, _fastLag, _fastMul, _thresh, _minDur);> }
	Crest { arg in, numsamps, gate; <primitive: return sc.Crest(_in, _numsamps, _gate);> }
	CrossoverDistortion { arg in, amp, smooth; <primitive: return sc.CrossoverDistortion(_in, _amp, _smooth);> }
	DCompressor { arg input, sidechainIn, sidechain, ratio, threshold, attack, release, makeup, automakeup; <primitive: return sc.DCompressor(_input, _sidechainIn, _sidechain, _ratio, _threshold, _attack, _release, _makeup, _automakeup);> }
	DFM1 { arg in, freq, res, inputgain, type, noiselevel; <primitive: return sc.DFM1(_in, _freq, _res, _inputgain, _type, _noiselevel);> }
	DNoiseRing { arg change, chance, shift, numBits, resetval; <primitive: return sc.DNoiseRing(_change, _chance, _shift, _numBits, _resetval);> }
	DPW3Tri { arg freq; <primitive: return sc.DPW3Tri(_freq);> }
	DPW4Saw { arg freq; <primitive: return sc.DPW4Saw(_freq);> }
	DWGBowed { arg freq, velb, force, gate, pos, release, c1, c3, impZ, fB; <primitive: return sc.DWGBowed(_freq, _velb, _force, _gate, _pos, _release, _c1, _c3, _impZ, _fB);> }
	DWGBowedSimple { arg freq, velb, force, gate, pos, release, c1, c3; <primitive: return sc.DWGBowedSimple(_freq, _velb, _force, _gate, _pos, _release, _c1, _c3);> }
	DWGBowedTor { arg freq, velb, force, gate, pos, release, c1, c3, impZ, fB, mistune, c1tor, c3tor, iZtor; <primitive: return sc.DWGBowedTor(_freq, _velb, _force, _gate, _pos, _release, _c1, _c3, _impZ, _fB, _mistune, _c1tor, _c3tor, _iZtor);> }
	DWGPlucked { arg freq, amp, gate, pos, c1, c3, inp, release; <primitive: return sc.DWGPlucked(_freq, _amp, _gate, _pos, _c1, _c3, _inp, _release);> }
	DWGPlucked2 { arg freq, amp, gate, pos, c1, c3, inp, release, mistune, mp, gc; <primitive: return sc.DWGPlucked2(_freq, _amp, _gate, _pos, _c1, _c3, _inp, _release, _mistune, _mp, _gc);> }
	DWGPluckedStiff { arg freq, amp, gate, pos, c1, c3, inp, release, fB; <primitive: return sc.DWGPluckedStiff(_freq, _amp, _gate, _pos, _c1, _c3, _inp, _release, _fB);> }
	DWGSoundBoard { arg inp, c1, c3, mix, d1, d2, d3, d4, d5, d6, d7, d8; <primitive: return sc.DWGSoundBoard(_inp, _c1, _c3, _mix, _d1, _d2, _d3, _d4, _d5, _d6, _d7, _d8);> }
	Dbrown2 { arg lo, hi, step, dist, length; <primitive: return sc.Dbrown2(_lo, _hi, _step, _dist, _length);> }
	DbufTag { arg bufnum, v, axiom, rules, recycle, mode; <primitive: return sc.DbufTag(_bufnum, _v, _axiom, _rules, _recycle, _mode);> }
	Decimator { arg in, rate, bits; <primitive: return sc.Decimator(_in, _rate, _bits);> }
	DelayMap { arg bufnum, in, dynamic, spec; <primitive: return sc.DelayMap(_bufnum, _in, _dynamic, _spec);> }
	DelaySet { arg in, spec; <primitive: return sc.DelaySet(_in, _spec);> }
	DelaySetBuf { arg bufnum, in, spec; <primitive: return sc.DelaySetBuf(_bufnum, _in, _spec);> }
	DetaBlockerBuf { arg bufnum, startpoint; <primitive: return sc.DetaBlockerBuf(_bufnum, _startpoint);> }
	Dfsm { arg rules, n, rgen; <primitive: return sc.Dfsm(_rules, _n, _rgen);> }
	Dgauss { arg lo, hi, length; <primitive: return sc.Dgauss(_lo, _hi, _length);> }
	DiodeRingMod { arg car, mod; <primitive: return sc.DiodeRingMod(_car, _mod);> }
	Disintegrator { arg in, probability, multiplier; <primitive: return sc.Disintegrator(_in, _probability, _multiplier);> }
	Dl { arg numChannels, inputArray; <primitive: return sc.Dl(_numChannels, _inputArray);> }
	Dneuromodule { arg numChan, dt, theta, x, weights; <primitive: return sc.Dneuromodule(_numChan, _dt, _theta, _x, _weights);> }
	DoubleNestedAllpassC { arg in, maxdelay1, delay1, gain1, maxdelay2, delay2, gain2, maxdelay3, delay3, gain3; <primitive: return sc.DoubleNestedAllpassC(_in, _maxdelay1, _delay1, _gain1, _maxdelay2, _delay2, _gain2, _maxdelay3, _delay3, _gain3);> }
	DoubleNestedAllpassL { arg in, maxdelay1, delay1, gain1, maxdelay2, delay2, gain2, maxdelay3, delay3, gain3; <primitive: return sc.DoubleNestedAllpassL(_in, _maxdelay1, _delay1, _gain1, _maxdelay2, _delay2, _gain2, _maxdelay3, _delay3, _gain3);> }
	DoubleNestedAllpassN { arg in, maxdelay1, delay1, gain1, maxdelay2, delay2, gain2, maxdelay3, delay3, gain3; <primitive: return sc.DoubleNestedAllpassN(_in, _maxdelay1, _delay1, _gain1, _maxdelay2, _delay2, _gain2, _maxdelay3, _delay3, _gain3);> }
	DoubleWell { arg reset, ratex, ratey, f, w, delta, initx, inity; <primitive: return sc.DoubleWell(_reset, _ratex, _ratey, _f, _w, _delta, _initx, _inity);> }
	DoubleWell2 { arg reset, ratex, ratey, f, w, delta, initx, inity; <primitive: return sc.DoubleWell2(_reset, _ratex, _ratey, _f, _w, _delta, _initx, _inity);> }
	DoubleWell3 { arg reset, rate, f, delta, initx, inity; <primitive: return sc.DoubleWell3(_reset, _rate, _f, _delta, _initx, _inity);> }
	DriveNoise { arg in, amount, multi; <primitive: return sc.DriveNoise(_in, _amount, _multi);> }
	DrumTrack { arg in, lock, dynleak, tempowt, phasewt, basswt, patternwt, prior, kicksensitivity, snaresensitivity, debugmode; <primitive: return sc.DrumTrack(_in, _lock, _dynleak, _tempowt, _phasewt, _basswt, _patternwt, _prior, _kicksensitivity, _snaresensitivity, _debugmode);> }
	Dtag { arg bufsize, v, axiom, rules, recycle, mode; <primitive: return sc.Dtag(_bufsize, _v, _axiom, _rules, _recycle, _mode);> }
	DustRange { arg iotMin, iotMax; <primitive: return sc.DustRange(_iotMin, _iotMax);> }
	Dx7 { arg bufnum, on, off, data, vc, mnn, vel, pw, mw, bc, fc; <primitive: return sc.Dx7(_bufnum, _on, _off, _data, _vc, _mnn, _vel, _pw, _mw, _bc, _fc);> }
	Dx7Env { arg gate, data, r1, r2, r3, r4, l1, l2, l3, l4, ol; <primitive: return sc.Dx7Env(_gate, _data, _r1, _r2, _r3, _r4, _l1, _l2, _l3, _l4, _ol);> }
	EnvDetect { arg in, attack, release; <primitive: return sc.EnvDetect(_in, _attack, _release);> }
	EnvFollow { arg input, decaycoeff; <primitive: return sc.EnvFollow(_input, _decaycoeff);> }
	ExpRandN { arg numChan, lo, hi; <primitive: return sc.ExpRandN(_numChan, _lo, _hi);> }
	FFTComplexDev { arg buffer, rectify, powthresh; <primitive: return sc.FFTComplexDev(_buffer, _rectify, _powthresh);> }
	FFTCrest { arg buffer, freqlo, freqhi; <primitive: return sc.FFTCrest(_buffer, _freqlo, _freqhi);> }
	FFTDiffMags { arg bufferA, bufferB; <primitive: return sc.FFTDiffMags(_bufferA, _bufferB);> }
	FFTFlux { arg buffer, normalise; <primitive: return sc.FFTFlux(_buffer, _normalise);> }
	FFTFluxPos { arg buffer, normalise; <primitive: return sc.FFTFluxPos(_buffer, _normalise);> }
	FFTMKL { arg buffer, epsilon; <primitive: return sc.FFTMKL(_buffer, _epsilon);> }
	FFTPeak { arg buffer, freqlo, freqhi; <primitive: return sc.FFTPeak(_buffer, _freqlo, _freqhi);> }
	FFTPhaseDev { arg buffer, weight, powthresh; <primitive: return sc.FFTPhaseDev(_buffer, _weight, _powthresh);> }
	FFTPower { arg buffer, square; <primitive: return sc.FFTPower(_buffer, _square);> }
	FFTSlope { arg buffer; <primitive: return sc.FFTSlope(_buffer);> }
	FFTSpread { arg buffer, centroid; <primitive: return sc.FFTSpread(_buffer, _centroid);> }
	FFTSubbandFlatness { arg chain, cutfreqs; <primitive: return sc.FFTSubbandFlatness(_chain, _cutfreqs);> }
	FFTSubbandFlux { arg chain, cutfreqs, posonly; <primitive: return sc.FFTSubbandFlux(_chain, _cutfreqs, _posonly);> }
	FFTSubbandPower { arg chain, cutfreqs, square, scalemode; <primitive: return sc.FFTSubbandPower(_chain, _cutfreqs, _square, _scalemode);> }
	FM7 { arg ctlMatrix, modMatrix; <primitive: return sc.FM7(_ctlMatrix, _modMatrix);> }
	FMGrain { arg trigger, dur, carfreq, modfreq, index; <primitive: return sc.FMGrain(_trigger, _dur, _carfreq, _modfreq, _index);> }
	FMGrainB { arg trigger, dur, carfreq, modfreq, index, envbuf; <primitive: return sc.FMGrainB(_trigger, _dur, _carfreq, _modfreq, _index, _envbuf);> }
	FMGrainBBF { arg trigger, dur, carfreq, modfreq, index, envbuf, azimuth, elevation, rho, wComp; <primitive: return sc.FMGrainBBF(_trigger, _dur, _carfreq, _modfreq, _index, _envbuf, _azimuth, _elevation, _rho, _wComp);> }
	FMGrainBF { arg trigger, dur, carfreq, modfreq, index, azimuth, elevation, rho, wComp; <primitive: return sc.FMGrainBF(_trigger, _dur, _carfreq, _modfreq, _index, _azimuth, _elevation, _rho, _wComp);> }
	FMGrainI { arg trigger, dur, carfreq, modfreq, index, envbuf1, envbuf2, ifac; <primitive: return sc.FMGrainI(_trigger, _dur, _carfreq, _modfreq, _index, _envbuf1, _envbuf2, _ifac);> }
	FMGrainIBF { arg trigger, dur, carfreq, modfreq, index, envbuf1, envbuf2, ifac, azimuth, elevation, rho, wComp; <primitive: return sc.FMGrainIBF(_trigger, _dur, _carfreq, _modfreq, _index, _envbuf1, _envbuf2, _ifac, _azimuth, _elevation, _rho, _wComp);> }
	FMHDecode1 { arg w, x, y, z, r, s, t, u, v, azimuth, elevation; <primitive: return sc.FMHDecode1(_w, _x, _y, _z, _r, _s, _t, _u, _v, _azimuth, _elevation);> }
	FMHEncode0 { arg in, azimuth, elevation, gain; <primitive: return sc.FMHEncode0(_in, _azimuth, _elevation, _gain);> }
	FMHEncode1 { arg in, azimuth, elevation, rho, gain, wComp; <primitive: return sc.FMHEncode1(_in, _azimuth, _elevation, _rho, _gain, _wComp);> }
	FMHEncode2 { arg in, point_x, point_y, elevation, gain, wComp; <primitive: return sc.FMHEncode2(_in, _point_x, _point_y, _elevation, _gain, _wComp);> }
	FeatureSave { arg features, trig; <primitive: return sc.FeatureSave(_features, _trig);> }
	Fhn2DC { arg minfreq, maxfreq, urate, wrate, b0, b1, i, u0, w0; <primitive: return sc.Fhn2DC(_minfreq, _maxfreq, _urate, _wrate, _b0, _b1, _i, _u0, _w0);> }
	Fhn2DL { arg minfreq, maxfreq, urate, wrate, b0, b1, i, u0, w0; <primitive: return sc.Fhn2DL(_minfreq, _maxfreq, _urate, _wrate, _b0, _b1, _i, _u0, _w0);> }
	Fhn2DN { arg minfreq, maxfreq, urate, wrate, b0, b1, i, u0, w0; <primitive: return sc.Fhn2DN(_minfreq, _maxfreq, _urate, _wrate, _b0, _b1, _i, _u0, _w0);> }
	FhnTrig { arg minfreq, maxfreq, urate, wrate, b0, b1, i, u0, w0; <primitive: return sc.FhnTrig(_minfreq, _maxfreq, _urate, _wrate, _b0, _b1, _i, _u0, _w0);> }
	FincoSprottL { arg freq, a, h, xi, yi, zi; <primitive: return sc.FincoSprottL(_freq, _a, _h, _xi, _yi, _zi);> }
	FincoSprottM { arg freq, a, b, h, xi, yi, zi; <primitive: return sc.FincoSprottM(_freq, _a, _b, _h, _xi, _yi, _zi);> }
	FincoSprottS { arg freq, a, b, h, xi, yi, zi; <primitive: return sc.FincoSprottS(_freq, _a, _b, _h, _xi, _yi, _zi);> }
	FitzHughNagumo { arg reset, rateu, ratew, b0, b1, initu, initw; <primitive: return sc.FitzHughNagumo(_reset, _rateu, _ratew, _b0, _b1, _initu, _initw);> }
	FrameCompare { arg buffer1, buffer2, wAmount; <primitive: return sc.FrameCompare(_buffer1, _buffer2, _wAmount);> }
	Freezer { arg bufnum, left, right, gain, increment, incrementOffset, incrementRandom, rightRandom, syncPhaseTrigger, randomizePhaseTrigger, numberOfLoops; <primitive: return sc.Freezer(_bufnum, _left, _right, _gain, _increment, _incrementOffset, _incrementRandom, _rightRandom, _syncPhaseTrigger, _randomizePhaseTrigger, _numberOfLoops);> }
	Friction { arg in, friction, spring, damp, mass, beltmass; <primitive: return sc.Friction(_in, _friction, _spring, _damp, _mass, _beltmass);> }
	Gammatone { arg input, centrefrequency, bandwidth; <primitive: return sc.Gammatone(_input, _centrefrequency, _bandwidth);> }
	GaussClass { arg in, bufnum, gate; <primitive: return sc.GaussClass(_in, _bufnum, _gate);> }
	GaussTrig { arg freq, dev; <primitive: return sc.GaussTrig(_freq, _dev);> }
	Gbman2DC { arg minfreq, maxfreq, x0, y0; <primitive: return sc.Gbman2DC(_minfreq, _maxfreq, _x0, _y0);> }
	Gbman2DL { arg minfreq, maxfreq, x0, y0; <primitive: return sc.Gbman2DL(_minfreq, _maxfreq, _x0, _y0);> }
	Gbman2DN { arg minfreq, maxfreq, x0, y0; <primitive: return sc.Gbman2DN(_minfreq, _maxfreq, _x0, _y0);> }
	GbmanTrig { arg minfreq, maxfreq, x0, y0; <primitive: return sc.GbmanTrig(_minfreq, _maxfreq, _x0, _y0);> }
	Gendy4 { arg ampdist, durdist, adparam, ddparam, minfreq, maxfreq, ampscale, durscale, initCPs, knum; <primitive: return sc.Gendy4(_ampdist, _durdist, _adparam, _ddparam, _minfreq, _maxfreq, _ampscale, _durscale, _initCPs, _knum);> }
	Gendy5 { arg ampdist, durdist, adparam, ddparam, minfreq, maxfreq, ampscale, durscale, initCPs, knum; <primitive: return sc.Gendy5(_ampdist, _durdist, _adparam, _ddparam, _minfreq, _maxfreq, _ampscale, _durscale, _initCPs, _knum);> }
	Getenv { arg key, defaultval; <primitive: return sc.Getenv(_key, _defaultval);> }
	GlitchBPF { arg in, freq, rq; <primitive: return sc.GlitchBPF(_in, _freq, _rq);> }
	GlitchBRF { arg in, freq, rq; <primitive: return sc.GlitchBRF(_in, _freq, _rq);> }
	GlitchHPF { arg in, freq; <primitive: return sc.GlitchHPF(_in, _freq);> }
	GlitchRHPF { arg in, freq, rq; <primitive: return sc.GlitchRHPF(_in, _freq, _rq);> }
	Goertzel { arg in, bufsize, freq, hop; <primitive: return sc.Goertzel(_in, _bufsize, _freq, _hop);> }
	GrainBufJ { arg numChannels, trigger, dur, sndbuf, rate, pos, loop, interp, grainAmp, pan, envbufnum, maxGrains; <primitive: return sc.GrainBufJ(_numChannels, _trigger, _dur, _sndbuf, _rate, _pos, _loop, _interp, _grainAmp, _pan, _envbufnum, _maxGrains);> }
	GrainFMJ { arg numChannels, trigger, dur, carfreq, modfreq, index, grainAmp, pan, envbufnum, maxGrains; <primitive: return sc.GrainFMJ(_numChannels, _trigger, _dur, _carfreq, _modfreq, _index, _grainAmp, _pan, _envbufnum, _maxGrains);> }
	GrainInJ { arg numChannels, trigger, dur, in, grainAmp, pan, envbufnum, maxGrains; <primitive: return sc.GrainInJ(_numChannels, _trigger, _dur, _in, _grainAmp, _pan, _envbufnum, _maxGrains);> }
	GrainSinJ { arg numChannels, trigger, dur, freq, grainAmp, pan, envbufnum, maxGrains; <primitive: return sc.GrainSinJ(_numChannels, _trigger, _dur, _freq, _grainAmp, _pan, _envbufnum, _maxGrains);> }
	GravityGrid { arg reset, rate, newx, newy, bufnum; <primitive: return sc.GravityGrid(_reset, _rate, _newx, _newy, _bufnum);> }
	GravityGrid2 { arg reset, rate, newx, newy, bufnum; <primitive: return sc.GravityGrid2(_reset, _rate, _newx, _newy, _bufnum);> }
	GreyholeRaw { arg in1, in2, damping, delaytime, diffusion, feedback, moddepth, modfreq, size; <primitive: return sc.GreyholeRaw(_in1, _in2, _damping, _delaytime, _diffusion, _feedback, _moddepth, _modfreq, _size);> }
	HairCell { arg input, spontaneousrate, boostrate, restorerate, loss; <primitive: return sc.HairCell(_input, _spontaneousrate, _boostrate, _restorerate, _loss);> }
	HarmonicOsc { arg freq, firstharmonic, amplitudes; <primitive: return sc.HarmonicOsc(_freq, _firstharmonic, _amplitudes);> }
	Henon2DC { arg minfreq, maxfreq, a, b, x0, y0; <primitive: return sc.Henon2DC(_minfreq, _maxfreq, _a, _b, _x0, _y0);> }
	Henon2DL { arg minfreq, maxfreq, a, b, x0, y0; <primitive: return sc.Henon2DL(_minfreq, _maxfreq, _a, _b, _x0, _y0);> }
	Henon2DN { arg minfreq, maxfreq, a, b, x0, y0; <primitive: return sc.Henon2DN(_minfreq, _maxfreq, _a, _b, _x0, _y0);> }
	HenonTrig { arg minfreq, maxfreq, a, b, x0, y0; <primitive: return sc.HenonTrig(_minfreq, _maxfreq, _a, _b, _x0, _y0);> }
	ICepstrum { arg cepchain, fftbuf; <primitive: return sc.ICepstrum(_cepchain, _fftbuf);> }
	IIRFilter { arg in, freq, rq; <primitive: return sc.IIRFilter(_in, _freq, _rq);> }
	IRandN { arg numChan, lo, hi; <primitive: return sc.IRandN(_numChan, _lo, _hi);> }
	InGrain { arg trigger, dur, in; <primitive: return sc.InGrain(_trigger, _dur, _in);> }
	InGrainB { arg trigger, dur, in, envbuf; <primitive: return sc.InGrainB(_trigger, _dur, _in, _envbuf);> }
	InGrainBBF { arg trigger, dur, in, envbuf, azimuth, elevation, rho, wComp; <primitive: return sc.InGrainBBF(_trigger, _dur, _in, _envbuf, _azimuth, _elevation, _rho, _wComp);> }
	InGrainBF { arg trigger, dur, in, azimuth, elevation, rho, wComp; <primitive: return sc.InGrainBF(_trigger, _dur, _in, _azimuth, _elevation, _rho, _wComp);> }
	InGrainI { arg trigger, dur, in, envbuf1, envbuf2, ifac; <primitive: return sc.InGrainI(_trigger, _dur, _in, _envbuf1, _envbuf2, _ifac);> }
	InGrainIBF { arg trigger, dur, in, envbuf1, envbuf2, ifac, azimuth, elevation, rho, wComp; <primitive: return sc.InGrainIBF(_trigger, _dur, _in, _envbuf1, _envbuf2, _ifac, _azimuth, _elevation, _rho, _wComp);> }
	InsideOut { arg in; <primitive: return sc.InsideOut(_in);> }
	Instruction { arg bufnum; <primitive: return sc.Instruction(_bufnum);> }
	JPverbRaw { arg in1, in2, damp, earlydiff, highband, highx, lowband, lowx, mdepth, mfreq, midx, size, t60; <primitive: return sc.JPverbRaw(_in1, _in2, _damp, _earlydiff, _highband, _highx, _lowband, _lowx, _mdepth, _mfreq, _midx, _size, _t60);> }
	KMeansRT { arg bufnum, inputdata, k, gate, reset, learn; <primitive: return sc.KMeansRT(_bufnum, _inputdata, _k, _gate, _reset, _learn);> }
	KeyClarity { arg chain, keydecay, chromaleak; <primitive: return sc.KeyClarity(_chain, _keydecay, _chromaleak);> }
	KeyMode { arg chain, keydecay, chromaleak; <primitive: return sc.KeyMode(_chain, _keydecay, _chromaleak);> }
	KmeansToBPSet1 { arg freq, numdatapoints, maxnummeans, nummeans, tnewdata, tnewmeans, soft, bufnum; <primitive: return sc.KmeansToBPSet1(_freq, _numdatapoints, _maxnummeans, _nummeans, _tnewdata, _tnewmeans, _soft, _bufnum);> }
	LADSPA { arg nChans, id, args; <primitive: return sc.LADSPA(_nChans, _id, _args);> }
	LFBrownNoise0 { arg freq, dev, dist; <primitive: return sc.LFBrownNoise0(_freq, _dev, _dist);> }
	LFBrownNoise1 { arg freq, dev, dist; <primitive: return sc.LFBrownNoise1(_freq, _dev, _dist);> }
	LFBrownNoise2 { arg freq, dev, dist; <primitive: return sc.LFBrownNoise2(_freq, _dev, _dist);> }
	LPCAnalyzer { arg input, source, n, p, testE, delta, windowtype; <primitive: return sc.LPCAnalyzer(_input, _source, _n, _p, _testE, _delta, _windowtype);> }
	LPCError { arg input, p; <primitive: return sc.LPCError(_input, _p);> }
	LPCSynth { arg buffer, signal, pointer; <primitive: return sc.LPCSynth(_buffer, _signal, _pointer);> }
	LPCVals { arg buffer, pointer; <primitive: return sc.LPCVals(_buffer, _pointer);> }
	LPF1 { arg in, freq; <primitive: return sc.LPF1(_in, _freq);> }
	LPF18 { arg in, freq, res, dist; <primitive: return sc.LPF18(_in, _freq, _res, _dist);> }
	LPFVS6 { arg in, freq, slope; <primitive: return sc.LPFVS6(_in, _freq, _slope);> }
	LPG { arg input, controlinput, controloffset, controlscale, vca, resonance, lowpassmode, linearity; <primitive: return sc.LPG(_input, _controlinput, _controloffset, _controlscale, _vca, _resonance, _lowpassmode, _linearity);> }
	LTI { arg input, bufnuma, bufnumb; <primitive: return sc.LTI(_input, _bufnuma, _bufnumb);> }
	LagC { arg in, timeUp, curveUp, timeDown, curveDown; <primitive: return sc.LagC(_in, _timeUp, _curveUp, _timeDown, _curveDown);> }
	Latoocarfian2DC { arg minfreq, maxfreq, a, b, c, d, x0, y0; <primitive: return sc.Latoocarfian2DC(_minfreq, _maxfreq, _a, _b, _c, _d, _x0, _y0);> }
	Latoocarfian2DL { arg minfreq, maxfreq, a, b, c, d, x0, y0; <primitive: return sc.Latoocarfian2DL(_minfreq, _maxfreq, _a, _b, _c, _d, _x0, _y0);> }
	Latoocarfian2DN { arg minfreq, maxfreq, a, b, c, d, x0, y0; <primitive: return sc.Latoocarfian2DN(_minfreq, _maxfreq, _a, _b, _c, _d, _x0, _y0);> }
	LatoocarfianTrig { arg minfreq, maxfreq, a, b, c, d, x0, y0; <primitive: return sc.LatoocarfianTrig(_minfreq, _maxfreq, _a, _b, _c, _d, _x0, _y0);> }
	LinRandN { arg numChan, lo, hi, minmax; <primitive: return sc.LinRandN(_numChan, _lo, _hi, _minmax);> }
	ListTrig { arg bufnum, reset, offset, numframes; <primitive: return sc.ListTrig(_bufnum, _reset, _offset, _numframes);> }
	ListTrig2 { arg bufnum, reset, numframes; <primitive: return sc.ListTrig2(_bufnum, _reset, _numframes);> }
	Logger { arg inputArray, trig, bufnum, reset; <primitive: return sc.Logger(_inputArray, _trig, _bufnum, _reset);> }
	LoopBuf { arg numChan, bufnum, rate, gate, startPos, startLoop, endLoop, interpolation; <primitive: return sc.LoopBuf(_numChan, _bufnum, _rate, _gate, _startPos, _startLoop, _endLoop, _interpolation);> }
	LoopSet { arg bufnum, left, right, gain, increment, spec; <primitive: return sc.LoopSet(_bufnum, _left, _right, _gain, _increment, _spec);> }
	Lorenz2DC { arg minfreq, maxfreq, s, r, b, h, x0, y0, z0; <primitive: return sc.Lorenz2DC(_minfreq, _maxfreq, _s, _r, _b, _h, _x0, _y0, _z0);> }
	Lorenz2DL { arg minfreq, maxfreq, s, r, b, h, x0, y0, z0; <primitive: return sc.Lorenz2DL(_minfreq, _maxfreq, _s, _r, _b, _h, _x0, _y0, _z0);> }
	Lorenz2DN { arg minfreq, maxfreq, s, r, b, h, x0, y0, z0; <primitive: return sc.Lorenz2DN(_minfreq, _maxfreq, _s, _r, _b, _h, _x0, _y0, _z0);> }
	LorenzTrig { arg minfreq, maxfreq, s, r, b, h, x0, y0, z0; <primitive: return sc.LorenzTrig(_minfreq, _maxfreq, _s, _r, _b, _h, _x0, _y0, _z0);> }
	Lores { arg in, freq, res; <primitive: return sc.Lores(_in, _freq, _res);> }
	LotkaVolterra { arg freq, a, b, c, d, h, xi, yi; <primitive: return sc.LotkaVolterra(_freq, _a, _b, _c, _d, _h, _xi, _yi);> }
	MCLDChaosGen { arg maxSize; <primitive: return sc.MCLDChaosGen(_maxSize);> }
	MZPokey { arg audf1, audc1, audf2, audc2, audf3, audc3, audf4, audc4, audctl; <primitive: return sc.MZPokey(_audf1, _audc1, _audf2, _audc2, _audf3, _audc3, _audf4, _audc4, _audctl);> }
	MarkovSynth { arg in, isRecording, waitTime, tableSize; <primitive: return sc.MarkovSynth(_in, _isRecording, _waitTime, _tableSize);> }
	MatchingP { arg dict, in, dictsize, ntofind, hop, method; <primitive: return sc.MatchingP(_dict, _in, _dictsize, _ntofind, _hop, _method);> }
	MatchingPResynth { arg dict, method, trigger, residual, activs; <primitive: return sc.MatchingPResynth(_dict, _method, _trigger, _residual, _activs);> }
	Max { arg in, numsamp; <primitive: return sc.Max(_in, _numsamp);> }
	Maxamp { arg in, numSamps; <primitive: return sc.Maxamp(_in, _numSamps);> }
	MdaPiano { arg freq, gate, vel, decay, release, hard, velhard, muffle, velmuff, velcurve, stereo, tune, random, stretch, sustain; <primitive: return sc.MdaPiano(_freq, _gate, _vel, _decay, _release, _hard, _velhard, _muffle, _velmuff, _velcurve, _stereo, _tune, _random, _stretch, _sustain);> }
	MeanTriggered { arg in, trig, length; <primitive: return sc.MeanTriggered(_in, _trig, _length);> }
	Meddis { arg input; <primitive: return sc.Meddis(_input);> }
	MedianSeparation { arg fft, fftharmonic, fftpercussive, fftsize, mediansize, hardorsoft, p, medianormax; <primitive: return sc.MedianSeparation(_fft, _fftharmonic, _fftpercussive, _fftsize, _mediansize, _hardorsoft, _p, _medianormax);> }
	MedianTriggered { arg in, trig, length; <primitive: return sc.MedianTriggered(_in, _trig, _length);> }
	MembraneCircle { arg excitation, tension, loss; <primitive: return sc.MembraneCircle(_excitation, _tension, _loss);> }
	MembraneHexagon { arg excitation, tension, loss; <primitive: return sc.MembraneHexagon(_excitation, _tension, _loss);> }
	Metro { arg bpm, numBeats; <primitive: return sc.Metro(_bpm, _numBeats);> }
	MiBraids { arg pitch, timbre, color, model, trig, resamp, decim, bits, ws; <primitive: return sc.MiBraids(_pitch, _timbre, _color, _model, _trig, _resamp, _decim, _bits, _ws);> }
	MiClouds { arg pit, pos, size, dens, tex, drywet, in_gain, spread, rvb, fb, freeze, mode, lofi, trig, inputArray; <primitive: return sc.MiClouds(_pit, _pos, _size, _dens, _tex, _drywet, _in_gain, _spread, _rvb, _fb, _freeze, _mode, _lofi, _trig, _inputArray);> }
	MiElements { arg blow_in, strike_in, gate, pit, strength, contour, bow_level, blow_level, strike_level, flow, mallet, bow_timb, blow_timb, strike_timb, geom, bright, damp, pos, space, model, easteregg; <primitive: return sc.MiElements(_blow_in, _strike_in, _gate, _pit, _strength, _contour, _bow_level, _blow_level, _strike_level, _flow, _mallet, _bow_timb, _blow_timb, _strike_timb, _geom, _bright, _damp, _pos, _space, _model, _easteregg);> }
	MiGrids { arg bpm, map_x, map_y, chaos, bd_density, sd_density, hh_density, mode, swing, config; <primitive: return sc.MiGrids(_bpm, _map_x, _map_y, _chaos, _bd_density, _sd_density, _hh_density, _mode, _swing, _config);> }
	MiMu { arg in, gain, bypass; <primitive: return sc.MiMu(_in, _gain, _bypass);> }
	MiOmi { arg audio_in, gate, pit, contour, detune, level1, level2, ratio1, ratio2, fm1, fm2, fb, xfb, filter_mode, cutoff, reson, strength, env, rotate, space; <primitive: return sc.MiOmi(_audio_in, _gate, _pit, _contour, _detune, _level1, _level2, _ratio1, _ratio2, _fm1, _fm2, _fb, _xfb, _filter_mode, _cutoff, _reson, _strength, _env, _rotate, _space);> }
	MiPlaits { arg pitch, engine, harm, timbre, morph, trigger, level, fm_mod, timb_mod, morph_mod, decay, lpg_colour; <primitive: return sc.MiPlaits(_pitch, _engine, _harm, _timbre, _morph, _trigger, _level, _fm_mod, _timb_mod, _morph_mod, _decay, _lpg_colour);> }
	MiRings { arg in, trig, pit, struct, bright, damp, pos, model, poly, intern_exciter, easteregg, bypass; <primitive: return sc.MiRings(_in, _trig, _pit, _struct, _bright, _damp, _pos, _model, _poly, _intern_exciter, _easteregg, _bypass);> }
	MiRipples { arg in, cf, reson, drive; <primitive: return sc.MiRipples(_in, _cf, _reson, _drive);> }
	MiTides { arg freq, shape, slope, smooth, shift, trig, clock, output_mode, ramp_mode, ratio, rate; <primitive: return sc.MiTides(_freq, _shape, _slope, _smooth, _shift, _trig, _clock, _output_mode, _ramp_mode, _ratio, _rate);> }
	MiVerb { arg time, drywet, damp, hp, freeze, diff, inputArray; <primitive: return sc.MiVerb(_time, _drywet, _damp, _hp, _freeze, _diff, _inputArray);> }
	MiWarps { arg carrier, modulator, lev1, lev2, algo, timb, osc, freq, vgain, easteregg; <primitive: return sc.MiWarps(_carrier, _modulator, _lev1, _lev2, _algo, _timb, _osc, _freq, _vgain, _easteregg);> }
	MonoGrain { arg in, winsize, grainrate, winrandpct; <primitive: return sc.MonoGrain(_in, _winsize, _grainrate, _winrandpct);> }
	MonoGrainBF { arg in, winsize, grainrate, winrandpct, azimuth, azrand, elevation, elrand, rho; <primitive: return sc.MonoGrainBF(_in, _winsize, _grainrate, _winrandpct, _azimuth, _azrand, _elevation, _elrand, _rho);> }
	MoogLadder { arg in, ffreq, res; <primitive: return sc.MoogLadder(_in, _ffreq, _res);> }
	MoogVCF { arg in, fco, res; <primitive: return sc.MoogVCF(_in, _fco, _res);> }
	NL { arg input, bufnuma, bufnumb, guard1, guard2; <primitive: return sc.NL(_input, _bufnuma, _bufnumb, _guard1, _guard2);> }
	NL2 { arg input, bufnum, maxsizea, maxsizeb, guard1, guard2; <primitive: return sc.NL2(_input, _bufnum, _maxsizea, _maxsizeb, _guard1, _guard2);> }
	NLFiltC { arg input, a, b, d, c, l; <primitive: return sc.NLFiltC(_input, _a, _b, _d, _c, _l);> }
	NLFiltL { arg input, a, b, d, c, l; <primitive: return sc.NLFiltL(_input, _a, _b, _d, _c, _l);> }
	NLFiltN { arg input, a, b, d, c, l; <primitive: return sc.NLFiltN(_input, _a, _b, _d, _c, _l);> }
	NTube { arg input, lossarray, karray, delaylengtharray; <primitive: return sc.NTube(_input, _lossarray, _karray, _delaylengtharray);> }
	NearestN { arg treebuf, in, gate, num; <primitive: return sc.NearestN(_treebuf, _in, _gate, _num);> }
	NeedleRect { arg rate, imgWidth, imgHeight, rectX, rectY, rectW, rectH; <primitive: return sc.NeedleRect(_rate, _imgWidth, _imgHeight, _rectX, _rectY, _rectW, _rectH);> }
	NeoFormant { arg formantfreq, carrierfreq, phaseshift; <primitive: return sc.NeoFormant(_formantfreq, _carrierfreq, _phaseshift);> }
	NeoVarSawOsc { arg freq, pw, waveshape; <primitive: return sc.NeoVarSawOsc(_freq, _pw, _waveshape);> }
	Nes2 { arg trig, a0, a1, a2, a3, b0, b1, b2, b3, c0, c2, c3, d0, d2, d3, e0, e1, e2, e3, smask; <primitive: return sc.Nes2(_trig, _a0, _a1, _a2, _a3, _b0, _b1, _b2, _b3, _c0, _c2, _c3, _d0, _d2, _d3, _e0, _e1, _e2, _e3, _smask);> }
	NestedAllpassC { arg in, maxdelay1, delay1, gain1, maxdelay2, delay2, gain2; <primitive: return sc.NestedAllpassC(_in, _maxdelay1, _delay1, _gain1, _maxdelay2, _delay2, _gain2);> }
	NestedAllpassL { arg in, maxdelay1, delay1, gain1, maxdelay2, delay2, gain2; <primitive: return sc.NestedAllpassL(_in, _maxdelay1, _delay1, _gain1, _maxdelay2, _delay2, _gain2);> }
	NestedAllpassN { arg in, maxdelay1, delay1, gain1, maxdelay2, delay2, gain2; <primitive: return sc.NestedAllpassN(_in, _maxdelay1, _delay1, _gain1, _maxdelay2, _delay2, _gain2);> }
	OSFold4 { arg in, lo, hi; <primitive: return sc.OSFold4(_in, _lo, _hi);> }
	OSFold8 { arg in, lo, hi; <primitive: return sc.OSFold8(_in, _lo, _hi);> }
	OSTrunc4 { arg in, quant; <primitive: return sc.OSTrunc4(_in, _quant);> }
	OSTrunc8 { arg in, quant; <primitive: return sc.OSTrunc8(_in, _quant);> }
	OSWrap4 { arg in, lo, hi; <primitive: return sc.OSWrap4(_in, _lo, _hi);> }
	OSWrap8 { arg in, lo, hi; <primitive: return sc.OSWrap8(_in, _lo, _hi);> }
	ObxdFilter { arg in, cutoff, resonance, multimode, bandpass, fourpole; <primitive: return sc.ObxdFilter(_in, _cutoff, _resonance, _multimode, _bandpass, _fourpole);> }
	OnsetStatistics { arg input, windowsize, hopsize; <primitive: return sc.OnsetStatistics(_input, _windowsize, _hopsize);> }
	Oregonator { arg reset, rate, epsilon, mu, q, initx, inity, initz; <primitive: return sc.Oregonator(_reset, _rate, _epsilon, _mu, _q, _initx, _inity, _initz);> }
	OscBank { arg freq, gain, saw8, square8, saw4, square4, saw2, square2, saw1; <primitive: return sc.OscBank(_freq, _gain, _saw8, _square8, _saw4, _square4, _saw2, _square2, _saw1);> }
	OteyPiano { arg freq, vel, t_gate, rmin, rmax, rampl, rampr, rcore, lmin, lmax, lampl, lampr, rho, e, zb, zh, mh, k, alpha, p, hpos, loss, detune, hammer_type; <primitive: return sc.OteyPiano(_freq, _vel, _t_gate, _rmin, _rmax, _rampl, _rampr, _rcore, _lmin, _lmax, _lampl, _lampr, _rho, _e, _zb, _zh, _mh, _k, _alpha, _p, _hpos, _loss, _detune, _hammer_type);> }
	OteyPianoStrings { arg freq, vel, t_gate, rmin, rmax, rampl, rampr, rcore, lmin, lmax, lampl, lampr, rho, e, zb, zh, mh, k, alpha, p, hpos, loss, detune, hammer_type; <primitive: return sc.OteyPianoStrings(_freq, _vel, _t_gate, _rmin, _rmax, _rampl, _rampr, _rcore, _lmin, _lmax, _lampl, _lampr, _rho, _e, _zb, _zh, _mh, _k, _alpha, _p, _hpos, _loss, _detune, _hammer_type);> }
	OteySoundBoard { arg inp, c1, c3, mix; <primitive: return sc.OteySoundBoard(_inp, _c1, _c3, _mix);> }
	PVInfo { arg pvbuffer, binNum, filePointer; <primitive: return sc.PVInfo(_pvbuffer, _binNum, _filePointer);> }
	PVSynth { arg pvbuffer, numBins, binStart, binSkip, filePointer, freqMul, freqAdd; <primitive: return sc.PVSynth(_pvbuffer, _numBins, _binStart, _binSkip, _filePointer, _freqMul, _freqAdd);> }
	PV_BinBufRd { arg buffer, playbuf, point, binStart, binSkip, numBins, clear; <primitive: return sc.PV_BinBufRd(_buffer, _playbuf, _point, _binStart, _binSkip, _numBins, _clear);> }
	PV_BinDelay { arg buffer, maxdelay, delaybuf, fbbuf, hop; <primitive: return sc.PV_BinDelay(_buffer, _maxdelay, _delaybuf, _fbbuf, _hop);> }
	PV_BinFilter { arg buffer, start, end; <primitive: return sc.PV_BinFilter(_buffer, _start, _end);> }
	PV_BinPlayBuf { arg buffer, playbuf, rate, offset, binStart, binSkip, numBins, loop, clear; <primitive: return sc.PV_BinPlayBuf(_buffer, _playbuf, _rate, _offset, _binStart, _binSkip, _numBins, _loop, _clear);> }
	PV_BufRd { arg buffer, playbuf, point; <primitive: return sc.PV_BufRd(_buffer, _playbuf, _point);> }
	PV_CommonMag { arg bufferA, bufferB, tolerance, remove; <primitive: return sc.PV_CommonMag(_bufferA, _bufferB, _tolerance, _remove);> }
	PV_CommonMul { arg bufferA, bufferB, tolerance, remove; <primitive: return sc.PV_CommonMul(_bufferA, _bufferB, _tolerance, _remove);> }
	PV_Compander { arg buffer, thresh, slopeBelow, slopeAbove; <primitive: return sc.PV_Compander(_buffer, _thresh, _slopeBelow, _slopeAbove);> }
	PV_Cutoff { arg bufferA, bufferB, wipe; <primitive: return sc.PV_Cutoff(_bufferA, _bufferB, _wipe);> }
	PV_DecayTable { arg fft_buf, decay_rate_buf, history_buf; <primitive: return sc.PV_DecayTable(_fft_buf, _decay_rate_buf, _history_buf);> }
	PV_EvenBin { arg buffer; <primitive: return sc.PV_EvenBin(_buffer);> }
	PV_ExtractRepeat { arg buffer, loopbuf, loopdur, memorytime, which, ffthop, thresh; <primitive: return sc.PV_ExtractRepeat(_buffer, _loopbuf, _loopdur, _memorytime, _which, _ffthop, _thresh);> }
	PV_Freeze { arg buffer, freeze; <primitive: return sc.PV_Freeze(_buffer, _freeze);> }
	PV_FreqBuffer { arg buffer, databuffer; <primitive: return sc.PV_FreqBuffer(_buffer, _databuffer);> }
	PV_Invert { arg buffer; <primitive: return sc.PV_Invert(_buffer);> }
	PV_MagBuffer { arg buffer, databuffer; <primitive: return sc.PV_MagBuffer(_buffer, _databuffer);> }
	PV_MagExp { arg buffer; <primitive: return sc.PV_MagExp(_buffer);> }
	PV_MagGate { arg buffer, thresh, remove; <primitive: return sc.PV_MagGate(_buffer, _thresh, _remove);> }
	PV_MagLog { arg buffer; <primitive: return sc.PV_MagLog(_buffer);> }
	PV_MagMap { arg buffer, mapbuf; <primitive: return sc.PV_MagMap(_buffer, _mapbuf);> }
	PV_MagMinus { arg bufferA, bufferB, remove; <primitive: return sc.PV_MagMinus(_bufferA, _bufferB, _remove);> }
	PV_MagMulAdd { arg buffer; <primitive: return sc.PV_MagMulAdd(_buffer);> }
	PV_MagScale { arg bufferA, bufferB; <primitive: return sc.PV_MagScale(_bufferA, _bufferB);> }
	PV_MagSmooth { arg buffer, factor; <primitive: return sc.PV_MagSmooth(_buffer, _factor);> }
	PV_MagSubtract { arg bufferA, bufferB, zerolimit; <primitive: return sc.PV_MagSubtract(_bufferA, _bufferB, _zerolimit);> }
	PV_MaxMagN { arg buffer, numbins; <primitive: return sc.PV_MaxMagN(_buffer, _numbins);> }
	PV_MinMagN { arg buffer, numbins; <primitive: return sc.PV_MinMagN(_buffer, _numbins);> }
	PV_Morph { arg bufferA, bufferB, morph; <primitive: return sc.PV_Morph(_bufferA, _bufferB, _morph);> }
	PV_NoiseSynthF { arg buffer, threshold, numFrames, initflag; <primitive: return sc.PV_NoiseSynthF(_buffer, _threshold, _numFrames, _initflag);> }
	PV_NoiseSynthP { arg buffer, threshold, numFrames, initflag; <primitive: return sc.PV_NoiseSynthP(_buffer, _threshold, _numFrames, _initflag);> }
	PV_OddBin { arg buffer; <primitive: return sc.PV_OddBin(_buffer);> }
	PV_PartialSynthF { arg buffer, threshold, numFrames, initflag; <primitive: return sc.PV_PartialSynthF(_buffer, _threshold, _numFrames, _initflag);> }
	PV_PartialSynthP { arg buffer, threshold, numFrames, initflag; <primitive: return sc.PV_PartialSynthP(_buffer, _threshold, _numFrames, _initflag);> }
	PV_PitchShift { arg buffer, ratio; <primitive: return sc.PV_PitchShift(_buffer, _ratio);> }
	PV_PlayBuf { arg buffer, playbuf, rate, offset, loop; <primitive: return sc.PV_PlayBuf(_buffer, _playbuf, _rate, _offset, _loop);> }
	PV_RecordBuf { arg buffer, recbuf, offset, run, loop, hop, wintype; <primitive: return sc.PV_RecordBuf(_buffer, _recbuf, _offset, _run, _loop, _hop, _wintype);> }
	PV_SoftWipe { arg bufferA, bufferB, wipe; <primitive: return sc.PV_SoftWipe(_bufferA, _bufferB, _wipe);> }
	PV_SpectralEnhance { arg buffer, numPartials, ratio, strength; <primitive: return sc.PV_SpectralEnhance(_buffer, _numPartials, _ratio, _strength);> }
	PV_SpectralMap { arg buffer, specBuffer, floor, freeze, mode, norm, window; <primitive: return sc.PV_SpectralMap(_buffer, _specBuffer, _floor, _freeze, _mode, _norm, _window);> }
	PV_Split { arg bufferA, bufferB; <primitive: return sc.PV_Split(_bufferA, _bufferB);> }
	PV_Whiten { arg chain, trackbufnum, relaxtime, floor, smear, bindownsample; <primitive: return sc.PV_Whiten(_chain, _trackbufnum, _relaxtime, _floor, _smear, _bindownsample);> }
	PV_XFade { arg bufferA, bufferB, fade; <primitive: return sc.PV_XFade(_bufferA, _bufferB, _fade);> }
	PanX { arg numChans, in, pos, level, width; <primitive: return sc.PanX(_numChans, _in, _pos, _level, _width);> }
	PanX2D { arg numChansX, numChansY, in, posX, posY, level, widthX, widthY; <primitive: return sc.PanX2D(_numChansX, _numChansY, _in, _posX, _posY, _level, _widthX, _widthY);> }
	PeakEQ2 { arg in, freq, rs, db; <primitive: return sc.PeakEQ2(_in, _freq, _rs, _db);> }
	PeakEQ4 { arg in, freq, rs, db; <primitive: return sc.PeakEQ4(_in, _freq, _rs, _db);> }
	Perlin3 { arg x, y, z; <primitive: return sc.Perlin3(_x, _y, _z);> }
	PermMod { arg in, freq; <primitive: return sc.PermMod(_in, _freq);> }
	PermModArray { arg in, freq, pattern; <primitive: return sc.PermModArray(_in, _freq, _pattern);> }
	PermModT { arg in, outfreq, infreq; <primitive: return sc.PermModT(_in, _outfreq, _infreq);> }
	PhasorModal { arg input, freq, decay, damp, amp, phase; <primitive: return sc.PhasorModal(_input, _freq, _decay, _damp, _amp, _phase);> }
	PlaneTree { arg treebuf, in, gate; <primitive: return sc.PlaneTree(_treebuf, _in, _gate);> }
	Pokey { arg audf1, audc1, audf2, audc2, audf3, audc3, audf4, audc4, audctl; <primitive: return sc.Pokey(_audf1, _audc1, _audf2, _audc2, _audf3, _audc3, _audf4, _audc4, _audctl);> }
	PosRatio { arg in, period, thresh; <primitive: return sc.PosRatio(_in, _period, _thresh);> }
	PrintVal { arg in, numblocks, id; <primitive: return sc.PrintVal(_in, _numblocks, _id);> }
	Qitch { arg in, databufnum, ampThreshold, algoflag, ampbufnum, minfreq, maxfreq; <primitive: return sc.Qitch(_in, _databufnum, _ampThreshold, _algoflag, _ampbufnum, _minfreq, _maxfreq);> }
	RCD { arg clock, rotate, reset, div, spread, auto, len, down, gates; <primitive: return sc.RCD(_clock, _rotate, _reset, _div, _spread, _auto, _len, _down, _gates);> }
	RLPFD { arg in, ffreq, res, dist; <primitive: return sc.RLPFD(_in, _ffreq, _res, _dist);> }
	RMAFoodChainL { arg freq, a1, b1, d1, a2, b2, d2, k, r, h, xi, yi, zi; <primitive: return sc.RMAFoodChainL(_freq, _a1, _b1, _d1, _a2, _b2, _d2, _k, _r, _h, _xi, _yi, _zi);> }
	RMEQ { arg in, freq, rq, k; <primitive: return sc.RMEQ(_in, _freq, _rq, _k);> }
	RMEQSuite { arg maxSize; <primitive: return sc.RMEQSuite(_maxSize);> }
	RMS { arg in, lpFreq; <primitive: return sc.RMS(_in, _lpFreq);> }
	RMShelf { arg in, freq, k; <primitive: return sc.RMShelf(_in, _freq, _k);> }
	RMShelf2 { arg in, freq, k; <primitive: return sc.RMShelf2(_in, _freq, _k);> }
	RandN { arg numChan, lo, hi; <primitive: return sc.RandN(_numChan, _lo, _hi);> }
	RedDPCMdecode { arg in; <primitive: return sc.RedDPCMdecode(_in);> }
	RedDPCMencode { arg in, round; <primitive: return sc.RedDPCMencode(_in, _round);> }
	RedLbyl { arg in, thresh, samples; <primitive: return sc.RedLbyl(_in, _thresh, _samples);> }
	RedNoise { arg clock; <primitive: return sc.RedNoise(_clock);> }
	RedPhasor { arg trig, rate, start, end, loop, loopstart, loopend; <primitive: return sc.RedPhasor(_trig, _rate, _start, _end, _loop, _loopstart, _loopend);> }
	RedPhasor2 { arg trig, rate, start, end, loop, loopstart, loopend; <primitive: return sc.RedPhasor2(_trig, _rate, _start, _end, _loop, _loopstart, _loopend);> }
	RegaliaMitraEQ { arg in, freq, rq, k; <primitive: return sc.RegaliaMitraEQ(_in, _freq, _rq, _k);> }
	Resonator { arg input, freq, position, resolution, structure, brightness, damping; <primitive: return sc.Resonator(_input, _freq, _position, _resolution, _structure, _brightness, _damping);> }
	Rongs { arg trigger, sustain, f0, structure, brightness, damping, accent, stretch, position, loss, modeNum, cosFreq; <primitive: return sc.Rongs(_trigger, _sustain, _f0, _structure, _brightness, _damping, _accent, _stretch, _position, _loss, _modeNum, _cosFreq);> }
	RosslerL { arg freq, a, b, c, h, xi, yi, zi; <primitive: return sc.RosslerL(_freq, _a, _b, _c, _h, _xi, _yi, _zi);> }
	RosslerResL { arg in, stiff, freq, a, b, c, h, xi, yi, zi; <primitive: return sc.RosslerResL(_in, _stiff, _freq, _a, _b, _c, _h, _xi, _yi, _zi);> }
	Rotate { arg w, x, y, z, rotate; <primitive: return sc.Rotate(_w, _x, _y, _z, _rotate);> }
	SCM { arg clock, bpm, rotate, slip, shuffle, skip, pw; <primitive: return sc.SCM(_clock, _bpm, _rotate, _slip, _shuffle, _skip, _pw);> }
	SID6581f { arg freqLo0, freqHi0, pwLo0, pwHi0, ctrl0, atkDcy0, susRel0, freqLo1, freqHi1, pwLo1, pwHi1, ctrl1, atkDcy1, susRel1, freqLo2, freqHi2, pwLo2, pwHi2, ctrl2, atkDcy2, susRel2, fcLo, fcHi, resFilt, modeVol, rate; <primitive: return sc.SID6581f(_freqLo0, _freqHi0, _pwLo0, _pwHi0, _ctrl0, _atkDcy0, _susRel0, _freqLo1, _freqHi1, _pwLo1, _pwHi1, _ctrl1, _atkDcy1, _susRel1, _freqLo2, _freqHi2, _pwLo2, _pwHi2, _ctrl2, _atkDcy2, _susRel2, _fcLo, _fcHi, _resFilt, _modeVol, _rate);> }
	SLOnset { arg input, memorysize1, before, after, threshold, hysteresis; <primitive: return sc.SLOnset(_input, _memorysize1, _before, _after, _threshold, _hysteresis);> }
	SMS { arg input, maxpeaks, currentpeaks, tolerance, noisefloor, freqmult, freqadd, formantpreserve, useifft, ampmult, graphicsbufnum; <primitive: return sc.SMS(_input, _maxpeaks, _currentpeaks, _tolerance, _noisefloor, _freqmult, _freqadd, _formantpreserve, _useifft, _ampmult, _graphicsbufnum);> }
	SN76489 { arg tone0, tone1, tone2, noise, vol0, vol1, vol2, vol3, rate; <primitive: return sc.SN76489(_tone0, _tone1, _tone2, _noise, _vol0, _vol1, _vol2, _vol3, _rate);> }
	SOMAreaWr { arg bufnum, inputdata, coords, netsize, numdims, nhood, gate; <primitive: return sc.SOMAreaWr(_bufnum, _inputdata, _coords, _netsize, _numdims, _nhood, _gate);> }
	SOMRd { arg bufnum, inputdata, netsize, numdims, gate; <primitive: return sc.SOMRd(_bufnum, _inputdata, _netsize, _numdims, _gate);> }
	SOMTrain { arg bufnum, inputdata, netsize, numdims, traindur, nhood, gate, initweight; <primitive: return sc.SOMTrain(_bufnum, _inputdata, _netsize, _numdims, _traindur, _nhood, _gate, _initweight);> }
	SVF { arg signal, cutoff, res, lowpass, bandpass, highpass, notch, peak; <primitive: return sc.SVF(_signal, _cutoff, _res, _lowpass, _bandpass, _highpass, _notch, _peak);> }
	SamplerIndex { arg buf, size, mnn; <primitive: return sc.SamplerIndex(_buf, _size, _mnn);> }
	SawDPW { arg freq, iphase; <primitive: return sc.SawDPW(_freq, _iphase);> }
	SensoryDissonance { arg fft, maxpeaks, peakthreshold, norm, clamp; <primitive: return sc.SensoryDissonance(_fft, _maxpeaks, _peakthreshold, _norm, _clamp);> }
	ShufflerB { arg bufnum, readLocationMinima, readLocationMaxima, readIncrementMinima, readIncrementMaxima, durationMinima, durationMaxima, envelopeAmplitudeMinima, envelopeAmplitudeMaxima, envelopeShapeMinima, envelopeShapeMaxima, envelopeSkewMinima, envelopeSkewMaxima, stereoLocationMinima, stereoLocationMaxima, interOffsetTimeMinima, interOffsetTimeMaxima, ftableReadLocationIncrement, readIncrementQuanta, interOffsetTimeQuanta; <primitive: return sc.ShufflerB(_bufnum, _readLocationMinima, _readLocationMaxima, _readIncrementMinima, _readIncrementMaxima, _durationMinima, _durationMaxima, _envelopeAmplitudeMinima, _envelopeAmplitudeMaxima, _envelopeShapeMinima, _envelopeShapeMaxima, _envelopeSkewMinima, _envelopeSkewMaxima, _stereoLocationMinima, _stereoLocationMaxima, _interOffsetTimeMinima, _interOffsetTimeMaxima, _ftableReadLocationIncrement, _readIncrementQuanta, _interOffsetTimeQuanta);> }
	ShufflerL { arg in, fragmentSize, maxDelay; <primitive: return sc.ShufflerL(_in, _fragmentSize, _maxDelay);> }
	Sieve1 { arg bufnum, gap, alternate; <primitive: return sc.Sieve1(_bufnum, _gap, _alternate);> }
	SinGrain { arg trigger, dur, freq; <primitive: return sc.SinGrain(_trigger, _dur, _freq);> }
	SinGrainB { arg trigger, dur, freq, envbuf; <primitive: return sc.SinGrainB(_trigger, _dur, _freq, _envbuf);> }
	SinGrainBBF { arg trigger, dur, freq, envbuf, azimuth, elevation, rho, wComp; <primitive: return sc.SinGrainBBF(_trigger, _dur, _freq, _envbuf, _azimuth, _elevation, _rho, _wComp);> }
	SinGrainBF { arg trigger, dur, freq, azimuth, elevation, rho, wComp; <primitive: return sc.SinGrainBF(_trigger, _dur, _freq, _azimuth, _elevation, _rho, _wComp);> }
	SinGrainI { arg trigger, dur, freq, envbuf1, envbuf2, ifac; <primitive: return sc.SinGrainI(_trigger, _dur, _freq, _envbuf1, _envbuf2, _ifac);> }
	SinGrainIBF { arg trigger, dur, freq, envbuf1, envbuf2, ifac, azimuth, elevation, rho, wComp; <primitive: return sc.SinGrainIBF(_trigger, _dur, _freq, _envbuf1, _envbuf2, _ifac, _azimuth, _elevation, _rho, _wComp);> }
	SinTone { arg freq, phase; <primitive: return sc.SinTone(_freq, _phase);> }
	SineShaper { arg in, limit; <primitive: return sc.SineShaper(_in, _limit);> }
	SkipNeedle { arg range, rate, offset; <primitive: return sc.SkipNeedle(_range, _rate, _offset);> }
	Slide { arg in, slideup, slidedown; <primitive: return sc.Slide(_in, _slideup, _slidedown);> }
	Slub { arg trig, spike; <primitive: return sc.Slub(_trig, _spike);> }
	SmoothDecimator { arg in, rate, smoothing; <primitive: return sc.SmoothDecimator(_in, _rate, _smoothing);> }
	SoftClipAmp { arg in, pregain; <primitive: return sc.SoftClipAmp(_in, _pregain);> }
	SoftClipAmp4 { arg in, pregain; <primitive: return sc.SoftClipAmp4(_in, _pregain);> }
	SoftClipAmp8 { arg in, pregain; <primitive: return sc.SoftClipAmp8(_in, _pregain);> }
	SoftClipper4 { arg in; <primitive: return sc.SoftClipper4(_in);> }
	SoftClipper8 { arg in; <primitive: return sc.SoftClipper8(_in);> }
	SortBuf { arg bufnum, sortrate, reset; <primitive: return sc.SortBuf(_bufnum, _sortrate, _reset);> }
	SpectralEntropy { arg numChan, fft, fftsize, numbands; <primitive: return sc.SpectralEntropy(_numChan, _fft, _fftsize, _numbands);> }
	Spreader { arg in, theta, filtsPerOctave; <primitive: return sc.Spreader(_in, _theta, _filtsPerOctave);> }
	SpruceBudworm { arg reset, rate, k1, k2, alpha, beta, mu, rho, initx, inity; <primitive: return sc.SpruceBudworm(_reset, _rate, _k1, _k2, _alpha, _beta, _mu, _rho, _initx, _inity);> }
	Squiz { arg in, pitchratio, zcperchunk, memlen; <primitive: return sc.Squiz(_in, _pitchratio, _zcperchunk, _memlen);> }
	Standard2DC { arg minfreq, maxfreq, k, x0, y0; <primitive: return sc.Standard2DC(_minfreq, _maxfreq, _k, _x0, _y0);> }
	Standard2DL { arg minfreq, maxfreq, k, x0, y0; <primitive: return sc.Standard2DL(_minfreq, _maxfreq, _k, _x0, _y0);> }
	Standard2DN { arg minfreq, maxfreq, k, x0, y0; <primitive: return sc.Standard2DN(_minfreq, _maxfreq, _k, _x0, _y0);> }
	StandardTrig { arg minfreq, maxfreq, k, x0, y0; <primitive: return sc.StandardTrig(_minfreq, _maxfreq, _k, _x0, _y0);> }
	StkBandedWG { arg freq, instr, bowpressure, bowmotion, integration, modalresonance, bowvelocity, setstriking, trig; <primitive: return sc.StkBandedWG(_freq, _instr, _bowpressure, _bowmotion, _integration, _modalresonance, _bowvelocity, _setstriking, _trig);> }
	StkBeeThree { arg freq, op4gain, op3gain, lfospeed, lfodepth, adsrtarget, trig; <primitive: return sc.StkBeeThree(_freq, _op4gain, _op3gain, _lfospeed, _lfodepth, _adsrtarget, _trig);> }
	StkBlowHole { arg freq, reedstiffness, noisegain, tonehole, register, breathpressure; <primitive: return sc.StkBlowHole(_freq, _reedstiffness, _noisegain, _tonehole, _register, _breathpressure);> }
	StkBowed { arg freq, bowpressure, bowposition, vibfreq, vibgain, loudness, gate, attackrate, decayrate; <primitive: return sc.StkBowed(_freq, _bowpressure, _bowposition, _vibfreq, _vibgain, _loudness, _gate, _attackrate, _decayrate);> }
	StkClarinet { arg freq, reedstiffness, noisegain, vibfreq, vibgain, breathpressure, trig; <primitive: return sc.StkClarinet(_freq, _reedstiffness, _noisegain, _vibfreq, _vibgain, _breathpressure, _trig);> }
	StkFlute { arg freq, jetDelay, noisegain, jetRatio; <primitive: return sc.StkFlute(_freq, _jetDelay, _noisegain, _jetRatio);> }
	StkGlobals { arg showWarnings, printErrors, rawfilepath; <primitive: return sc.StkGlobals(_showWarnings, _printErrors, _rawfilepath);> }
	StkInst { arg freq, gate, onamp, offamp, instNumber, args; <primitive: return sc.StkInst(_freq, _gate, _onamp, _offamp, _instNumber, _args);> }
	StkMandolin { arg freq, bodysize, pickposition, stringdamping, stringdetune, aftertouch, trig; <primitive: return sc.StkMandolin(_freq, _bodysize, _pickposition, _stringdamping, _stringdetune, _aftertouch, _trig);> }
	StkModalBar { arg freq, instrument, stickhardness, stickposition, vibratogain, vibratofreq, directstickmix, volume, trig; <primitive: return sc.StkModalBar(_freq, _instrument, _stickhardness, _stickposition, _vibratogain, _vibratofreq, _directstickmix, _volume, _trig);> }
	StkMoog { arg freq, filterQ, sweeprate, vibfreq, vibgain, gain, trig; <primitive: return sc.StkMoog(_freq, _filterQ, _sweeprate, _vibfreq, _vibgain, _gain, _trig);> }
	StkPluck { arg freq, decay; <primitive: return sc.StkPluck(_freq, _decay);> }
	StkSaxofony { arg freq, reedstiffness, reedaperture, noisegain, blowposition, vibratofrequency, vibratogain, breathpressure, trig; <primitive: return sc.StkSaxofony(_freq, _reedstiffness, _reedaperture, _noisegain, _blowposition, _vibratofrequency, _vibratogain, _breathpressure, _trig);> }
	StkShakers { arg instr, energy, decay, objects, resfreq; <primitive: return sc.StkShakers(_instr, _energy, _decay, _objects, _resfreq);> }
	StkVoicForm { arg freq, vuvmix, vowelphon, vibfreq, vibgain, loudness, trig; <primitive: return sc.StkVoicForm(_freq, _vuvmix, _vowelphon, _vibfreq, _vibgain, _loudness, _trig);> }
	Streson { arg input, delayTime, res; <primitive: return sc.Streson(_input, _delayTime, _res);> }
	StringVoice { arg trig, infsustain, freq, accent, structure, brightness, damping; <primitive: return sc.StringVoice(_trig, _infsustain, _freq, _accent, _structure, _brightness, _damping);> }
	Summer { arg trig, step, reset, resetval; <primitive: return sc.Summer(_trig, _step, _reset, _resetval);> }
	SvfBp { arg in, freq, q; <primitive: return sc.SvfBp(_in, _freq, _q);> }
	SvfHp { arg in, freq, q; <primitive: return sc.SvfHp(_in, _freq, _q);> }
	SvfLp { arg in, freq, q; <primitive: return sc.SvfLp(_in, _freq, _q);> }
	SwitchDelay { arg in, drylevel, wetlevel, delaytime, delayfactor, maxdelaytime; <primitive: return sc.SwitchDelay(_in, _drylevel, _wetlevel, _delaytime, _delayfactor, _maxdelaytime);> }
	TBetaRand { arg lo, hi, prob1, prob2, trig; <primitive: return sc.TBetaRand(_lo, _hi, _prob1, _prob2, _trig);> }
	TBrownRand { arg lo, hi, dev, dist, trig; <primitive: return sc.TBrownRand(_lo, _hi, _dev, _dist, _trig);> }
	TExpRandN { arg numChan, lo, hi, trigger; <primitive: return sc.TExpRandN(_numChan, _lo, _hi, _trigger);> }
	TGaussRand { arg lo, hi, trig; <primitive: return sc.TGaussRand(_lo, _hi, _trig);> }
	TGrains2 { arg numChan, trigger, bufnum, rate, centerPos, dur, pan, amp, att, dec, interp; <primitive: return sc.TGrains2(_numChan, _trigger, _bufnum, _rate, _centerPos, _dur, _pan, _amp, _att, _dec, _interp);> }
	TGrains3 { arg numChan, trigger, bufnum, rate, centerPos, dur, pan, amp, att, dec, window, interp; <primitive: return sc.TGrains3(_numChan, _trigger, _bufnum, _rate, _centerPos, _dur, _pan, _amp, _att, _dec, _window, _interp);> }
	TLinRand { arg lo, hi, minmax, trigger; <primitive: return sc.TLinRand(_lo, _hi, _minmax, _trigger);> }
	TLinRandN { arg numChan, lo, hi, minmax, trigger; <primitive: return sc.TLinRandN(_numChan, _lo, _hi, _minmax, _trigger);> }
	TPV { arg chain, windowsize, hopsize, maxpeaks, currentpeaks, freqmult, tolerance, noisefloor; <primitive: return sc.TPV(_chain, _windowsize, _hopsize, _maxpeaks, _currentpeaks, _freqmult, _tolerance, _noisefloor);> }
	TRandN { arg numChan, lo, hi, trigger; <primitive: return sc.TRandN(_numChan, _lo, _hi, _trigger);> }
	TScramble { arg trigger, inputs; <primitive: return sc.TScramble(_trigger, _inputs);> }
	TTendency { arg trigger, dist, parX, parY, parA, parB; <primitive: return sc.TTendency(_trigger, _dist, _parX, _parY, _parA, _parB);> }
	Tartini { arg in, threshold, n, k, overlap, smallCutoff; <primitive: return sc.Tartini(_in, _threshold, _n, _k, _overlap, _smallCutoff);> }
	TermanWang { arg input, reset, ratex, ratey, alpha, beta, eta, initx, inity; <primitive: return sc.TermanWang(_input, _reset, _ratex, _ratey, _alpha, _beta, _eta, _initx, _inity);> }
	TextVU { arg trig, in, label, width, reset, ana; <primitive: return sc.TextVU(_trig, _in, _label, _width, _reset, _ana);> }
	Tilt { arg w, x, y, z, tilt; <primitive: return sc.Tilt(_w, _x, _y, _z, _tilt);> }
	TracePlay { arg bufnum, degree, rate, axis; <primitive: return sc.TracePlay(_bufnum, _degree, _rate, _axis);> }
	TraceRead { arg bufnum, degree, index, axis; <primitive: return sc.TraceRead(_bufnum, _degree, _index, _axis);> }
	TrigAvg { arg in, trig; <primitive: return sc.TrigAvg(_in, _trig);> }
	Tumble { arg w, x, y, z, tilt; <primitive: return sc.Tumble(_w, _x, _y, _z, _tilt);> }
	TwoTube { arg input, k, loss, d1length, d2length; <primitive: return sc.TwoTube(_input, _k, _loss, _d1length, _d2length);> }
	UHJ2B { arg ls, rs; <primitive: return sc.UHJ2B(_ls, _rs);> }
	VBAP { arg numChan, in, bufnum, azimuth, elevation, spread; <primitive: return sc.VBAP(_numChan, _in, _bufnum, _azimuth, _elevation, _spread);> }
	VBChebyFilt { arg in, freq, mode, order; <primitive: return sc.VBChebyFilt(_in, _freq, _mode, _order);> }
	VBFourses { arg smoother, freqarray; <primitive: return sc.VBFourses(_smoother, _freqarray);> }
	VBJonVerb { arg in, decay, damping, inputbw, erfl, tail; <primitive: return sc.VBJonVerb(_in, _decay, _damping, _inputbw, _erfl, _tail);> }
	VBPVoc { arg numChannels, bufnum, playpos, fftsize; <primitive: return sc.VBPVoc(_numChannels, _bufnum, _playpos, _fftsize);> }
	VMScan2D { arg bufnum; <primitive: return sc.VMScan2D(_bufnum);> }
	VOSIM { arg trig, freq, nCycles, decay; <primitive: return sc.VOSIM(_trig, _freq, _nCycles, _decay);> }
	VarShapeOsc { arg freq, pw, waveshape, sync, syncfreq; <primitive: return sc.VarShapeOsc(_freq, _pw, _waveshape, _sync, _syncfreq);> }
	VosimOsc { arg freq, form1freq, form2freq, shape; <primitive: return sc.VosimOsc(_freq, _form1freq, _form2freq, _shape);> }
	WAmp { arg in, winSize; <primitive: return sc.WAmp(_in, _winSize);> }
	WalshHadamard { arg input, which; <primitive: return sc.WalshHadamard(_input, _which);> }
	WarpZ { arg numChan, bufnum, pointer, freqScale, windowSize, envbufnum, overlaps, windowRandRatio, interp, zeroSearch, zeroStart; <primitive: return sc.WarpZ(_numChan, _bufnum, _pointer, _freqScale, _windowSize, _envbufnum, _overlaps, _windowRandRatio, _interp, _zeroSearch, _zeroStart);> }
	WaveLoss { arg in, drop, outof, mode; <primitive: return sc.WaveLoss(_in, _drop, _outof, _mode);> }
	WaveTerrain { arg bufnum, x, y, xsize, ysize; <primitive: return sc.WaveTerrain(_bufnum, _x, _y, _xsize, _ysize);> }
	WaveletDaub { arg input, n, which; <primitive: return sc.WaveletDaub(_input, _n, _which);> }
	WeaklyNonlinear { arg input, reset, ratex, ratey, freq, initx, inity, alpha, xexponent, beta, yexponent; <primitive: return sc.WeaklyNonlinear(_input, _reset, _ratex, _ratey, _freq, _initx, _inity, _alpha, _xexponent, _beta, _yexponent);> }
	WeaklyNonlinear2 { arg input, reset, ratex, ratey, freq, initx, inity, alpha, xexponent, beta, yexponent; <primitive: return sc.WeaklyNonlinear2(_input, _reset, _ratex, _ratey, _freq, _initx, _inity, _alpha, _xexponent, _beta, _yexponent);> }
	Werner { arg input, freq, damp, feedback, drive, oversample; <primitive: return sc.Werner(_input, _freq, _damp, _feedback, _drive, _oversample);> }
	WrapSummer { arg trig, step, min, max, reset, resetval; <primitive: return sc.WrapSummer(_trig, _step, _min, _max, _reset, _resetval);> }
	ZOsc { arg freq, formantfreq, shape, mode; <primitive: return sc.ZOsc(_freq, _formantfreq, _shape, _mode);> }
}
