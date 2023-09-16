(* {"requires": ["Frequency"]} *)

+Frequency {

	linearOctave { :self |
		(self.hertz * (1 / 440)).log2 + 4.75
	}

	midiNoteNumber { :self |
		(self.hertz * (1 / 440)).log2 * 12 + 69
	}

	octavePitchClass { :self |
		self.midiNoteNumber.midiNoteNumberToOctavePitchClass
	}

}

+@Number {

	linearOctave { :self |
		(440 * (2 ^ (self - 4.75))).hertz
	}

	midiNoteNumber { :self |
		(440 * (2 ^ ((self - 69) * (1 / 12)))).hertz
	}

	midiNoteNumberToOctavePitchClass { :self |
		|(
			octave = (self / 12).floor - 1,
			zero = (octave + 1) * 12,
			pitchClass = (self - zero) / 100
		)|
		octave + pitchClass
	}

	octavePitchClass { :self |
		self.octavePitchClassToMidiNoteNumber.midiNoteNumber
	}

	octavePitchClassToMidiNoteNumber { :self |
		|(
			octave = self.floor,
			pitchClass = (self - octave) * 100
		)|
		(octave + 1) * 12 + pitchClass
	}

}

(* csound naming *)
+Frequency {

	cps { :self |
		self.hertz
	}

	midi { :self |
		self.midiNoteNumber
	}

	pch { :self |
		self.octavePitchClass
	}

	oct { :self |
		self.linearOctave
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

	flat { :self |
		self - 0.1
	}

	sharp { :self |
		self + 0.1
	}

	quarterToneFlat { :self |
		self - 0.05
	}

	quarterToneSharp { :self |
		self + 0.05
	}

}
