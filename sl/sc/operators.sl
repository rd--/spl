+ Ugen {

(*
	ceiling { :self | <primitive: return sc.Ceil(_self);> }
	fractionPart { :self | <primitive: return sc.Frac(_self);> }
	negated { :self | <primitive: return sc.Neg(_self);> }
	reciprocal { :self | <primitive: return sc.Recip(_self);> }
	rounded { :self | RoundTo(self, 1) }
*)

	bitShiftLeft { :self :anObject | <primitive: return sc.ShiftLeft(_self, _anObject);> }
	bitShiftRight { :self :anObject | <primitive: return sc.ShiftRight(_self, _anObject);> }
	truncateTo { :self :anObject | <primitive: return sc.Trunc(_self, _anObject);> }

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
	** { :self :anObject | <primitive: return sc.Pow(_self, _anObject);> }
	<< { :self :anObject | <primitive: return sc.ShiftLeft(_self, _anObject);> }
	>> { :self :anObject | <primitive: return sc.ShiftRight(_self, _anObject);> }

}

+ Object {

	(* Auto-generated *)
	Neg { :self | <primitive: return sc.Neg(_self);> }
	Abs { :self | <primitive: return sc.Abs(_self);> }
	Ceil { :self | <primitive: return sc.Ceil(_self);> }
	Floor { :self | <primitive: return sc.Floor(_self);> }
	Frac { :self | <primitive: return sc.Frac(_self);> }
	Sign { :self | <primitive: return sc.Sign(_self);> }
	Squared { :self | <primitive: return sc.Squared(_self);> }
	Cubed { :self | <primitive: return sc.Cubed(_self);> }
	Sqrt { :self | <primitive: return sc.Sqrt(_self);> }
	Exp { :self | <primitive: return sc.Exp(_self);> }
	Recip { :self | <primitive: return sc.Recip(_self);> }
	MidiCps { :self | <primitive: return sc.MidiCps(_self);> }
	CpsMidi { :self | <primitive: return sc.CpsMidi(_self);> }
	MidiRatio { :self | <primitive: return sc.MidiRatio(_self);> }
	RatioMidi { :self | <primitive: return sc.RatioMidi(_self);> }
	DbAmp { :self | <primitive: return sc.DbAmp(_self);> }
	AmpDb { :self | <primitive: return sc.AmpDb(_self);> }
	Log { :self | <primitive: return sc.Log(_self);> }
	Log2 { :self | <primitive: return sc.Log2(_self);> }
	Log10 { :self | <primitive: return sc.Log10(_self);> }
	Sin { :self | <primitive: return sc.Sin(_self);> }
	Cos { :self | <primitive: return sc.Cos(_self);> }
	Tan { :self | <primitive: return sc.Tan(_self);> }
	Tanh { :self | <primitive: return sc.Tanh(_self);> }
	Distort { :self | <primitive: return sc.Distort(_self);> }
	SoftClip { :self | <primitive: return sc.SoftClip(_self);> }

	(* Auto-generated *)
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
	Hypot { :self :anObject | <primitive: return sc.Hypot(_self, _anObject);> }
	Pow { :self :anObject | <primitive: return sc.Pow(_self, _anObject);> }
	ShiftLeft { :self :anObject | <primitive: return sc.ShiftLeft(_self, _anObject);> }
	ShiftRight { :self :anObject | <primitive: return sc.ShiftRight(_self, _anObject);> }
	AmClip { :self :anObject | <primitive: return sc.AmClip(_self, _anObject);> }
	ScaleNeg { :self :anObject | <primitive: return sc.ScaleNeg(_self, _anObject);> }
	Clip2 { :self :anObject | <primitive: return sc.Clip2(_self, _anObject);> }
	Fold2 { :self :anObject | <primitive: return sc.Fold2(_self, _anObject);> }
	Wrap2 { :self :anObject | <primitive: return sc.Wrap2(_self, _anObject);> }
	RandRange { :self :anObject | <primitive: return sc.RandRange(_self, _anObject);> }
	ExpRandRange { :self :anObject | <primitive: return sc.ExpRandRange(_self, _anObject);> }

}
