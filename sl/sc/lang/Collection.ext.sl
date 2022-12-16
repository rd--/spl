+ @Collection {

	abs { :self | self.collect(abs) }
	ceiling { :self | self.collect(ceiling) }
	cos { :self | self.collect(cos) }
	cubed { :self | self.collect(cubed) }
	exp { :self | self.collect(exp) }
	floor { :self | self.collect(floor) }
	fractionPart { :self | self.collect(fractionPart) }
	log { :self | self.collect(log) }
	log10 { :self | self.collect(log10) }
	log2 { :self | self.collect(log2) }
	negated { :self | self.collect(negated) }
	rounded { :self | self.collect(rounded) }
	sin { :self | self.collect(sin) }
	sqrt { :self | self.collect(sqrt) }
	squared { :self | self.collect(squared) }
	tanh { :self | self.collect(tanh) }

	AmpDb { :self | self.collect(AmpDb) }
	DbAmp { :self | self.collect(DbAmp) }
	MidiCps { :self | self.collect(MidiCps) }

}
