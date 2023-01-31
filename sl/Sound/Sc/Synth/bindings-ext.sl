(* Auto-generated *)
+ [Array, Number, Ugen] {
	AnalogFoldOsc { :freq :amp | <primitive: return sc.AnalogFoldOsc(_freq, _amp);> }
	Bezier { :haltAfter :dx :freq :phase :param | <primitive: return sc.Bezier(_haltAfter, _dx, _freq, _phase, _param);> }
	CrossoverDistortion { :in :amp :smooth | <primitive: return sc.CrossoverDistortion(_in, _amp, _smooth);> }
	dfm1 { :in :freq :res :inputgain :type :noiselevel | <primitive: return sc.dfm1(_in, _freq, _res, _inputgain, _type, _noiselevel);> }
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
	MiRings { :in :trig :pit :struct :bright :damp :pos :model :poly :internExciter :easteregg :bypass | <primitive: return sc.MiRings(_in, _trig, _pit, _struct, _bright, _damp, _pos, _model, _poly, _intern_exciter, _easteregg, _bypass);> }
	MoogLadder { :in :ffreq :res | <primitive: return sc.MoogLadder(_in, _ffreq, _res);> }
	ObxdFilter { :in :cutoff :resonance :multimode :bandpass :fourpole | <primitive: return sc.ObxdFilter(_in, _cutoff, _resonance, _multimode, _bandpass, _fourpole);> }
	Perlin3 { :x :y :z | <primitive: return sc.Perlin3(_x, _y, _z);> }
	Rcd { :clock :rotate :reset :div :spread :auto :len :down :gates | <primitive: return sc.Rcd(_clock, _rotate, _reset, _div, _spread, _auto, _len, _down, _gates);> }
	RandN { :numChan :lo :hi | <primitive: return sc.RandN(_numChan, _lo, _hi);> }
	Scm { :clock :bpm :rotate :slip :shuffle :skip :pw | <primitive: return sc.Scm(_clock, _bpm, _rotate, _slip, _shuffle, _skip, _pw);> }
	SinGrain { :trigger :dur :freq | <primitive: return sc.SinGrain(_trigger, _dur, _freq);> }
	SvfBp { :in :freq :q | <primitive: return sc.SvfBp(_in, _freq, _q);> }
	SvfHp { :in :freq :q | <primitive: return sc.SvfHp(_in, _freq, _q);> }
	SvfLp { :in :freq :q | <primitive: return sc.SvfLp(_in, _freq, _q);> }
	TLinRand { :lo :hi :minmax :trigger | <primitive: return sc.TLinRand(_lo, _hi, _minmax, _trigger);> }
	TScramble { :trigger :inputs | <primitive: return sc.TScramble(_trigger, _inputs);> }
	VbJonVerb { :in :decay :damping :inputbw :erfl :tail | <primitive: return sc.VbJonVerb(_in, _decay, _damping, _inputbw, _erfl, _tail);> }
	Vosim { :trig :freq :nCycles :decay | <primitive: return sc.Vosim(_trig, _freq, _nCycles, _decay);> }
	WaveLoss { :in :drop :outof :mode | <primitive: return sc.WaveLoss(_in, _drop, _outof, _mode);> }
}
