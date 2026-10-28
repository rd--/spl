/* Requires: Ugen */

+[List, SmallFloat, Ugen] {

	blendXFade { :y1 :y2 :mu |
		let signedMu = mu.linLin(0, 1, -1, 1);
		xFade2(y1, y2, signedMu, 1)
	}

	brownNoise { :mul :add |
		{ brownNoise() } ! mul.shape * mul + add
	}

	clipNoise { :mul :add |
		{ clipNoise() } ! mul.shape * mul + add
	}

	greyNoise { :mul :add |
		{ greyNoise() } ! mul.shape * mul + add
	}

	pinkNoise { :mul :add |
		{ pinkNoise() } ! mul.shape * mul + add
	}

	whiteNoise { :mul :add |
		{ whiteNoise() } ! mul.shape * mul + add
	}

}

+Ugen {

	feedforwardFeedbackward { :in :forward/2 :backward/1 |
		let maxBlockSize = 512;
		let buffer = bufAlloc(1, maxBlockSize + 1).bufClear;
		let delayTime = controlDur();
		let reader = delayTap(buffer, delayTime);
		let backwardAnswer = backward(reader);
		let forwardAnswer = forward(in, backwardAnswer);
		let writer = delayWrite(buffer, forwardAnswer);
		[backwardAnswer, forwardAnswer].anySatisfy(isList/1).ifTrue {
			'FeedforwardFeedbackward: processors not monophonic'.error
		};
		forwardAnswer <! writer
	}

}

+List {

	feedforwardFeedbackward { :in :forward/2 :backward/1 |
		in.collect { :x |
			feedforwardFeedbackward(x, forward/2, backward/1)
		}
	}

}

+[List, SmallFloat, Ugen] {

	audioOut { :channelsList |
		out(0, channelsList)
	}

	cc { :index |
		controlIn(1, 11000 + index - 1)
	}

	curveGen { :gate :levels :times :curves |
		Env(levels, times, curves, nil, nil, 0).asEnvGen(gate)
	}

	demandImpulseSequencer { :self :trig |
		demandSequencer(self, trig) * trig(trig, sampleDur())
	}

	demandSequencer { :self :trig |
		demand(trig, 0, dseq(Infinity, self))
	}

	distances { :x :y :z :coordinateList |
		wDistances(1, x, y, z, coordinateList)
	}

	durationSequencer { :self :dur |
		duty(dur, 0, dseq(Infinity, self))
	}

	envBreakPoint { :breakPointList :curves |
		let n = breakPointList.size;
		let m = n - 1;
		Env(
			1.toBy(n, 2).collect { :index |
				breakPointList[index]
			},
			2.toBy(m, 2).collect { :index |
				breakPointList[index]
			}.differentiate,
			curves,
			nil,
			nil,
			0
		)
	}

	envLinen { :attackTime :sustainTime :releaseTime :level :curve |
		<primitive: return sc.EnvLinen(_attackTime, _sustainTime, _releaseTime, _level, _curve);>
	}

	eqBalance2 { :left :right :pos |
		balance2(left, right, pos, 1)
	}

	eqPan2 { :in :pos |
		pan2(in, pos, 1)
	}

	expRange { :self :lo :hi |
		linExp(self, -1, 1, lo, hi)
	}

	fm7Matrix { :ctlMatrix :modMatrix |
		fm7(ctlMatrix.catenate, modMatrix.catenate)
	}

	holdSequence { :inList :dur |
		let gate = durationGate(dur);
		let trig = trig1(gate, sampleDur());
		let index = stepper(trig.kr, 1, 0, inList.size - 1, 1, 0);
		latch(
			selectT(index, inList), /* multiplexer */
			trig
		)
	}

	iRand0 { :self |
		iRand(0, self)
	}

	iRand1 { :self |
		iRand(1, self)
	}

	iRand2 { :self |
		iRand(0 - self, self)
	}

	impulseSequencer { :self :trig |
		sequencer(self, trig) * trig(trig, sampleDur())
	}

	kNearest { :numChannels :x :y :z :coordinateList |
		wkNearest(numChannels, 1, x, y, z, coordinateList)
	}

	linCurve { :self :inMin :inMax :outMin :outMax :curve |
		let grow = curve.exp;
		let a = outMax - outMin / (1 - grow);
		let b = outMin + a;
		let scaled = (self.clip(inMin, inMax) - inMin) / (inMax - inMin);
		let curvedResult = b - (a * (grow ^ scaled));
		curve.isNumber.if {
			curvedResult
		} {
			select2(
				curve.abs >= 0.125,
				curvedResult,
				self.linLin(inMin, inMax, outMin, outMax)
			)
		}
	}

	linGen { :gate :levels :times |
		Env(levels, times, ['lin'], nil, nil, 0).asEnvGen(gate)
	}

	linLin { :self :srcLo :srcHi :dstLo :dstHi |
		let mul = (dstHi - dstLo) / (srcHi - srcLo);
		let add = dstLo - (mul * srcLo);
		self.clip(srcLo, srcHi).timesPlus(mul, add)
	}

	linRand0 { :self |
		linRand(0, self, 1)
	}

	linRange { :self :lo :hi |
		linLin(self, -1, 1, lo, hi)
	}

	mouseX { :minval :maxval |
		mouseX(minval, maxval, 0, 0.2)
	}

	mouseY { :minval :maxval |
		mouseY(minval, maxval, 0, 0.2)
	}

	pulseDpw { :freq :width |
		sawDpw(freq, 0) - sawDpw(freq, (width + width).wrap(-1, 1))
	}

	rand0 { :self |
		rand(0, self)
	}

	rand2 { :self |
		rand(0 - self, self)
	}

	selectXFocus { :which :array :focus :wrap |
		wrap.if {
			array.withIndexCollect { :input :index |
				(1 - (modularDistance(which, index - 1, array.size) * focus)).max(0) * input
			}.sum
		} {
			array.withIndexCollect { :input :index |
				(1 - (absDif(which, index - 1) * focus)).max(0) * input
			}
		}
	}

	sequencer { :inList :trig |
		selectT(
			stepper(trig.kr, 1, 0, inList.size - 1, 1, 0),
			inList
		) /* multiplexer */
	}

	silent { :numChannels |
		(numChannels = 1).if {
			dc(0)
		} {
			List(numChannels, dc(0))
		}
	}

	splayAz { :numChannels :inList :spread :level :width :center :orientation :levelComp |
		let n = 1.max(inList.size);
		let pos = (n = 1).if {
			center
		} {
			let normalizedSpread = spread * ((n - 1) / n);
			[
				center - normalizedSpread,
				center + normalizedSpread
			].resample(n)
		};
		levelComp.ifTrue {
			/* Cf. <https://github.com/supercollider/supercollider/issues/5706>
			Note that deleting .sqrt can dramatically alter feedback paths. */
			level := level * n.reciprocal.sqrt
		};
		panAz(numChannels, inList, pos, level, width, orientation).flop.collect(sum/1)
	}

	tBufChoose { :tr :buf |
		bufRd(
			1,
			buf,
			tiRand(0, bufFrames(buf) - 1, tr),
			0,
			1 /* 1 = No Interpolation */
		)
	}

	tChoose { :tr :inList |
		(
			inList.elementType = 'SmallFloat' |  {
				inList.isMatrixOf('SmallFloat')
			}
		).if {
			tBufChoose(tr, localBuf(inList))
		} {
			uncheckedTChoose(tr, inList)
		}
	}

	tDurationSequencer { :self :dur |
		tDuty(dur, 0, dseq(Infinity, self))
	}

	tHoldSequence { :inList :dur |
		holdSequence(inList, dur).trig1(SampleDur())
	}

	tableWindow { :trig :dur :bufNum |
		let phase = tLine(0, bufFrames(bufNum), dur, trig);
		bufRd(1, bufNum, phase, 0, 4) /* 4 = Cubic Interpolation */
	}

	tr { :self |
		trig(self, sampleDur())
	}

	tr1 { :self |
		trig1(self, sampleDur())
	}

	wrapOut { :self |
		<primitive: return sc.WrapOut(_busOffset_1(_self), _self);>
	}

	zeroBuf { :self |
		self <! clearBuf(self)
	}

}

+[List, SmallFloat, Ugen] {

	Env { :levels :times :curves :releaseNode :loopNode :offset |
		<primitive: return new sc.Env(_levels, _times, _curves, _releaseNode, _loopNode, _offset);>
	}

	adsr { :gate :attackTime :decayTime :sustainLevel :releaseTime :curve |
		<primitive: return sc.Adsr(_gate, _attackTime, _decayTime, _sustainLevel, _releaseTime, _curve);>
	}

	asr { :gate :attackTime :releaseTime :curve |
		<primitive: return sc.Asr(_gate, _attackTime, _releaseTime, _curve);>
	}

	audioIn { :channelsList |
		<primitive: return sc.AudioIn(_channelsList);>
	}

	bHiPass4 { :in :freq :rq |
		<primitive: return sc.BHiPass4(_in, _freq, _rq);>
	}

	bLowPass4 { :in :freq :rq |
		<primitive: return sc.BLowPass4(_in, _freq, _rq);>
	}

	bufAlloc { :numChannels :numFrames |
		<primitive: return sc.BufAlloc(_numChannels, _numFrames);>
	}

	bufClear { :bufnum |
		<primitive: return sc.BufClear(_bufnum);>
	}

	bufRec { :bufnum :reset :inputList |
		<primitive: return sc.BufRec(_bufnum, _reset, _inputList);>
	}

	bufWrite { :bufnum :phase :loop :inputList |
		<primitive: return sc.BufWrite(_bufnum, _phase, _loop, _inputList);>
	}

	changed { :input :threshold |
		<primitive: return sc.Changed(_input, _threshold);>
	}

	companderD { :in :thresh :slopeBelow :slopeAbove :clampTime :relaxTime |
		<primitive: return sc.CompanderD(_in, _thresh, _slopeBelow, _slopeAbove, _clampTime, _relaxTime);>
	}

	controlIn { :numChannels :bus |
		<primitive: return sc.ControlIn(_numChannels, _bus);>
	}

	controlOut { :bus :channelsList |
		<primitive: return sc.ControlOut(_bus, _channelsList);>
	}

	cutoff { :sustainTime :releaseTime :curve |
		<primitive: return sc.Cutoff(_sustainTime, _releaseTime, _curve);>
	}

	delayTap { :bufnum :delayTime |
		<primitive: return sc.DelayTap(_bufnum, _delayTime);>
	}

	delayWrite { :bufnum :input |
		<primitive: return sc.DelayWrite(_bufnum, _input);>
	}

	dynRingzBank { :input :freq :amp :time |
		<primitive: return sc.DynRingzBank(_input, _freq, _amp, _time);>
	}

	inFb { :numChannels :bus |
		<primitive: return sc.InFb(_numChannels, _bus);>
	}

	linSeg { :gate :coordList |
		<primitive: return sc.LinSeg(_gate, _coordList);>
	}

	line { :start :end :dur |
		<primitive: return sc.Line(_start, _end, _dur, 0);>
	}

	multiTapDelay { :timesList :levelsList :input |
		<primitive: return sc.MultiTapDelay(_timesList, _levelsList, _input);>
	}

	osc1 { :buf :dur |
		<primitive: return sc.Osc1(_buf, _dur);>
	}

	perc { :trig :attackTime :releaseTime :curve |
		<primitive: return sc.Perc(_trig, _attackTime, _releaseTime, _curve);>
	}

	pingPongDelay { :left :right :maxDelayTime :delayTime :feedback |
		<primitive: return sc.PingPongDelay(_left, _right, _maxDelayTime, _delayTime, _feedback);>
	}

	pmOsc { :carfreq :modfreq :pmindex :modphase |
		<primitive: return sc.PmOsc(_carfreq, _modfreq, _pmindex, _modphase);>
	}

	release { :input :attackTime :dur :releaseTime |
		<primitive: return sc.Release(_input, _attackTime, _dur, _releaseTime);>
	}

	ringzBank { :input :freq :amp :time |
		<primitive: return sc.RingzBank(_input, _freq, _amp, _time);>
	}

	select2 { :predicate :ifTrue :ifFalse |
		<primitive: return sc.Select2(_predicate, _ifTrue, _ifFalse);>
	}

	selectX { :which :array |
		<primitive: return sc.SelectX(_which, _array);>
	}

	sfDuration { :sfBufferList |<primitive: return sc.SfDur(_sfBufferList);>
	}

	sfFrameCount { :sfBufferList |<primitive: return sc.SfFrames(_sfBufferList);>
	}

	sfPlay { :sfBufferList :rate :trigger :startPos :loop |<primitive: return sc.SfPlay(_sfBufferList, _rate, _trigger, _startPos, _loop);>
	}

	sfRateScale { :sfBufferList |<primitive: return sc.SfRateScale(_sfBufferList);>
	}

	sfRead { :sfBufferList :phase :loop :interpolation |<primitive: return sc.SfRead(_sfBufferList, _phase, _loop, _interpolation);>
	}

	sfSampleRate { :sfBufferList |<primitive: return sc.SfSampleRate(_sfBufferList);>
	}

	shuf { :repeats :list |
		<primitive: return sc.Shuf(_repeats, _list);>
	}

	sinOscBank { :freq :amp :phase |
		<primitive: return sc.SinOscBank(_freq, _amp, _phase);>
	}

	sine { :trig :dur |
		<primitive: return sc.Sine(_trig, _dur);>
	}

	splay2 { :inList :spread :level :center :levelComp |
		<primitive: return sc.Splay(_inList, _spread, _level, _center, _levelComp);>
	}

	splay2 { :inList |
		<primitive: return sc.Splay2(_inList);>
	}

	tLine { :start :end :dur :trig |
		<primitive: return sc.TLine(_start, _end, _dur, _trig);>
	}

	twChoose { :trig :array :weights :normalize |
		<primitive: return sc.TwChoose(_trig, _array, _weights, _normalize);>
	}

	txLine { :start :end :dur :trig |
		<primitive: return sc.TxLine(_start, _end, _dur, _trig);>
	}

	uncheckedTChoose { :trig :array |
		<primitive: return sc.TChoose(_trig, _array);>
	}

	varLag { :input :time :curve |
		<primitive: return sc.VarLag(_input, _time, _curve);>
	}

	xChoose { :repeats :list |
		<primitive: return sc.XChoose(_repeats, _list);>
	}

	xLine { :start :end :dur |
		<primitive: return sc.XLine(_start, _end, _dur, 0);>
	}

}
