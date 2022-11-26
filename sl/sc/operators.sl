+ Ugen {

	abs { :self | <primitive: return sc.abs(_self);> }
	arcCos { :self | <primitive: return sc.arcCos(_self);> }
	arcSin { :self | <primitive: return sc.arcSin(_self);> }
	arcTan { :self | <primitive: return sc.arcTan(_self);> }
	ceiling { :self | <primitive: return sc.ceil(_self);> }
	cos { :self | <primitive: return sc.cos(_self);> }
	cosh { :self | <primitive: return sc.cosh(_self);> }
	cubed { :self | <primitive: return sc.cubed(_self);> }
	exp { :self | <primitive: return sc.exp(_self);> }
	floor { :self | <primitive: return sc.floor(_self);> }
	fractionPart { :self | <primitive: return sc.frac(_self);> }
	midiCps { :self | <primitive: return sc.midiCps(_self);> }
	negated { :self | <primitive: return sc.neg(_self);> }
	reciprocal { :self | <primitive: return sc.recip(_self);> }
	sin { :self | <primitive: return sc.sin(_self);> }
	sinh { :self | <primitive: return sc.sinh(_self);> }
	sqrt { :self | <primitive: return sc.sqrt(_self);> }
	squared { :self | <primitive: return sc.squared(_self);> }
	tan { :self | <primitive: return sc.tan(_self);> }
	tanh { :self | <primitive: return sc.tanh(_self);> }
	bitShiftLeft { :self :anObject | <primitive: return sc.shiftLeft(_self, _anObject);> }
	bitShiftRight { :self :anObject | <primitive: return sc.shiftRight(_self, _anObject);> }
	bitAnd { :self :anObject | <primitive: return sc.bitAnd(_self, _anObject);> }
	bitOr { :self :anObject | <primitive: return sc.bitOr(_self, _anObject);> }
	bitXor { :self :anObject | <primitive: return sc.bitXor(_self, _anObject);> }

	+ { :self :anObject | <primitive: return sc.add(_self, _anObject);> }
	* { :self :anObject | <primitive: return sc.mul(_self, _anObject);> }
	- { :self :anObject | <primitive: return sc.sub(_self, _anObject);> }
	/ { :self :anObject | <primitive: return sc.fdiv(_self, _anObject);> }
	% { :self :anObject | <primitive: return sc.mod(_self, _anObject);> }
	= { :self :anObject | <primitive: return sc.eq(_self, _anObject);> }
	~= { :self :anObject | <primitive: return sc.ne(_self, _anObject);> }
	< { :self :anObject | <primitive: return sc.lt(_self, _anObject);> }
	> { :self :anObject | <primitive: return sc.gt(_self, _anObject);> }
	<= { :self :anObject | <primitive: return sc.le(_self, _anObject);> }
	>= { :self :anObject | <primitive: return sc.ge(_self, _anObject);> }
	** { :self :anObject | <primitive: return sc.pow(_self, _anObject);> }
	<< { :self :anObject | <primitive: return sc.shiftLeft(_self, _anObject);> }
	>> { :self :anObject | <primitive: return sc.shiftRight(_self, _anObject);> }

	bitAnd { :self :anObject | <primitive: return sc.bitAnd(_self, _anObject);> }
	min { :self :anObject | <primitive: return sc.min(_self, _anObject);> }
	max { :self :anObject | <primitive: return sc.max(_self, _anObject);> }
	truncateTo { :self :anObject | <primitive: return sc.trunc(_self, _anObject);> }
	roundTo { :self :anObject | <primitive: return sc.roundTo(_self, _anObject);> }

}

+ Object {

	Neg { :self | <primitive: return sc.neg(_self);> }
	Not { :self | <primitive: return sc.not(_self);> }
	BitNot { :self | <primitive: return sc.bitNot(_self);> }
	Abs { :self | <primitive: return sc.abs(_self);> }
	AsInt { :self | <primitive: return sc.asInt(_self);> }
	Ceil { :self | <primitive: return sc.ceil(_self);> }
	Floor { :self | <primitive: return sc.floor(_self);> }
	Frac { :self | <primitive: return sc.frac(_self);> }
	Sign { :self | <primitive: return sc.sign(_self);> }
	Squared { :self | <primitive: return sc.squared(_self);> }
	Cubed { :self | <primitive: return sc.cubed(_self);> }
	Sqrt { :self | <primitive: return sc.sqrt(_self);> }
	Exp { :self | <primitive: return sc.exp(_self);> }
	Recip { :self | <primitive: return sc.recip(_self);> }
	MidiCps { :self | <primitive: return sc.midiCps(_self);> }
	CpsMidi { :self | <primitive: return sc.cpsMidi(_self);> }
	MidiRatio { :self | <primitive: return sc.midiRatio(_self);> }
	RatioMidi { :self | <primitive: return sc.ratioMidi(_self);> }
	DbAmp { :self | <primitive: return sc.dbAmp(_self);> }
	AmpDb { :self | <primitive: return sc.ampDb(_self);> }
	OctCps { :self | <primitive: return sc.octCps(_self);> }
	CpsOct { :self | <primitive: return sc.cpsOct(_self);> }
	Log { :self | <primitive: return sc.log(_self);> }
	Log2 { :self | <primitive: return sc.log2(_self);> }
	Log10 { :self | <primitive: return sc.log10(_self);> }
	Sin { :self | <primitive: return sc.sin(_self);> }
	Cos { :self | <primitive: return sc.cos(_self);> }
	Tan { :self | <primitive: return sc.tan(_self);> }
	ArcSin { :self | <primitive: return sc.arcSin(_self);> }
	ArcCos { :self | <primitive: return sc.arcCos(_self);> }
	ArcTan { :self | <primitive: return sc.arcTan(_self);> }
	Sinh { :self | <primitive: return sc.sinh(_self);> }
	Cosh { :self | <primitive: return sc.cosh(_self);> }
	Tanh { :self | <primitive: return sc.tanh(_self);> }
	Distort { :self | <primitive: return sc.distort(_self);> }
	SoftClip { :self | <primitive: return sc.softClip(_self);> }

	Add { :self :anObject | <primitive: return sc.add(_self, _anObject);> }
	Sub { :self :anObject | <primitive: return sc.sub(_self, _anObject);> }
	Mul { :self :anObject | <primitive: return sc.mul(_self, _anObject);> }
	Idiv { :self :anObject | <primitive: return sc.idiv(_self, _anObject);> }
	Fdiv { :self :anObject | <primitive: return sc.fdiv(_self, _anObject);> }
	Mod { :self :anObject | <primitive: return sc.mod(_self, _anObject);> }
	Eq { :self :anObject | <primitive: return sc.eq(_self, _anObject);> }
	Ne { :self :anObject | <primitive: return sc.ne(_self, _anObject);> }
	Lt { :self :anObject | <primitive: return sc.lt(_self, _anObject);> }
	Gt { :self :anObject | <primitive: return sc.gt(_self, _anObject);> }
	Le { :self :anObject | <primitive: return sc.le(_self, _anObject);> }
	Ge { :self :anObject | <primitive: return sc.ge(_self, _anObject);> }
	Min { :self :anObject | <primitive: return sc.min(_self, _anObject);> }
	Max { :self :anObject | <primitive: return sc.max(_self, _anObject);> }
	BitAnd { :self :anObject | <primitive: return sc.bitAnd(_self, _anObject);> }
	BitOr { :self :anObject | <primitive: return sc.bitOr(_self, _anObject);> }
	BitXor { :self :anObject | <primitive: return sc.bitXor(_self, _anObject);> }
	Lcm { :self :anObject | <primitive: return sc.lcm(_self, _anObject);> }
	Gcd { :self :anObject | <primitive: return sc.gcd(_self, _anObject);> }
	RoundTo { :self :anObject | <primitive: return sc.roundTo(_self, _anObject);> }
	RoundUp { :self :anObject | <primitive: return sc.roundUp(_self, _anObject);> }
	Trunc { :self :anObject | <primitive: return sc.trunc(_self, _anObject);> }
	Atan2 { :self :anObject | <primitive: return sc.atan2(_self, _anObject);> }
	Hypot { :self :anObject | <primitive: return sc.hypot(_self, _anObject);> }
	Hypotx { :self :anObject | <primitive: return sc.hypotx(_self, _anObject);> }
	Pow { :self :anObject | <primitive: return sc.pow(_self, _anObject);> }
	ShiftLeft { :self :anObject | <primitive: return sc.shiftLeft(_self, _anObject);> }
	ShiftRight { :self :anObject | <primitive: return sc.shiftRight(_self, _anObject);> }
	UnsignedShift { :self :anObject | <primitive: return sc.unsignedShift(_self, _anObject);> }
	Ring1 { :self :anObject | <primitive: return sc.ring1(_self, _anObject);> }
	Ring2 { :self :anObject | <primitive: return sc.ring2(_self, _anObject);> }
	Ring3 { :self :anObject | <primitive: return sc.ring3(_self, _anObject);> }
	Ring4 { :self :anObject | <primitive: return sc.ring4(_self, _anObject);> }
	DifSqr { :self :anObject | <primitive: return sc.difSqr(_self, _anObject);> }
	SumSqr { :self :anObject | <primitive: return sc.sumSqr(_self, _anObject);> }
	SqrSum { :self :anObject | <primitive: return sc.sqrSum(_self, _anObject);> }
	SqrDif { :self :anObject | <primitive: return sc.sqrDif(_self, _anObject);> }
	AbsDif { :self :anObject | <primitive: return sc.absDif(_self, _anObject);> }
	Thresh { :self :anObject | <primitive: return sc.thresh(_self, _anObject);> }
	AmClip { :self :anObject | <primitive: return sc.amClip(_self, _anObject);> }
	ScaleNeg { :self :anObject | <primitive: return sc.scaleNeg(_self, _anObject);> }
	Clip2 { :self :anObject | <primitive: return sc.clip2(_self, _anObject);> }
	Fold2 { :self :anObject | <primitive: return sc.fold2(_self, _anObject);> }
	Wrap2 { :self :anObject | <primitive: return sc.wrap2(_self, _anObject);> }

}
