{- Requires: Ugen -}

+@Integer {

	BrownNoise { :numChan |
		{ BrownNoise() } ! numChan
	}

	GrayNoise { :numChan |
		{ GrayNoise() } ! numChan
	}

	PinkNoise { :numChan |
		{ PinkNoise() } ! numChan
	}

	WhiteNoise { :numChan |
		{ WhiteNoise() } ! numChan
	}

}


+[List, SmallFloat, Ugen] {

	PulseDpw { :freq :width |
		SawDpw(freq, 0) - SawDpw(freq, (width + width).Wrap(-1, 1))
	}

	LinCurve { :self :inMin :inMax :outMin :outMax :curve |
		let grow = curve.Exp;
		let a = outMax - outMin / (1 - grow);
		let b = outMin + a;
		let scaled = (self.Clip(inMin, inMax) - inMin) / (inMax - inMin);
		let curvedResult = b - (a * (grow ^ scaled));
		curve.isNumber.if {
			curvedResult
		} {
			Select2(
				curve.Abs >= 0.125,
				curvedResult,
				self.LinLin(inMin, inMax, outMin, outMax)
			)
		}
	}

	HoldSequence { :inList :dur |
		let gate = DurationGate(dur);
		let trig = Trig1(gate, SampleDur());
		let index = Stepper(trig, 1, 0, inList.size - 1, 1, 0);
		Latch(Multiplexer(index, inList), trig)
	}

	THoldSequence { :inList :dur |
		HoldSequence(inList, dur).Trig1(SampleDur())
	}

	ZeroBuf { :self |
		self <! ClearBuf(self)
	}

	WrapOut { :self |
		<primitive: return sc.wrapOut(_busOffset_1(_self), _self);>
	}

	Distances { :x :y :z :coordinateList |
		WDistances(1, x, y, z, coordinateList)
	}

	KNearest { :numChannels :x :y :z :coordinateList |
		WkNearest(numChannels, 1, x, y, z, coordinateList)
	}

	TableWindow { :trig :dur :bufNum |
		let phase = TLine(0, BufFrames(bufNum), dur, trig);
		BufRd(1, bufNum, phase, 0, 4) {- 4 = Cubic Interpolation -}
	}

	SelectXFocus { :which :array :focus :wrap |
		wrap.if {
			array.withIndexCollect { :input :index |
				(1 - (ModDif(which, index - 1, array.size) * focus)).Max(0) * input
			}.sum
		} {
			array.withIndexCollect { :input :index |
				(1 - (AbsDif(which, index - 1) * focus)).Max(0) * input
			}
		}
	}

	CurveGen { :gate :levels :times :curves |
		Env(levels, times, curves, nil, nil, 0).asEnvGen(gate)
	}

	LinGen { :gate :levels :times |
		Env(levels, times, ['lin'], nil, nil, 0).asEnvGen(gate)
	}

	TBufChoose { :tr :buf |
		BufRd(
			1,
			buf,
			TiRand(0, BufFrames(buf) - 1, tr),
			0,
			1 {- 1 = No Interpolation -}
		)
	}

	Choose { :tr :inList |
		(inList.elementType = 'SmallFloat').if {
			TBufChoose(tr, inList.asLocalBuf)
		} {
			inList.isMatrixOf('SmallFloat').if {
				TBufChoose(tr, inList.asLocalBufferList)
			} {
				TChoose(tr, inList)
			}
		}
	}

	{-
		ExpRand { :tr :lo :hi | TExpRand(lo, hi, tr) }
		LinRand { :tr :lo :hi :minmax | TLinRand(lo, hi, minmax, tr) }
		Line { :tr :start :end :dur | TLine(start, end, dur, tr) }
		Rand { :tr :lo :hi | TRand(lo, hi, tr) }
		Scramble { :tr :inList | TScramble(tr, inList) }
		IRand { :tr :lo :hi | TiRand(lo, hi, tr) }
		XLine { :tr :start :end :dur | TxLine(start, end, dur, tr) }
	-}

	{-
		AudioIn { :channelNumber |
			In(1, NumOutputBuses() + channelNumber - 1)
		}
	-}

	AudioOut { :channelsList |
		Out(0, channelsList)
	}

	Cc { :index |
		ControlIn(1, 11000 + index - 1)
	}

	EnvBreakPoint { :breakPointList :curves |
		let n = breakPointList.size;
		Env(
			(1, 3 .. n).collect { :index |
				breakPointList[index]
			},
			(2, 4 .. n - 1).collect { :index |
				breakPointList[index]
			}.differentiate,
			curves,
			nil,
			nil,
			0
		)
	}

	EnvLinen { :attackTime :sustainTime :releaseTime :level :curve |
		<primitive: return sc.EnvLinen(_attackTime, _sustainTime, _releaseTime, _level, _curve);>
	}

	EqBalance2 { :left :right :pos |
		Balance2(left, right, pos, 1)
	}

	EqPan2 { :in :pos |
		Pan2(in, pos, 1)
	}

	ExpRange { :self :lo :hi |
		LinExp(self, -1, 1, lo, hi)
	}

	Fm7Matrix { :ctlMatrix :modMatrix |
		Fm7(ctlMatrix.concatenation, modMatrix.concatenation)
	}

	ImpulseSequencer { :self :trig |
		Sequencer(self, trig) * Trig(trig, SampleDur())
	}

	DemandImpulseSequencer { :self :trig |
		DemandSequencer(self, trig) * Trig(trig, SampleDur())
	}

	LinRand0 { :self |
		LinRand(0, self, 1)
	}

	IRand0 { :self |
		IRand(0, self)
	}

	IRand1 { :self |
		IRand(1, self)
	}

	IRand2 { :self |
		IRand(0 - self, self)
	}

	LinLin { :self :srcLo :srcHi :dstLo :dstHi |
		let mul = (dstHi - dstLo) / (srcHi - srcLo);
		let add = dstLo - (mul * srcLo);
		MulAdd(self.Clip(srcLo, srcHi), mul, add)
	}

	Rand0 { :self |
		Rand(0, self)
	}

	Rand2 { :self |
		Rand(0 - self, self)
	}

	LinRange { :self :lo :hi |
		LinLin(self, -1, 1, lo, hi)
	}

	ExpRange { :self :lo :hi |
		LinExp(self, -1, 1, lo, hi)
	}

	Sequencer { :inList :trig |
		Multiplexer(
			Stepper(trig, 1, 0, inList.size - 1, 1, 0),
			inList
		)
	}

	DemandSequencer { :self :trig |
		Demand(trig, 0, Dseq(inf, self))
	}

	DurationSequencer { :self :dur |
		Duty(dur, 0, Dseq(inf, self))
	}

	TDurationSequencer { :self :dur |
		TDuty(dur, 0, Dseq(inf, self))
	}

	Silent { :numChannels |
		(numChannels == 1).if {
			Dc(0)
		} {
			Dc(0) # numChannels
		}
	}

	SplayAz { :numChannels :inList :spread :level :width :center :orientation :levelComp |
		let n = 1.max(inList.size);
		let pos = (n = 1).if {
			center
		} {
			let normalizedSpread = spread * ((n - 1) / n);
			[center - normalizedSpread, center + normalizedSpread].resamp1(n)
		};
		levelComp.ifTrue {
			{- Cf. <https://github.com/supercollider/supercollider/issues/5706>
			Note that deleting .sqrt can dramatically alter feedback paths. -}
			level := level * n.reciprocal.sqrt
		};
		PanAz(numChannels, inList, pos, level, width, orientation).flop.collect(sum:/1)
	}

	Tr { :self |
		Trig(self, SampleDur())
	}

	Tr1 { :self |
		Trig1(self, SampleDur())
	}

}


+ [List, SmallFloat, Ugen] {

	** { :self :aNumber | self ^ aNumber }

	Env { :levels :times :curves :releaseNode :loopNode :offset | <primitive: return new sc.Env(_levels, _times, _curves, _releaseNode, _loopNode, _offset);> }

	Adsr { :gate :attackTime :decayTime :sustainLevel :releaseTime :curve | <primitive: return sc.Adsr(_gate, _attackTime, _decayTime, _sustainLevel, _releaseTime, _curve);> }
	Asr { :gate :attackTime :releaseTime :curve | <primitive: return sc.Asr(_gate, _attackTime, _releaseTime, _curve);> }
	AudioIn { :channelsList | <primitive: return sc.AudioIn(_channelsList);> }
	BHiPass4 { :in :freq :rq | <primitive: return sc.BHiPass4(_in, _freq, _rq);> }
	BLowPass4 { :in :freq :rq | <primitive: return sc.BLowPass4(_in, _freq, _rq);> }
	BufAlloc { :numChannels :numFrames | <primitive: return sc.BufAlloc(_numChannels, _numFrames);> }
	BufClear { :bufnum | <primitive: return sc.BufClear(_bufnum);> }
	BufRec { :bufnum :reset :inputList | <primitive: return sc.BufRec(_bufnum, _reset, _inputList);> }
	BufWrite { :bufnum :phase :loop :inputList | <primitive: return sc.BufWrite(_bufnum, _phase, _loop, _inputList);> }
	Changed { :input :threshold | <primitive: return sc.Changed(_input, _threshold);> }
	CompanderD { :in :thresh :slopeBelow :slopeAbove :clampTime :relaxTime | <primitive: return sc.CompanderD(_in, _thresh, _slopeBelow, _slopeAbove, _clampTime, _relaxTime);> }
	ControlIn { :numChannels :bus | <primitive: return sc.ControlIn(_numChannels, _bus);> }
	ControlOut { :bus :channelsList | <primitive: return sc.ControlOut(_bus, _channelsList);> }
	Cutoff { :sustainTime :releaseTime :curve | <primitive: return sc.Cutoff(_sustainTime, _releaseTime, _curve);> }
	DelayTap { :bufnum :delayTime | <primitive: return sc.DelayTap(_bufnum, _delayTime);> }
	DelayWrite { :bufnum :input | <primitive: return sc.DelayWrite(_bufnum, _input);> }
	DynRingzBank { :input :freq :amp :time | <primitive: return sc.DynRingzBank(_input, _freq, _amp, _time);> }
	InFb { :numChannels :bus | <primitive: return sc.InFb(_numChannels, _bus);> }
	LinSeg { :gate :coordList | <primitive: return sc.LinSeg(_gate, _coordList);> }
	Line { :start :end :dur | <primitive: return sc.Line(_start, _end, _dur, 0);> }
	MultiTapDelay { :timesList :levelsList :input | <primitive: return sc.MultiTapDelay(_timesList, _levelsList, _input);> }
	Osc1 { :buf :dur | <primitive: return sc.Osc1(_buf, _dur);> }
	Perc { :trig :attackTime :releaseTime :curve | <primitive: return sc.Perc(_trig, _attackTime, _releaseTime, _curve);> }
	PingPongDelay { :left :right :maxDelayTime :delayTime :feedback | <primitive: return sc.PingPongDelay(_left, _right, _maxDelayTime, _delayTime, _feedback);> }
	PmOsc { :carfreq :modfreq :pmindex :modphase | <primitive: return sc.PmOsc(_carfreq, _modfreq, _pmindex, _modphase);> }
	Release { :input :attackTime :dur :releaseTime | <primitive: return sc.Release(_input, _attackTime, _dur, _releaseTime);> }
	RingzBank { :input :freq :amp :time | <primitive: return sc.RingzBank(_input, _freq, _amp, _time);> }
	Select2 { :predicate :ifTrue :ifFalse | <primitive: return sc.Select2(_predicate, _ifTrue, _ifFalse);> }
	SelectX { :which :array | <primitive: return sc.SelectX(_which, _array);> }
	SfDur { :sfBufferList |<primitive: return sc.SfDur(_sfBufferList);> }
	SfFrames { :sfBufferList |<primitive: return sc.SfFrames(_sfBufferList);> }
	SfPlay { :sfBufferList :rate :trigger :startPos :loop |<primitive: return sc.SfPlay(_sfBufferList, _rate, _trigger, _startPos, _loop);> }
	SfRateScale { :sfBufferList |<primitive: return sc.SfRateScale(_sfBufferList);> }
	SfRead { :sfBufferList :phase :loop :interpolation |<primitive: return sc.SfRead(_sfBufferList, _phase, _loop, _interpolation);> }
	SfSampleRate { :sfBufferList |<primitive: return sc.SfSampleRate(_sfBufferList);> }
	Shuf { :repeats :list | <primitive: return sc.Shuf(_repeats, _list);> }
	SinOscBank { :freq :amp :phase | <primitive: return sc.SinOscBank(_freq, _amp, _phase);> }
	Sine { :trig :dur | <primitive: return sc.Sine(_trig, _dur);> }
	Splay2 { :inList :spread :level :center :levelComp | <primitive: return sc.Splay(_inList, _spread, _level, _center, _levelComp);> }
	Splay2 { :inList | <primitive: return sc.Splay2(_inList);> }
	TChoose { :trig :array | <primitive: return sc.TChoose(_trig, _array);> }
	TwChoose { :trig :array :weights :normalize | <primitive: return sc.TwChoose(_trig, _array, _weights, _normalize);> }
	TLine { :start :end :dur :trig | <primitive: return sc.TLine(_start, _end, _dur, _trig);> }
	TxLine { :start :end :dur :trig | <primitive: return sc.TxLine(_start, _end, _dur, _trig);> }
	VarLag { :input :time :curve | <primitive: return sc.VarLag(_input, _time, _curve);> }
	XChoose { :repeats :list | <primitive: return sc.XChoose(_repeats, _list);> }
	XLine { :start :end :dur | <primitive: return sc.XLine(_start, _end, _dur, 0);> }

}
