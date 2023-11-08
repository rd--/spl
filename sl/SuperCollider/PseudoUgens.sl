(* Requires: Ugen *)

+Array {

	mixByNamedRule { :self :name |
		(
			'2×2→1×4': {
				self.concatenation
			},
			'2×2→1×4𝕫': {
				[1 2 4 3].collect { :each |
					self[each]
				}
			},
			'4×2→1×4': {
				self.concatenation.mixByIndexPairs(
					[
						[1 2 3 4 5 6 7 8],
						[1 2 2 3 3 4 4 1]
					].transposed
				)
			},
			'4×2→1×4𝕫': {
				self.concatenation.mixByIndexPairs(
					[
						[1 2 3 4 5 6 7 8],
						[1 2 2 4 4 3 3 1]
					].transposed
				)
			},
			'8×2→1×8': {
				self.concatenation.mixByIndexPairs(
					[
						(1 .. 16),
						[1 2 2 3 3 4 4 5 5 6 6 7 7 8 8 1]
					].transposed
				)
			},
			'8×2→2×4': {
				[
					self.first(4).mixByNamedRule('4×2→1×4'),
					self.last(4).mixByNamedRule('4×2→1×4')
				]
			},
			'8×2→2×4𝕫': {
				[
					self.first(4).mixByNamedRule('4×2→1×4𝕫'),
					self.last(4).mixByNamedRule('4×2→1×4𝕫')
				]
			},
			'16×2→1×2': {
				self.sum
			},
			'16×2→2×8': {
				[
					self.first(8).mixByNamedRule('8×2→1×8'),
					self.last(8).mixByNamedRule('8×2→1×8')
				]
			},
			'16×2→4×4': {
				self.clump(4).collect { :each |
					each.mixByNamedRule('4×2→1×4')
				}
			},
			'16×2→4×4𝕫': {
				self.clump(4).collect { :each |
					each.mixByNamedRule('4×2→1×4𝕫')
				}
			},
			'16×2→UoS': {
				[
					Silent(2),
					(self * 2).mixByNamedRule('16×2→4×4𝕫').sum,
					Silent(2),
					self.first(8).mixByNamedRule('8×2→1×8'),
					self.last(8).mixByNamedRule('8×2→2×4𝕫').concatenation
				].concatenation
			}
		).at(name).value
	}

	mixIntoByIndexPairs { :self :outputs :indexPairs |
		indexPairs.do { :each |
			outputs[each.second] +:= self[each.first]
		}
	}

	mixByIndexPairs { :self :indexPairs |
		|(
			maxOutputIndex = indexPairs.collect(second:/1).max,
			outputs = { Dc(0) } ! maxOutputIndex
		)|
		mixIntoByIndexPairs(self, outputs, indexPairs);
		outputs
	}

}


+[Array, SmallFloat, Ugen] {

(*
	AudioIn { :channelNumber |
		In(1, NumOutputBuses() + channelNumber - 1)
	}
*)

	AudioOut { :channelsArray |
		Out(0, channelsArray)
	}

	Cc { :index |
		ControlIn(1, 11000 + index - 1)
	}

	EnvBreakPoint { :breakPointArray :curves |
		| n = breakPointArray.size; |
		Env(
			(1, 3 .. n).collect { :index | breakPointArray[index] },
			(2, 4 .. n - 1).collect { :index | breakPointArray[index] }.differentiate,
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

	ImpulseSequencer { :self :trig |
		Sequencer(self, trig) * Trig(trig, SampleDur())
	}

	IRand { :self |
		IRand(0, self)
	}

	LinLin { :self :srclo :srchi :dstlo :dsthi |
		|(
			mul = (dsthi - dstlo) / (srchi - srclo),
			add = dstlo - (mul * srclo)
		)|
		MulAdd(self, mul, add)
	}

	Rand { :self |
		Rand(0, self)
	}

	Rand2 { :self |
		Rand(0 - self, self)
	}

	Range { :self :lo :hi |
		LinLin(self, -1, 1, lo, hi)
	}

	Sequencer { :self :trig |
		Demand(trig, 0, Dseq(inf, self))
	}

	Silent { :numChannels |
		(numChannels == 1).if {
			Dc(0)
		} {
			Dc(0).replicate(numChannels)
		}
	}

}


+ [Array, SmallFloat, Ugen] {

	** { :self :aNumber | self ^ aNumber }

	Env { :levels :times :curves :releaseNode :loopNode :offset | <primitive: return new sc.Env(_levels, _times, _curves, _releaseNode, _loopNode, _offset);> }

	Adsr { :gate :attackTime :decayTime :sustainLevel :releaseTime :curve | <primitive: return sc.Adsr(_gate, _attackTime, _decayTime, _sustainLevel, _releaseTime, _curve);> }
	Asr { :gate :attackTime :releaseTime :curve | <primitive: return sc.Asr(_gate, _attackTime, _releaseTime, _curve);> }
	AudioIn { :channelsArray | <primitive: return sc.AudioIn(_channelsArray);> }
	BHiPass4 { :in :freq :rq | <primitive: return sc.BHiPass4(_in, _freq, _rq);> }
	BLowPass4 { :in :freq :rq | <primitive: return sc.BLowPass4(_in, _freq, _rq);> }
	BufAlloc { :numChannels :numFrames | <primitive: return sc.BufAlloc(_numChannels, _numFrames);> }
	BufClear { :bufnum | <primitive: return sc.BufClear(_bufnum);> }
	BufRec { :bufnum :reset :inputArray | <primitive: return sc.BufRec(_bufnum, _reset, _inputArray);> }
	BufWrite { :bufnum :phase :loop :inputArray | <primitive: return sc.BufWrite(_bufnum, _phase, _loop, _inputArray);> }
	Changed { :input :threshold | <primitive: return sc.Changed(_input, _threshold);> }
	ControlIn { :numChannels :bus | <primitive: return sc.ControlIn(_numChannels, _bus);> }
	ControlOut { :bus :channelsArray | <primitive: return sc.ControlOut(_bus, _channelsArray);> }
	DelayTap { :bufnum :delayTime | <primitive: return sc.DelayTap(_bufnum, _delayTime);> }
	DelayWrite { :bufnum :input | <primitive: return sc.DelayWrite(_bufnum, _input);> }
	DmdFor { :dur :reset :level | <primitive: return sc.DmdFor(_dur, _reset, _level);> }
	DynRingzBank { :input :freq :amp :time | <primitive: return sc.DynRingzBank(_input, _freq, _amp, _time);> }
	InFb { :numChannels :bus | <primitive: return sc.InFb(_numChannels, _bus);> }
	LinSeg { :gate :coordArray | <primitive: return sc.LinSeg(_gate, _coordArray);> }
	Ln { :start :end :dur | <primitive: return sc.Ln(_start, _end, _dur);> }
	Perc { :trig :attackTime :releaseTime :curve | <primitive: return sc.Perc(_trig, _attackTime, _releaseTime, _curve);> }
	PingPongDelay { :left :right :maxDelayTime :delayTime :feedback | <primitive: return sc.PingPongDelay(_left, _right, _maxDelayTime, _delayTime, _feedback);> }
	PmOsc { :carfreq :modfreq :pmindex :modphase | <primitive: return sc.PmOsc(_carfreq, _modfreq, _pmindex, _modphase);> }
	Release { :input :attackTime :dur :releaseTime | <primitive: return sc.Release(_input, _attackTime, _dur, _releaseTime);> }
	RingzBank { :input :freq :amp :time | <primitive: return sc.RingzBank(_input, _freq, _amp, _time);> }
	Select2 { :predicate :ifTrue :ifFalse | <primitive: return sc.Select2(_predicate, _ifTrue, _ifFalse);> }
	SelectX { :which :array | <primitive: return sc.SelectX(_which, _array);> }
	SfDur { :sfBufferArray |<primitive: return sc.SfDur(_sfBufferArray);> }
	SfFrames { :sfBufferArray |<primitive: return sc.SfFrames(_sfBufferArray);> }
	SfPlay { :sfBufferArray :rate :trigger :startPos :loop |<primitive: return sc.SfPlay(_sfBufferArray, _rate, _trigger, _startPos, _loop);> }
	SfRateScale { :sfBufferArray |<primitive: return sc.SfRateScale(_sfBufferArray);> }
	SfRead { :sfBufferArray :phase :loop :interpolation |<primitive: return sc.SfRead(_sfBufferArray, _phase, _loop, _interpolation);> }
	SfSampleRate { :sfBufferArray |<primitive: return sc.SfSampleRate(_sfBufferArray);> }
	Shuf { :repeats :list | <primitive: return sc.Shuf(_repeats, _list);> }
	SinOscBank { :freq :amp :phase | <primitive: return sc.SinOscBank(_freq, _amp, _phase);> }
	Sine { :trig :dur | <primitive: return sc.Sine(_trig, _dur);> }
	Splay { :inArray :spread :level :center :levelComp | <primitive: return sc.Splay(_inArray, _spread, _level, _center, _levelComp);> }
	Splay2 { :inArray | <primitive: return sc.Splay2(_inArray);> }
	TChoose { :trig :array | <primitive: return sc.TChoose(_trig, _array);> }
	TDmdFor { :dur :reset :level | <primitive: return sc.TDmdFor(_dur, _reset, _level);> }
	TDmdFor { :dur :reset :level | <primitive: return sc.TDmdFor(_dur, _reset, _level);> }
	TLine { :start :end :dur :trig | <primitive: return sc.TLine(_start, _end, _dur, _trig);> }
	TxLine { :start :end :dur :trig | <primitive: return sc.TxLine(_start, _end, _dur, _trig);> }
	VarLag { :input :time :curve | <primitive: return sc.VarLag(_input, _time, _curve);> }
	XChoose { :repeats :list | <primitive: return sc.XChoose(_repeats, _list);> }
	XLn { :start :end :dur | <primitive: return sc.XLn(_start, _end, _dur);> }

}
