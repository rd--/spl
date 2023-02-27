+ @Collection {

	abs { :self | self.collect(abs:/1) }
	acos { :self | self.collect(acos:/1) }
	asin { :self | self.collect(asin:/1) }
	atan { :self | self.collect(atan:/1) }
	ceiling { :self | self.collect(ceiling:/1) }
	cos { :self | self.collect(cos:/1) }
	cosh { :self | self.collect(cosh:/1) }
	cubed { :self | self.collect(cubed:/1) }
	exp { :self | self.collect(exp:/1) }
	floor { :self | self.collect(floor:/1) }
	fractionPart { :self | self.collect(fractionPart:/1) }
	log { :self | self.collect(log:/1) }
	log10 { :self | self.collect(log10:/1) }
	log2 { :self | self.collect(log2:/1) }
	negated { :self | self.collect(negated:/1) }
	rounded { :self | self.collect(rounded:/1) }
	sin { :self | self.collect(sin:/1) }
	sinh { :self | self.collect(sinh:/1) }
	sqrt { :self | self.collect(sqrt:/1) }
	squared { :self | self.collect(squared:/1) }
	tan { :self | self.collect(tan:/1) }
	tanh { :self | self.collect(tanh:/1) }

	AmpDb { :self | self.collect(AmpDb:/1) }
	DbAmp { :self | self.collect(DbAmp:/1) }
	MidiCps { :self | self.collect(MidiCps:/1) }

	collectTexture { :self :aProcedure:/1 :delay |
		workspace::clock.collectTexture(
			self,
			aProcedure:/1,
			delay
		)
	}

}
