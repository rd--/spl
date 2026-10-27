/* Requires: Frequency */

+@Frequency {

	linearOctave { :self |
		(self.inHertz * (1 / 440)).log2 + 4.75
	}

	midiNoteNumber { :self |
		(self.inHertz * (1 / 440)).log2 * 12 + 69
	}

	octavePitchClass { :self |
		self.midiNoteNumber.midiNoteNumberToOctavePitchClass
	}

}

+@Number {

	cpsCv { :f :f0 |
		(f / f0).log2
	}

	cpsCv { :f |
		(f / 261.6256).log2
	}

	cvCps { :v :f0 |
		f0 * (2 ^ v)
	}

	cvCps { :v |
		261.6256 * (2 ^ v)
	}

	linearOctave { :self |
		(440 * (2 ^ (self - 4.75))).hertz
	}

	midiNoteNumber { :self |
		(440 * (2 ^ ((self - 69) * (1 / 12)))).hertz
	}

	midiNoteNumberToOctavePitchClass { :self |
		let octave = (self / 12).floor - 1;
		let zero = (octave + 1) * 12;
		let pitchClass = (self - zero) / 100;
		octave + pitchClass
	}

	octavePitchClass { :self |
		self.octavePitchClassToMidiNoteNumber.midiNoteNumber
	}

	octavePitchClassToMidiNoteNumber { :self |
		let octave = self.floor;
		let pitchClass = (self - octave) * 100;
		(octave + 1) * 12 + pitchClass
	}

}

+@Frequency {

	cps { :self |
		self.inHertz
	}

	midi { :self |
		self.midiNoteNumber
	}

	oct { :self |
		self.linearOctave
	}

	pch { :self |
		self.octavePitchClass
	}

}

+@Number {

	cps { :self |
		self.hertz
	}

	midi { :self |
		self.midiNoteNumber
	}

	oct { :self |
		self.linearOctave
	}

	pch { :self |
		self.octavePitchClass
	}

}

+@Number {

	cancelFlat { :self |
		self + 0.1
	}

	cancelSharp { :self |
		self - 0.1
	}

	flat { :self |
		self - 0.1
	}

	quarterToneFlat { :self |
		self - 0.05
	}

	quarterToneSharp { :self |
		self + 0.05
	}

	sharp { :self |
		self + 0.1
	}

}

+@Collect {

	cpsCv { :self |
		self.collect(cpsCv/1)
	}

	cpsCv { :self :f0 |
		self.collect { :f |
			(f / f0).log2
		}
	}

	cvCps { :self |
		self.collect(cvCps/1)
	}

	cvCps { :self :f0 |
		self.collect { :v |
			f0 * (2 ^ v)
		}
	}

}
