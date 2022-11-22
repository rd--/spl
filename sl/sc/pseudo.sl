+ Object {

	TrExpRand { :trig :lo :hi | TExpRand(lo, hi, trig) }
	TrRand { :trig :lo :hi | TRand(lo, hi, trig) }

	LinLin { :self :srclo :srchi :dstlo :dsthi |
		| scale  = (dsthi - dstlo) / (srchi - srclo), offset = dstlo - (scale * srclo); |
		MulAdd(self, scale, offset)
	}

	clearBuf { :bufnum | <primitive: return sc.clearBuf(_bufnum);> }

	Asr { :gate :attackTime :releaseTime :curve | <primitive: return sc.Asr(_gate, _attackTime, _releaseTime, _curve);> }
	Adsr { :gate :attackTime :decayTime :sustainLevel :releaseTime :curve | <primitive: return sc.Adsr(_gate, _attackTime, _decayTime, _sustainLevel, _releaseTime, _curve);> }
	AudioIn { :channelsArray | <primitive: return sc.AudioIn(_channelsArray);> }
	BufAlloc { :numChannels :numFrames | <primitive: return sc.BufAlloc(_numChannels, _numFrames);> }
	BufRec { :bufnum :reset :inputArray | <primitive: return sc.BufRec(_bufnum, _reset, _inputArray);> }
	BufWrite { :bufnum :phase :loop :inputArray | <primitive: return sc.BufWrite(_bufnum, _phase, _loop, _inputArray);> }
	Choose { :repeats :list | <primitive: return sc.Choose(_repeats, _list);> }
	ControlIn { :numChan :bus | <primitive: return sc.ControlIn(_numChan, _bus);> }
	ControlOut { :bus :channelsArray | <primitive: return sc.ControlOut(_bus, _channelsArray);> }
	DelayTap { :bufnum :delayTime | <primitive: return sc.DelayTap(_bufnum, _delayTime);> }
	DelayWrite { :bufnum :input | <primitive: return sc.DelayWrite(_bufnum, _input);> }
	DmdFor { :dur :reset :level | <primitive: return sc.DmdFor(_dur, _reset, _level);> }
	DmdOn { :trig :reset :demandUGens | <primitive: return sc.DmdOn(_trig, _reset, _demandUGens);> }
	DynRingzBank { :input :freq :amp :time | <primitive: return sc.DynRingzBank(_input, _freq, _amp, _time);> }
	InFb { :numChannels :bus | <primitive: return sc.InFb(_numChannels, _bus);> }
	LinSeg { :gate :coordArray | <primitive: return sc.LinSeg(_gate, _coordArray);> }
	Ln { :start :end :dur | <primitive: return sc.Ln(_start, _end, _dur);> }
	PMOsc { :carfreq :modfreq :pmindex :modphase | <primitive: return sc.PMOsc(_carfreq, _modfreq, _pmindex, _modphase);> }
	Perc { :trig :attackTime :releaseTime :curve | <primitive: return sc.Perc(_trig, _attackTime, _releaseTime, _curve);> }
	Release { :input :attackTime :dur :releaseTime | <primitive: return sc.Release(_input, _attackTime, _dur, _releaseTime);> }
	RingzBank { :input :freq :amp :time | <primitive: return sc.RingzBank(_input, _freq, _amp, _time);> }
	Select2 { :predicate :ifTrue :ifFalse | <primitive: return sc.Select2(_predicate, _ifTrue, _ifFalse);> }
	SelectX { :which :array | <primitive: return sc.SelectX(_which, _array);> }
	Seq { :repeats :list | <primitive: return sc.Seq(_repeats, _list);> }
	Ser { :length :start :step | <primitive: return sc.Series(_length, _start, _step);> }
	Series { :repeats :list | <primitive: return sc.Ser(_repeats, _list);> }
	Shuf { :repeats :list | <primitive: return sc.Shuf(_repeats, _list);> }
	Sine { :trig :dur | <primitive: return sc.Sine(_trig, _dur);> }
	SinOscBank { :freq :amp :phase | <primitive: return sc.SinOscBank(_freq, _amp, _phase);> }
	Splay { :inArray :spread :level :center :levelComp | <primitive: return sc.Splay(_inArray, _spread, _level, _center, _levelComp);> }
	Splay2 { :inArray | <primitive: return sc.Splay2(_inArray);> }
	TChoose { :trig :array | <primitive: return sc.TChoose(_trig, _array);> }
	TDmdFor { :dur :reset :level | <primitive: return sc.TDmdFor(_dur, _reset, _level);> }
	TLine { :start :end :dur :trig | <primitive: return sc.TLine(_start, _end, _dur, _trig);> }
	TXLine { :start :end :dur :trig | <primitive: return sc.TXLine(_start, _end, _dur, _trig);> }
	White { :length :lo :hi | <primitive: return sc.White(_length, _lo, _hi);> }
	XChoose { :repeats :list | <primitive: return sc.XChoose(_repeats, _list);> }
	XLn { :start :end :dur | <primitive: return sc.XLn(_start, _end, _dur);> }

	range { :self :lo :hi | LinLin(self, -1, 1, lo, hi) }

}

+ Array {
	asLocalBuf { :anArray | <primitive: return sc.asLocalBuf(_anArray);> }
}
