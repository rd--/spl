+ Ugen {

	abs { :self | <primitive: return sc.Abs(_self);> }
	arcCos { :self | <primitive: return sc.ArcCos(_self);> }
	arcSin { :self | <primitive: return sc.ArcSin(_self);> }
	arcTan { :self | <primitive: return sc.ArcTan(_self);> }
	ceiling { :self | <primitive: return sc.Ceil(_self);> }
	cos { :self | <primitive: return sc.Cos(_self);> }
	cosh { :self | <primitive: return sc.Cosh(_self);> }
	cubed { :self | <primitive: return sc.Cubed(_self);> }
	exp { :self | <primitive: return sc.Exp(_self);> }
	floor { :self | <primitive: return sc.Floor(_self);> }
	fractionPart { :self | <primitive: return sc.Frac(_self);> }
	negated { :self | <primitive: return sc.Neg(_self);> }
	reciprocal { :self | <primitive: return sc.Recip(_self);> }
	sin { :self | <primitive: return sc.Sin(_self);> }
	sinh { :self | <primitive: return sc.Sinh(_self);> }
	sqrt { :self | <primitive: return sc.Sqrt(_self);> }
	squared { :self | <primitive: return sc.Squared(_self);> }
	tan { :self | <primitive: return sc.Tan(_self);> }
	tanh { :self | <primitive: return sc.Tanh(_self);> }

	bitShiftLeft { :self :anObject | <primitive: return sc.ShiftLeft(_self, _anObject);> }
	bitShiftRight { :self :anObject | <primitive: return sc.ShiftRight(_self, _anObject);> }
	bitAnd { :self :anObject | <primitive: return sc.BitAnd(_self, _anObject);> }
	bitOr { :self :anObject | <primitive: return sc.BitOr(_self, _anObject);> }
	bitXor { :self :anObject | <primitive: return sc.BitXor(_self, _anObject);> }
	min { :self :anObject | <primitive: return sc.Min(_self, _anObject);> }
	max { :self :anObject | <primitive: return sc.Max(_self, _anObject);> }
	truncateTo { :self :anObject | <primitive: return sc.Trunc(_self, _anObject);> }
	roundTo { :self :anObject | <primitive: return sc.RoundTo(_self, _anObject);> }

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

	Neg { :self | <primitive: return sc.Neg(_self);> }
	Not { :self | <primitive: return sc.Not(_self);> }
	IsNil { :self | <primitive: return sc.IsNil(_self);> }
	NotNil { :self | <primitive: return sc.NotNil(_self);> }
	BitNot { :self | <primitive: return sc.BitNot(_self);> }
	Abs { :self | <primitive: return sc.Abs(_self);> }
	AsFloat { :self | <primitive: return sc.AsFloat(_self);> }
	AsInt { :self | <primitive: return sc.AsInt(_self);> }
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
	OctCps { :self | <primitive: return sc.OctCps(_self);> }
	CpsOct { :self | <primitive: return sc.CpsOct(_self);> }
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
	Rand2 { :self | <primitive: return sc.Rand2(_self);> }
	BiLinRand { :self | <primitive: return sc.BiLinRand(_self);> }
	Sum3Rand { :self | <primitive: return sc.Sum3Rand(_self);> }
	Distort { :self | <primitive: return sc.Distort(_self);> }
	SoftClip { :self | <primitive: return sc.SoftClip(_self);> }
	Coin { :self | <primitive: return sc.Coin(_self);> }
	DigitValue { :self | <primitive: return sc.DigitValue(_self);> }
	Silence { :self | <primitive: return sc.Silence(_self);> }
	Thru { :self | <primitive: return sc.Thru(_self);> }
	RectWindow { :self | <primitive: return sc.RectWindow(_self);> }
	HanWindow { :self | <primitive: return sc.HanWindow(_self);> }
	WelchWindow { :self | <primitive: return sc.WelchWindow(_self);> }
	TriWindow { :self | <primitive: return sc.TriWindow(_self);> }
	Scurve { :self | <primitive: return sc.Scurve(_self);> }

	Add { :self :anObject | <primitive: return sc.Add(_self, _anObject);> }
	Sub { :self :anObject | <primitive: return sc.Sub(_self, _anObject);> }
	Mul { :self :anObject | <primitive: return sc.Mul(_self, _anObject);> }
	Idiv { :self :anObject | <primitive: return sc.Idiv(_self, _anObject);> }
	Fdiv { :self :anObject | <primitive: return sc.Fdiv(_self, _anObject);> }
	Mod { :self :anObject | <primitive: return sc.Mod(_self, _anObject);> }
	Eq { :self :anObject | <primitive: return sc.Eq(_self, _anObject);> }
	Ne { :self :anObject | <primitive: return sc.Ne(_self, _anObject);> }
	Lt { :self :anObject | <primitive: return sc.Lt(_self, _anObject);> }
	Gt { :self :anObject | <primitive: return sc.Gt(_self, _anObject);> }
	Le { :self :anObject | <primitive: return sc.Le(_self, _anObject);> }
	Ge { :self :anObject | <primitive: return sc.Ge(_self, _anObject);> }
	Min { :self :anObject | <primitive: return sc.Min(_self, _anObject);> }
	Max { :self :anObject | <primitive: return sc.Max(_self, _anObject);> }
	BitAnd { :self :anObject | <primitive: return sc.BitAnd(_self, _anObject);> }
	BitOr { :self :anObject | <primitive: return sc.BitOr(_self, _anObject);> }
	BitXor { :self :anObject | <primitive: return sc.BitXor(_self, _anObject);> }
	Lcm { :self :anObject | <primitive: return sc.Lcm(_self, _anObject);> }
	Gcd { :self :anObject | <primitive: return sc.Gcd(_self, _anObject);> }
	RoundTo { :self :anObject | <primitive: return sc.RoundTo(_self, _anObject);> }
	RoundUp { :self :anObject | <primitive: return sc.RoundUp(_self, _anObject);> }
	Trunc { :self :anObject | <primitive: return sc.Trunc(_self, _anObject);> }
	Atan2 { :self :anObject | <primitive: return sc.Atan2(_self, _anObject);> }
	Hypot { :self :anObject | <primitive: return sc.Hypot(_self, _anObject);> }
	Hypotx { :self :anObject | <primitive: return sc.Hypotx(_self, _anObject);> }
	Pow { :self :anObject | <primitive: return sc.Pow(_self, _anObject);> }
	ShiftLeft { :self :anObject | <primitive: return sc.ShiftLeft(_self, _anObject);> }
	ShiftRight { :self :anObject | <primitive: return sc.ShiftRight(_self, _anObject);> }
	UnsignedShift { :self :anObject | <primitive: return sc.UnsignedShift(_self, _anObject);> }
	Fill { :self :anObject | <primitive: return sc.Fill(_self, _anObject);> }
	Ring1 { :self :anObject | <primitive: return sc.Ring1(_self, _anObject);> }
	Ring2 { :self :anObject | <primitive: return sc.Ring2(_self, _anObject);> }
	Ring3 { :self :anObject | <primitive: return sc.Ring3(_self, _anObject);> }
	Ring4 { :self :anObject | <primitive: return sc.Ring4(_self, _anObject);> }
	DifSqr { :self :anObject | <primitive: return sc.DifSqr(_self, _anObject);> }
	SumSqr { :self :anObject | <primitive: return sc.SumSqr(_self, _anObject);> }
	SqrSum { :self :anObject | <primitive: return sc.SqrSum(_self, _anObject);> }
	SqrDif { :self :anObject | <primitive: return sc.SqrDif(_self, _anObject);> }
	AbsDif { :self :anObject | <primitive: return sc.AbsDif(_self, _anObject);> }
	Thresh { :self :anObject | <primitive: return sc.Thresh(_self, _anObject);> }
	AmClip { :self :anObject | <primitive: return sc.AmClip(_self, _anObject);> }
	ScaleNeg { :self :anObject | <primitive: return sc.ScaleNeg(_self, _anObject);> }
	Clip2 { :self :anObject | <primitive: return sc.Clip2(_self, _anObject);> }
	Excess { :self :anObject | <primitive: return sc.Excess(_self, _anObject);> }
	Fold2 { :self :anObject | <primitive: return sc.Fold2(_self, _anObject);> }
	Wrap2 { :self :anObject | <primitive: return sc.Wrap2(_self, _anObject);> }
	FirstArg { :self :anObject | <primitive: return sc.FirstArg(_self, _anObject);> }
	RandRange { :self :anObject | <primitive: return sc.RandRange(_self, _anObject);> }
	ExpRandRange { :self :anObject | <primitive: return sc.ExpRandRange(_self, _anObject);> }

}
